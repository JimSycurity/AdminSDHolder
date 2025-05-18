$datetime = Get-Date -F 'yyyyMMddHHmmss'
$hostname = hostname
$path = 'C:\Scripts'
$filename = "AdminSDHolderData-${hostname}-${datetime}.txt"
$transcript = (Join-Path -Path $path -ChildPath $filename).ToString()
Start-Transcript -Path $transcript -NoClobber

# Operating System and Platform Enumeration
Write-Host "Hostname: $hostname"
Write-Host "PSVersion: $($PSVersionTable.PSVersion.ToString())"
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
$rootDSE = [adsi]"LDAP://rootdse"
$rootDSE | Select-Object -Property *
$defaultNC = $rootDSE.defaultNamingContext
$AdminSDHolderDN = "CN=AdminSDHolder,CN=System,$defaultNC"
Write-Host "Legacy Methods"
Write-Host "DSACLS:"
dsacls $AdminSDHolderDN -A
$AdminSDHolderDE = [adsi]"LDAP://$AdminSDHolderDN"
$AdminSDHolderDESD = $AdminSDHolderDE.ObjectSecurity
Write-Host "DE SD Type: $($AdminSDHolderDESD.GetType())"
Write-Host "DE Owner: $($AdminSDHolderDESD.Owner)"
Write-Host "DE Group: $($AdminSDHolderDESD.Group)"
Write-Host "DE Access:"
$AdminSDHolderDESD.Access
Write-Host "DE SDDL:"
$AdminSDHolderDESD.SDDL -split "(?=O:)|(?=G:)|(?=D:)|(?=S:)|(?=\()"
Write-Host "DE Binary:"
([System.BitConverter]::ToString($AdminSDHolderDESD.GetSecurityDescriptorBinaryForm())).Replace('-', '')

Write-Host "Modern Module Methods"

$AdminSDHolderObject = Get-ADObject $AdminSDHolderDN -Properties *
$AdminSDHolderSD = $AdminSDHolderObject.nTSecurityDescriptor
Write-Host "ADO SD Type: $($AdminSDHolderSD.GetType())"
Write-Host "ADO Owner: $($AdminSDHolderSD.Owner)"
Write-Host "ADO Group: $($AdminSDHolderSD.Group)"
Write-Host "ADO Access:"
$AdminSDHolderSD.Access
Write-Host "ADO SDDL:"
$AdminSDHolderSD.SDDL -split "(?=O:)|(?=G:)|(?=D:)|(?=S:)|(?=\()"
Write-Host "ADO Binary:"
([System.BitConverter]::ToString($AdminSDHolderSD.GetSecurityDescriptorBinaryForm())).Replace('-', '')
# NTObjectManager
$AdminSDHolderNTSD = $AdminSDHolderSD | ConvertTo-NtSecurityDescriptor
Write-Host "NTSD Type: $($AdminSDHolderNTSD.GetType())"
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

Stop-Transcript