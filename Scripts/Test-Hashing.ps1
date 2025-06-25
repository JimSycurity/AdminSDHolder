class ACEForHashing {
    [string] $IdentityReference
    [System.DirectoryServices.ActiveDirectoryRights] $Rights
    [System.Security.AccessControl.AccessControlType] $AccessControlType
    [string] $ObjectType
    [string] $InheritedObjectType
    [System.Security.AccessControl.InheritanceFlags] $InheritanceFlags

    ACEForHashing() {}

    [string]ToString() {
        return "$($this.IdentityReference)|$($this.Rights)|$($this.AccessControlType)|$($this.ObjectType)|$($this.InheritedObjectType)|$($this.InheritanceFlags)"

    }
}

function Get-Sha1Hash {
    param (
        [Parameter(Mandatory = $true)]
        [string]$InputString
    )

    $sha1 = [System.Security.Cryptography.SHA1]::Create()
    $bytes = $sha1.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($InputString))
    $sha1.Dispose()

    $hashString = [BitConverter]::ToString($bytes).Replace("-", "").ToUpper()
    return $hashString
}



$aceList = [System.Collections.Generic.List[ACEForHashing]]::new()

# Gather Base AD Data
Write-Host 'Gathering base AD data'
$rootDSE = [adsi]"LDAP://rootdse"
$rootDSE | Select-Object -Property *
$defaultNC = $rootDSE.defaultNamingContext
$AdminSDHolderDN = "CN=AdminSDHolder,CN=System,$defaultNC"
$AdminSDHolderDE = [adsi]"LDAP://$AdminSDHolderDN"
$AdminSDHolderDESD = $AdminSDHolderDE.ObjectSecurity
Write-Host "DE Binary:"
$DEBinary = ([System.BitConverter]::ToString($AdminSDHolderDESD.GetSecurityDescriptorBinaryForm())).Replace('-', '')
$DEBinary


$AdminSDHolderObject = Get-ADObject $AdminSDHolderDN -Properties *
$AdminSDHolderSD = $AdminSDHolderObject.nTSecurityDescriptor
Write-Host "ADO Binary:"
$ADOBinary = ([System.BitConverter]::ToString($AdminSDHolderSD.GetSecurityDescriptorBinaryForm())).Replace('-', '')
$ADOBinary

$AdminSDHolderNTSD = $AdminSDHolderSD | ConvertTo-NtSecurityDescriptor
Write-Host "NTSD Self-Relative Hex:"
$ba = ConvertFrom-NtSecurityDescriptor $AdminSDHolderNTSD
$ba | Out-HexDump -ShowAll
Write-Host "Base64:"
$AdminSDHolderNTSD.ToBase64(1)


$isDaclProtected = $AdminSDHolderSD.AreAccessRulesProtected

# Get all ACEs, including Deny ACEs, but skip inherited ones
foreach ($ace in $AdminSDHolderSD.GetAccessRules($true, $false, [System.Security.Principal.SecurityIdentifier])) {
    if ($null -eq $ace) {
        continue
    }
    [string]$ir = $ace.IdentityReference

    $aceList.Add([ACEForHashing]@{
            IdentityReference   = $ir
            Rights              = $ace.ActiveDirectoryRights
            AccessControlType   = $ace.AccessControlType
            ObjectType          = $ace.ObjectType
            InheritedObjectType = $ace.InheritedObjectType
            InheritanceFlags    = $ace.InheritanceFlags
        })
}

# Sort the ACEs to ensure consistent ordering
$sortedAces = $aceList |
Sort-Object -Property @(
    @{Expression = { $_.AccessControlType }; Ascending = $true },
    @{Expression = { $_.IdentityReference }; Ascending = $true },
    @{Expression = { $_.Rights }; Ascending = $true },
    @{Expression = { $_.ObjectType }; Ascending = $true },
    @{Expression = { $_.InheritedObjectType }; Ascending = $true },
    @{Expression = { $_.InheritanceFlags }; Ascending = $true }
)
[string]$concatenatedAces = ($sortedAces | ForEach-Object { $_.ToString() }) -join ";" + "|DaclProtected:" + $isDaclProtected
$hash = Get-Sha1Hash -InputString $concatenatedAces
$hash
