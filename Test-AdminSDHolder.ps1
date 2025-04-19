# Start a transcript
$datetime = Get-Date -F 'yyyyMMddHHmmss'
$hostname = hostname
$path = 'C:\Scripts'
$filename = "AdminSDHolderTests-${hostname}-${datetime}.txt"
$transcript = (Join-Path -Path $path -ChildPath $filename).ToString()
Start-Transcript -Path $transcript -NoClobber

# Define Classes
class SecurityPrincipal {
    [string]    DistinguishedName
    [guid]      ObjectGuid
    [string]    ObjectSid
    [int]       AdminCount
    [int]       PrimaryGroupID
    [string[]]  MemberOf
    [string]    objectClass
    [string]    SamAccountName
    [string]    Owner
    [bool]      DaclProtected = $false
    [bool]      SaclProtected = $false
    [bool]      ExactSDMatch = $false
    [bool]      ImplicitSDMatch = $false
    [int]       ACECount
    [int]       ImplicitACECount
    [datetime]  Created
    [datetime]  Modified

    SecurityPrincipal() {}
    SecurityPrincipal([hashtable]$Properties) { $this.Init($Properties) }

    [void] Init([hashtable]$Properties) {
        foreach ($Property in $Properties.Keys) {
            $this.Property = $Properties.$Property
        }
    }
}

# Enumeration
$rootDSE = Get-ADRootDSE
$forest = Get-ADForest

# ArrayList (backwards compat) to store arrays of PSCustomObjects with final results
$allSecurityPrincipals = [System.Collections.ArrayList]::New()
$hashAlgorithm = [System.Security.Cryptography.SHA256]::Create()


# Loop through each domain in the forest
foreach ($domain in $forest.Domains) {
    $tempPath = "LDAP://" + $($domain)
    $dDistinguishedName = ([ADSI]$tempPath).distinguishedName[0]
    Write-Verbose "Domain DN: $dDistinguishedName $($dDistinguishedName.GetType())"

    # Collect information about the AdminSDHolder object for the domain
    $dAdminSDHolder = Get-ADObject "CN=AdminSDHolder,CN=System,$($dDistinguishedName)" -Properties * -Server $domain
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
    $customParameters = @{
        LDAPFilter  = "(|(objectClass=group)(objectCategory=user))"
        SearchScope = 'Subtree'
        SearchBase  = $dDistinguishedName
        Properties  = '*'
        Server      = $domain
    }
    $dSecurityPrincipals = Get-ADObject @customParameters
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
        Write-Host '----------------------------------------------------'
        Write-Host "$($dsecurityPrincipal.DistinguishedName) comparison:"
        if ($dSecurityPrincipalSDHash -eq $dAdminSDHolderSDHash) {
            # Match
            Write-Host "Match on binary security descriptor comparison"
            Write-Verbose "Security Principal hash: $dSecurityPrincipalSDHash"
        }
        else {
            if (($dAdminSDHolderImplicit.Owner -eq $dSecurityPrincipalImplicit.Owner) -and ($dAdminSDHolderImplicit.DaclProtected -eq $dSecurityPrincipalImplicit.DaclProtected) -and ($dAdminSDHolderImplicit.SaclProtected -eq $dSecurityPrincipalImplicit.SaclProtected)) {
                $comparison = Compare-Object -ReferenceObject $dAdminSDHolderImplicit.ImplicitACEs -DifferenceObject $dSecurityPrincipalImplicit.ImplicitACEs
                if ($comparison) {
                    Write-Host 'Nope'
                }
                else {
                    Write-Host 'Match on Owner, Flags, and Implicit ACEs'
                }
            }
            else {
                Write-Host 'Nope'
            }
        }
        #$dSecurityPrincipals.Add()
    }
}


Stop-Transcript