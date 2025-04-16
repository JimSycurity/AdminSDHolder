# Operating System and Platform Enumeration
Write-Host 'Gathering OS and Platform data'
(Get-WmiObject win32_operatingsystem).name
(Get-WmiObject win32_operatingsystem).OSArchitecture
(Get-WmiObject win32_operatingsystem).CSName

[Environment]::OSVersion.Platform
[Environment]::OSVersion.Version
[Environment]::OSVersion.ServicePack
[Environment]::OSVersion.VersionString

# Gather Base AD Data
Write-Host 'Gathering base AD data'
$rootDSE = Get-ADRootDSE
$rootDSE
$defaultNC = $rootDSE.defaultNamingContext

$AdminSDHolderDN = "CN=AdminSDHolder,CN=System,$defaultNC"
$AdminSDHolderObject = Get-ADObject $AdminSDHolderDN -Properties *
$AdminSDHolderSD = $AdminSDHolderObject.nTSecurityDescriptor
Write-Host "Owner: $($AdminSDHolderSD.Owner)"
Write-Host "Group: $($AdminSDHolderSD.Group)"
Write-Host "Access:"
$AdminSDHolderSD.Access
Write-Host "SDDL:" -split "(?=O:)|(?=G:)|(?=D:)|(?=S:)|(?=\()"
$AdminSDHolderSD.SDDL
Write-Host "Binary:"
$AdminSDHolderSD.GetSecurityDescriptorBinaryForm()
# NTObjectManager
$AdminSDHolderNTSD = $AdminSDHolderSD | ConvertTo-NtSecurityDescriptor
Write-Host "NTSD Self Relative:"
$AdminSDHolderNTSD.SelfRelative
Write-Host "NTSD Owner:"
$AdminSDHolderNTSD.Owner
Write-Host "NTSD Group:"
$AdminSDHolderNTSD.Group
Write-Host "NTSD Control:"
$AdminSDHolderNTSD.Control
Write-Host "NTSD Container:"
$AdminSDHolderNTSD.Container
Write-Host "NTSD AccessRightsType:"
$AdminSDHolderNTSD.AccessRightsType
Write-Host "NTSD DACL Canonical:"
$AdminSDHolderNTSD.DaclCanonical
Write-Host "NTSD DACL Defaulted:"
$AdminSDHolderNTSD.DaclDefaulted
Write-Host "NTSD DACL:"
$AdminSDHolderNTSD.Dacl
Write-Host "NTSD Self-Relative Hex:"
$ba = ConvertFrom-NtSecurityDescriptor $AdminSDHolderNTSD
$ba | Out-HexDump -ShowAll
Write-Host "Base64:"
$AdminSDHolderNTSD.ToBase64(1)
Write-Host "HashCode:"
$AdminSDHolderNTSD.GetHashCode()
Write-Host "NTSD SDDL:"
$AdminSDHolderNTSD.ToSDDL() -split "(?=O:)|(?=G:)|(?=D:)|(?=S:)|(?=\()"
Write-Host "Win32SD:"
Format-Win32SecurityDescriptor -Name $AdminSDHolderDN -Type DsAll -ShowAll -ResolveObjectType
Write-Host "Win32SD Inherited ACEs:"
$cls = Get-DsObjectSchemaClass -DistinguishedName $AdminSDHolderDN
Search-Win32SecurityDescriptor -Name $AdminSDHolderDN -Type Ds -ObjectType $cls.SchemaID
Write-Host "DSACLS:"
dsacls $AdminSDHolderDN -A
