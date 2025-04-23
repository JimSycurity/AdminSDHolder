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
    ARO   = 'Allowed RODC Password Replication Group'
    DRO   = 'Denied RODC Password Replication Group'
    CDC   = 'Cloneable Domain Controllers'
    DUP   = 'DnsUpdateProxy'
    ERO   = 'Enterprise Read-only Domain Controllers'
    RAS   = 'RAS and IAS Servers'
    ACO   = 'Access Control Assistance Operators'
    CO    = 'Cryptographic Operators'
    ELR   = 'Event Log Readers'
    NCO   = 'Network Configuration Operators'
    PLU   = 'Performance Log Users'
    PMU   = 'Performance Monitor Users'
    P2K   = 'Pre-Windows 2000 Compatible Access'
    RES   = 'RDS Endpoint Servers'
    RMS   = 'RDS Management Servers'
    RRS   = 'RDS Remote Access Servers'
    RMU   = 'Remote Management Users'
    SRA   = 'Storage Replicate Administrators'
    SMA   = 'System Managed Accounts Group'
    TLS   = 'Terminal Server License Servers'
    WAA   = 'Windows Authorization Access Group'
    EXTS  = 'Exchange Trusted Subsystem'
    EXS   = 'Exchange Servers'
    EXWS  = 'Exchange Windows Permissions'
    EXOM  = 'Organization Management'
    BA    = 'Administrators'
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
    $members = @()
    # Determine scope of target group and add group members accordingly
    $requiredScopes = @()
    try {
        $targetGroup = Get-ADGroup $ProtectedObjects.$key -Properties GroupType
    }
    catch {
        Write-Host "Message: [$($_.Exception.Message)] Group: $($ProtectedObjects.$key)"  -ForegroundColor Yellow
        Continue
    }

    switch ($targetGroup.GroupScope) {
        { $_ -eq 'Global' } { $requiredScopes += 'Global'; BREAK }
        { $_ -eq 'Universal' } { $requiredScopes += @('Global', 'Universal'); BREAK }
        { $_ -eq 'DomainLocal' } {
            if (($targetGroup.GroupType -band 1) -eq 1) {
                # Builtin Local groups cannot contain DomainLocal groups
                $requiredScopes += @('Global', 'Universal')
                BREAK
            }
            else {
                $requiredScopes += @('Global', 'Universal', 'DomainLocal')
                BREAK
            }
        }
        Default {}
    }

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


    switch ($requiredScopes) {
        { $_ -contains 'Universal' } {
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
        } { $_ -contains 'DomainLocal' } {
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
        } { $_ -contains 'Global' } {
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
        }
    }

    # Add group members accordingly
    $members = @($user, $iNet, $computer, $gMSA)
    switch ($targetGroup.GroupScope) {
        { $_ -eq 'Global' } { $members += @($GSGroup, $GDGroup); BREAK }
        { $_ -eq 'Universal' } { $members += @($USGroup, $UDGroup, $GSGroup, $GDGroup); BREAK }
        { ($_ -eq 'DomainLocal') -and ($targetGroup.GroupType -band 1) -eq 1 } { $members += @($USGroup, $UDGroup, $GSGroup, $GDGroup); BREAK }
        Default { $members += @($USGroup, $UDGroup, $GSGroup, $GDGroup, $LSGroup, $LDGroup) }
    }
    foreach ($member in $members) {
        try {
            Write-Host "Adding Member: $($member.Name) to Group: $($ProtectedObjects.$key)" -ForegroundColor Cyan
            Add-ADGroupMember -Identity $ProtectedObjects.$key -Members $member
        }
        catch {
            Write-Host "Message: [$($_.Exception.Message)] Group: $($ProtectedObjects.$key) Member: $($member.Name)"  -ForegroundColor Red
        }
    }


}

# Force AdminSDHolder to run manually
Invoke-Command {
    $Temp = [io.path]::GetTempFileName()
    Set-Content -Path $Temp -Value @'
dn:
changetype: modify
add: runProtectAdminGroupsTask
runProtectAdminGroupsTask: 1
-

'@
    ldifde -i -f $Temp
    Remove-Item -Force $Temp
} -ComputerName $($domain.PDCEmulator)

Stop-Transcript