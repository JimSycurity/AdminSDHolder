<###
    The purpose of this script is to build a configuration in an AD Domain to
    determine which objects are protected by AdminSDHolder programatically.

    First build an OU structure, groups, and security principals
    of different types.

    Nest those objects in all available groups that are suspected to
    include transitive group membership when the object is protected.

    Start the Protection Operation on the PDCe

    Notes:
    - This script is targetted at indivdual domains, not the entire AD forest.
    - Administrative privileges in the domain are required to run this.

###>

# Start a transcript
$datetime = Get-Date -F 'yyyyMMddHHmmss'
$hostname = hostname
$path = 'C:\Scripts'
$filename = "CreateAdminSDHolderTest-${hostname}-${datetime}.txt"
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

# Enumeration
$domain = Get-ADDomain

# Create OUs
New-ADOrganizationalUnit -Name 'AdminSDHolderTests' -Path $domain.DistinguishedName -Server $domain.DNSRoot
# TODO Eventually create more OUs for Inheritence testing?
$OU = "OU=AdminSDHolderTests,$(domain.DistinguishedName)"




# Create a User and manually set its adminCount to 1 to prove out that AdminCount doesn't Count

















Stop-Transcript