$datetime = Get-Date -F 'yyyyMMddHHmmss'
$hostname = hostname
$path = 'C:\Scripts'
$filename = "SDMatchData-${hostname}-${datetime}.txt"
$transcript = (Join-Path -Path $path -ChildPath $filename).ToString()
$Password = Read-Host "Enter a password for test users:"  -AsSecureString
Start-Transcript -Path $transcript -NoClobber
$hashAlgorithm = [System.Security.Cryptography.SHA256]::Create()

# Retrieve rootDSE
$rootDSE = [adsi]"LDAP://rootdse"
$rootDSE | Select-Object -Property *
$defaultNC = $rootDSE.defaultNamingContext.ToString()
$AdminSDHolderDN = "CN=AdminSDHolder,CN=System,$defaultNC"
# Retrieve the SDDL for the AdminSDHolder object
Write-Host 'Retrieve SDDL for AdminSDHolder object'
$AdminSDHolderDE = [adsi]"LDAP://$AdminSDHolderDN"
$AdminSDHolderDESD = $AdminSDHolderDE.ObjectSecurity
$AdminSDHolderSDDL = $AdminSDHolderDESD.GetSecurityDescriptorSddlForm(15)
$AdminSDHolderBin = $AdminSDHolderDESD.GetSecurityDescriptorBinaryForm()
$AdminSDHolderSDDL
$dAdminSDHolderSDHash = [System.BitConverter]::ToString($hashAlgorithm.ComputeHash($AdminSDHolderBin))
$AdminSDHolderDACL = $AdminSDHolderDESD.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])
$AdminSDHolderSACL = $AdminSDHolderDESD.GetAuditRules($true, $true, [System.Security.Principal.SecurityIdentifier])
Write-Host "AdminSDHolder hash: $dAdminSDHolderSDHash"  -ForegroundColor Yellow

# Create an OU for the test if it doesn't already exist
$TestOU = "OU=SDMatchTest," + $defaultNC
# Check if SDMatchTest exists, if not, create it
try {
    Get-ADOrganizationalUnit -Identity $TestOU
}
catch {
    New-ADOrganizationalUnit "SDMatchTest" -Path $defaultNC
}

# Create a test user if it doesn't already exist
$UserDN = "CN=SDMatchUser,$TestOU"
try {
    Get-ADUser -Identity $UserDN
}
catch {
    New-ADUser -Name SDMatchUser -SamAccountName SDMatchUser -AccountPassword $Password -Enabled $true -Path $TestOU
}

# Retrieve the SDMatch user, display its SDDL, set it to the AdminSDHolderSDDL, commit the changes
Write-Host 'Current nTSecurityDescriptor SDDL for SDMatchUser:'
$SDMatch = [adsi]"LDAP://$UserDN"
$OldSDDL = $SDMatch.ObjectSecurity.GetSecurityDescriptorSddlForm(15)
$OldSDDL
Write-Host 'Setting SD for SD Match user to that of AdminSDHolder object'
$SDMatch.ObjectSecurity.SetSecurityDescriptorBinaryForm($AdminSDHolderBin)
Start-Sleep -Seconds 5
$SDMatch.PSBase.CommitChanges()

# Retrieve the SDMatchUser again and display its SDDL
Write-Host 'Updated nTSecurityDescriptor SDDL for SD Match user:'
$SDMatch = [adsi]"LDAP://$UserDN"
$SDMatch.ObjectSecurity.GetSecurityDescriptorSddlForm(15)
$SDMatchBin = $SDMatch.ObjectSecurity.GetSecurityDescriptorBinaryForm()
$dSDMatchSDHash = [System.BitConverter]::ToString($hashAlgorithm.ComputeHash($SDMatchBin))
Write-Host "SDMatch nTSecurityDescriptor hash: $dSDMatchSDHash" -ForegroundColor Yellow

# For some unknown (stupid) reason, doing a direct SD binary replacement doesn't properly duplicate the SD...
Write-Host 'Checking for nTSecurityDescriptor match...'
if ($dSDMatchSDHash -ne $dAdminSDHolderSDHash) {
    Write-Host 'Iterating through DACL ACEs...'
    $SDMatchDACL = $SDMatch.ObjectSecurity.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])
    foreach ($ACE in $AdminSDHolderDACL) {
        if ($ACE -notin $SDMatchDACL) {
            Write-Host 'Adding ACE: $ACE'
            $SDMatch.ObjectSecurity.AddAccessRule($ACE)
        }
    }
    Write-Host 'Iterating through SACL ACEs...'
    $SDMatchSACL = $SDMatch.ObjectSecurity.GetAuditRules($true, $true, [System.Security.Principal.SecurityIdentifier])
    foreach ($ACE in $AdminSDHolderSACL) {
        if ($ACE -notin $SDMatchSACL) {
            Write-Host 'Adding ACE: $ACE'
            $SDMatch.ObjectSecurity.AddAAuditRule($ACE)
        }
    }
}
# If we couldn't fix it automatically, do it manually..
do {
    Write-Host 'nTSecurityDescriptor hashes do not match!  Manually resolve the issue before re-testing' -ForegroundColor Red
    Read-Host -Prompt 'When resolved, press enter to continue'
    $SDMatch = [adsi]"LDAP://$UserDN"
    $SDMatchBin = $SDMatch.ObjectSecurity.GetSecurityDescriptorBinaryForm()
    $dSDMatchSDHash = [System.BitConverter]::ToString($hashAlgorithm.ComputeHash($SDMatchBin))
    Write-Host "SDMatch nTSecurityDescriptor hash: $dSDMatchSDHash" -ForegroundColor Yellow
}
until ($dSDMatchSDHash -eq $dAdminSDHolderSDHash)


Write-Host "Group Membership: $($SDMatch.MemberOf) - Should be null"

Write-Host 'Adding SDMatchUser to Domain Admins'
Add-ADGroupMember -Identity 'Domain Admins' -Members 'SDMatchUser'
$SDMatch = [adsi]"LDAP://$UserDN"
Write-Host "Displaying SDMatchUser MemberOf: $($SDMatchUser.MemberOf)"

Write-Host 'Forcing ProtectAdminGroup background task'
# Force AdminSDHolder to run manually
$PDCDNSName = ([System.DirectoryServices.ActiveDirectory.Domain]::GetComputerDomain()).PdcRoleOwner.Name
$PDCERootDSE = [adsi]”LDAP://$PDCDNSName/RootDSE”
$PDCERootDSE.Put('runProtectAdminGroupsTask', '1')
$PDCERootDSE.SetInfo()

Start-Sleep -Seconds 5

Write-Host 'Checking for adminCount'
$SDMatch = [adsi]"LDAP://$UserDN"
Write-Host "SDMatchUser adminCount: $($SDMatch.adminCount) - Should be null"
Write-Host "SDMatchUser final nTSecurityDescriptor SDDL:"
$SDMatch.ObjectSecurity.GetSecurityDescriptorSddlForm(15)

####
# Remove Deletion Protect
####
Get-ADObject -Filter * -SearchBase $TestOU | ForEach-Object -Process { Set-ADObject -ProtectedFromAccidentalDeletion $false -Identity $_ }

Stop-Transcript

