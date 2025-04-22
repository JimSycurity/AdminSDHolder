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
$OU = "OU=AdminSDHolderTests,$($domain.DistinguishedName)"
Set-ADObject -ProtectedFromAccidentalDeletion $false -Identity $OU

$ProtectedObjects = @{
    # Short Name    # Group Name
    BA    = 'Administrators'
    PO    = 'Print Operators'
    BO    = 'Backup Operators'
    RE    = 'Replicator'
    DC    = 'Domain Controllers'
    SA    = 'Schema Admins'
    EA    = 'Enterprise Admins'
    DA    = 'Domain Admins'
    SO    = 'Server Operators'
    AO    = 'Account Operators'
    RO    = 'Read-Only Domain Controllers'
    KA    = 'Key Admins'
    EK    = 'Enterprise Key Admins'
    CP    = 'Cert Publishers'
    GP    = 'Group Policy Creator Owners'
    RD    = 'Remote Desktop Users'
    DCOM  = 'Distributed COM Users'
    CDCOM = 'Certificate Service DCOM Access'
    HV    = 'Hyper-V Administrators'
    IF    = 'Incoming Forest Trust Builders'
    DNS   = 'DnsAdmins'
    RM    = 'Remote Management Users'
    PU    = 'Protected Users'
    FT    = 'Forest Trust Accounts'
    ET    = 'External Trust Accounts'
}

# Get a password to use for the newly created objects
$SecurePassword = (Read-Host -AsSecureString "Input User Password")

# Create a User and manually set its adminCount to 1 to prove out that AdminCount doesn't Count
$adminCount = @{
    Name            = 'adminCount Test'
    SamAccountName  = 'adminCount'
    AccountPassword = $SecurePassword
    Enabled         = $true
    Path            = $OU
    Description     = "AdminCount manually configured to 1"
    OtherAttributes = @{
        adminCount = 1
    }
}

New-ADUser @adminCount

# Loop through the hashtable of groups and create a user, computer, group, inetorgperson within each
foreach ($key in $ProtectedObjects.Keys) {
    $userSplat = @{
        Name            = "${key}_User"
        SamAccountName  = "${key}User"
        AccountPassword = $SecurePassword
        Enabled         = $true
        Description     = "Member of $($ProtectedObjects.$key)"
        Path            = $OU
        PassThru        = $true
    }
    $user = New-ADUser @userSplat

    $inetOrgSplat = @{
        Name            = "${key}_inetOrg"
        SamAccountName  = "${key}inetOrg"
        AccountPassword = $SecurePassword
        Enabled         = $true
        Description     = "Member of $($ProtectedObjects.$key)"
        Type            = 'iNetOrgPerson'
        Path            = $OU
        PassThru        = $true
    }
    $iNet = New-ADUser @inetOrgSplat

    $groupSplat = @{
        Name           = "${key}_USGroup"
        SamAccountName = "${key}USGroup"
        GroupCategory  = "Security"
        GroupScope     = "Universal"
        Description    = "Member of $($ProtectedObjects.$key)"
        Path           = $OU
        PassThru       = $true
    }
    $USgroup = New-ADGroup @groupSplat

    $groupSplat = @{
        Name           = "${key}_UDGroup"
        SamAccountName = "${key}UDGroup"
        GroupCategory  = "Distribution"
        GroupScope     = "Universal"
        Description    = "Member of $($ProtectedObjects.$key)"
        Path           = $OU
        PassThru       = $true
    }
    $UDgroup = New-ADGroup @groupSplat

    $groupSplat = @{
        Name           = "${key}_LSGroup"
        SamAccountName = "${key}LSGroup"
        GroupCategory  = "Security"
        GroupScope     = "DomainLocal"
        Description    = "Member of $($ProtectedObjects.$key)"
        Path           = $OU
        PassThru       = $true
    }
    $LSgroup = New-ADGroup @groupSplat

    $groupSplat = @{
        Name           = "${key}_LDGroup"
        SamAccountName = "${key}LDGroup"
        GroupCategory  = "Distribution"
        GroupScope     = "DomainLocal"
        Description    = "Member of $($ProtectedObjects.$key)"
        Path           = $OU
        PassThru       = $true
    }
    $LDgroup = New-ADGroup @groupSplat

    $groupSplat = @{
        Name           = "${key}_GSGroup"
        SamAccountName = "${key}GSGroup"
        GroupCategory  = "Security"
        GroupScope     = "Global"
        Description    = "Member of $($ProtectedObjects.$key)"
        Path           = $OU
        PassThru       = $true
    }
    $GSgroup = New-ADGroup @groupSplat

    $groupSplat = @{
        Name           = "${key}_GDGroup"
        SamAccountName = "${key}GDGroup"
        GroupCategory  = "Distribution"
        GroupScope     = "Global"
        Description    = "Member of $($ProtectedObjects.$key)"
        Path           = $OU
        PassThru       = $true
    }
    $GDgroup = New-ADGroup @groupSplat

    $computerSplat = @{
        Name            = "${key}_computer"
        SamAccountName  = "${key}comp"
        AccountPassword = $SecurePassword
        Enabled         = $true
        Description     = "Member of $($ProtectedObjects.$key)"
        Path            = $OU
        PassThru        = $true
    }
    $computer = New-ADComputer @computerSplat

    $gMSASplat = @{
        Name           = "${key}_gmsa"
        SamAccountName = "${key}gmsa"
        DNSHostName    = "${key}gmsa.${domain.DNSRoot}"
        DisplayName    = "${key}_gmsa"
        Enabled        = $true
        Description    = "Member of $($ProtectedObjects.$key)"
        Path           = $OU
        PassThru       = $true
    }
    $gMSA = New-ADServiceAccount @gMSASplat

    $splat = @{
        Identity = $ProtectedObjects.$key
        Members  = @($user, $iNet, $USGroup, $UDGroup, $LSGroup, $LDGroup, $GSGroup, $GDGroup, $computer, $gMSA )
    }
    Add-ADGroupMember @splat
}

Stop-Transcript