<###
    The purpose of this script is to collect data about the AdminSDHolder for each domain in the forest and '
    then compare all security principals in each domain in the forest to that AdminSDHolder, looking for either
    an exact SD match or a match based on implicit ACEs and other characteristics to account for instances
    where inheritence is unfortunately enabled on the AdminSDHolder object.

    The output is a CSV file with rows expressing each security principal that was compared and columns providing
    data on each principal, including enough information to determine whether that object is a protected object.
###>

# Start a transcript
$datetime = Get-Date -F 'yyyyMMddHHmmss'
$hostname = hostname
$path = 'C:\Scripts'
$filename = "AdminSDHolderTests-${hostname}-${datetime}.txt"
$csvname = "AdminSDHolderTests-${hostname}-${datetime}.csv"
$transcript = (Join-Path -Path $path -ChildPath $filename).ToString()
$csv = (Join-Path -Path $path -ChildPath $csvname).ToString()
Start-Transcript -Path $transcript -NoClobber

# Define Classes
class SecurityPrincipal {
    [string]    $DistinguishedName
    [guid]      $ObjectGuid
    [string]    $ObjectSid
    [int]       $AdminCount
    [int]       $PrimaryGroupID
    [string]    $MemberOf
    [string]    $objectClass
    [string]    $SamAccountName
    [string]    $SDHash
    [string]    $Owner
    [bool]      $DaclProtected = $false
    [bool]      $SaclProtected = $false
    [bool]      $ExactSDMatch = $false
    [bool]      $ImplicitSDMatch = $false
    [int]       $ACECount
    [int]       $ImplicitACECount
    [string]  $Created
    [string]  $Modified

    SecurityPrincipal() {}
    SecurityPrincipal([hashtable]$Properties) { $this.Init($Properties) }

    [void]Init([hashtable]$Properties) {
        foreach ($Property in $Properties.Keys) {
            $this.$Property = $Properties.$Property
        }
    }
}

# Enumeration
$forest = Get-ADForest

# Arrayto store [SecurityPrincipal]Objects with final results
$allSecurityPrincipals = @()
$hashAlgorithm = [System.Security.Cryptography.SHA256]::Create()


# Loop through each domain in the forest
$allSecurityPrincipals = foreach ($domain in $forest.Domains) {
    $tempPath = "LDAP://" + $($domain)
    $dDistinguishedName = ([ADSI]$tempPath).distinguishedName[0]
    Write-Verbose "Domain DN: $dDistinguishedName $($dDistinguishedName.GetType())"
    $customParametersA = @{
        Identity   = "CN=AdminSDHolder,CN=System,$($dDistinguishedName)"
        Server     = $domain
        Properties = @('DistinguishedName', 'ObjectGUID', 'ObjectClass', 'nTSecurityDescriptor', 'Created', 'Modified', 'ProtectedFromAccidentalDeletion', 'SDRightsEffective')
    }
    # Collect information about the AdminSDHolder object for the domain
    $dAdminSDHolder = Get-ADObject @customParametersA
    # Hash the entire nTSecurityDescriptor
    $dAdminSDHolderSDBin = $dAdminSDHolder.nTSecurityDescriptor.GetSecurityDescriptorBinaryForm()
    $dAdminSDHolderSDHash = [System.BitConverter]::ToString($hashAlgorithm.ComputeHash($dAdminSDHolderSDBin))
    Write-Verbose "AdminSDHolder hash: $dAdminSDHolderSDHash"
    # Hashtable the combination of the Owner, DACLFlags, and Implicit ACEs
    $dAdminSDHolderACEs = $dAdminSDHolder.nTSecurityDescriptor.Access | Where-Object { $_.IsInherited -eq $false } | Sort-Object @{Expression = 'AccessControlType'; Ascending = $false }, @{Expression = 'IdentityReference'; Ascending = $true }, @{Expression = 'ActiveDirectoryRights'; Ascending = $true } | Select-Object -Property AccessControlType, IdentityReference, ActiveDirectoryRights, ObjectType, InheritedObjectType
    $dAdminSDHolderACEMatch = foreach ($ACE in $dAdminSDHolderACEs) {
        $ACE.AccessControlType.ToString() + $ACE.IdentityReference.ToString() + $ACE.ActiveDirectoryRights.ToString() + $ACE.ObjectType.ToString() + $ACE.InheritedObjectType.ToString()
    }
    $dAdminSDHolderImplicit = [ordered]@{
        Owner        = $dAdminSDHolder.nTSecurityDescriptor.Owner
        DaclProtect  = $dAdminSDHolder.nTSecurityDescriptor.AreAccessRulesProtected
        SaclProtect  = $dAdminSDHolder.nTSecurityDescriptor.AreAuditRulesProtected
        ImplicitACEs = $dAdminSDHolderACEMatch
    }

    # Collect all security principals in the domain
    $customParametersB = @{
        LDAPFilter  = "(|(objectClass=group)(objectClass=user))"
        SearchScope = 'Subtree'
        SearchBase  = $dDistinguishedName
        Server      = $domain
        Properties  = @('DistinguishedName', 'ObjectGUID', 'ObjectSid', 'AdminCount', 'PrimaryGroupID', 'MemberOf', 'ObjectClass',
            'SamAccountName', 'nTSecurityDescriptor', 'Created', 'Modified', 'ProtectedFromAccidentalDeletion', 'SDRightsEffective')
    }
    $dSecurityPrincipals = Get-ADObject @customParametersB
    # Loop through all security principals to add required info to PSCustomObject and then arraylist
    foreach ($dSecurityPrincipal in $dSecurityPrincipals) {
        # Hash the entire nTSecurityDescriptor
        $dSecurityPrincipalSDBin = $dSecurityPrincipal.nTSecurityDescriptor.GetSecurityDescriptorBinaryForm()
        $dSecurityPrincipalSDHash = [System.BitConverter]::ToString($hashAlgorithm.ComputeHash($dSecurityPrincipalSDBin))
        # Hashtable the combination of the Owner, DACLFlags, and Implicit ACEs
        $dSecurityPrincipalACEs = $dSecurityPrincipal.nTSecurityDescriptor.Access | Where-Object { $_.IsInherited -eq $false } | Sort-Object @{Expression = 'AccessControlType'; Ascending = $false }, @{Expression = 'IdentityReference'; Ascending = $true }, @{Expression = 'ActiveDirectoryRights'; Ascending = $true } | Select-Object -Property AccessControlType, IdentityReference, ActiveDirectoryRights, ObjectType, InheritedObjectType
        $dSecurityPrincipalACEMatch = foreach ($ACE in $dSecurityPrincipalACEs) {
            $ACE.AccessControlType.ToString() + $ACE.IdentityReference.ToString() + $ACE.ActiveDirectoryRights.ToString() + $ACE.ObjectType.ToString() + $ACE.InheritedObjectType.ToString()
        }
        $dSecurityPrincipalImplicit = [ordered]@{
            Owner        = $dSecurityPrincipal.nTSecurityDescriptor.Owner
            DaclProtect  = $dSecurityPrincipal.nTSecurityDescriptor.AreAccessRulesProtected
            SaclProtect  = $dSecurityPrincipal.nTSecurityDescriptor.AreAuditRulesProtected
            ImplicitACEs = $dSecurityPrincipalACEMatch
        }
        # Hashtable to create our object
        $hSecurityPrincipal = @{
            DistinguishedName = $dSecurityPrincipal.DistinguishedName
            ObjectGuid        = $dSecurityPrincipal.ObjectGuid
            ObjectSid         = $dSecurityPrincipal.ObjectSid
            AdminCount        = $dSecurityPrincipal.AdminCount
            PrimaryGroupID    = $dSecurityPrincipal.PrimaryGroupID
            MemberOf          = ($dSecurityPrincipal | Select-Object -ExpandProperty MemberOf) -join ";"
            objectClass       = $dSecurityPrincipal.objectClass
            SamAccountName    = $dSecurityPrincipal.SamAccountName
            SDHash            = $dSecurityPrincipalSDHash
            Owner             = $dSecurityPrincipal.nTSecurityDescriptor.Owner
            DaclProtected     = $dSecurityPrincipal.nTSecurityDescriptor.AreAccessRulesProtected
            SaclProtected     = $dSecurityPrincipal.nTSecurityDescriptor.AreAuditRulesProtected
            ACECount          = $dSecurityPrincipal.nTSecurityDescriptor.Access.Count
            ImplicitACECount  = ($dSecurityPrincipal.nTSecurityDescriptor.Access | Where-Object { $_.IsInherited -eq $false }).Count
            Created           = if ($null -ne $dSecurityPrincipal.Created) {
                $dSecurityPrincipal.Created.ToString()
            }
            else {
                'Never'
            }
            Modified          = if ($null -ne $dSecurityPrincipal.Modified) {
                $dSecurityPrincipal.Modified.ToString()
            }
            else {
                'Never'
            }
        }
        $oSecurityPrincipal = [SecurityPrincipal]::New($hSecurityPrincipal)
        if ($dSecurityPrincipalSDHash -eq $dAdminSDHolderSDHash) {
            $oSecurityPrincipal.ExactSDMatch = $true
        }
        if (($dAdminSDHolderImplicit.Owner -eq $dSecurityPrincipalImplicit.Owner) -and ($dAdminSDHolderImplicit.DaclProtected -eq $dSecurityPrincipalImplicit.DaclProtected) -and ($dAdminSDHolderImplicit.SaclProtected -eq $dSecurityPrincipalImplicit.SaclProtected)) {
            $comparison = Compare-Object -ReferenceObject $dAdminSDHolderImplicit.ImplicitACEs -DifferenceObject $dSecurityPrincipalImplicit.ImplicitACEs
            if ($comparison) {
                #  Nope
            }
            else {
                $oSecurityPrincipal.ImplicitSDMatch = $true
            }
        }
        $oSecurityPrincipal
    }
}

$allSecurityPrincipals | Export-Csv -Path $csv -NoClobber -NoTypeInformation

Stop-Transcript