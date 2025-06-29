<#
.SYNOPSIS
    Creates an Active Directory user or InetOrgPerson object with the same security descriptor as AdminSDHolder.

.DESCRIPTION
    This function creates a new user or InetOrgPerson object in Active Directory and applies
    the exact same security descriptor as the AdminSDHolder container for that domain.
    This effectively gives the user object the same protected security settings.

.PARAMETER UserName
    The name of the user to create (will be used for CN, sAMAccountName, and userPrincipalName).

.PARAMETER ParentPath
    The Distinguished Name of the parent container where the new user will be created.

.PARAMETER ObjectClass
    The object class for the user object. Valid values are 'user' or 'inetOrgPerson'.
    Default is 'user'.

.PARAMETER DisplayName
    Optional display name for the user. If not specified, uses UserName.

.PARAMETER Description
    Optional description for the user object.

.PARAMETER UserPrincipalName
    Optional custom userPrincipalName. If not specified, creates one based on UserName and domain.

.PARAMETER AdminSDHolderPath
    Optional custom path to AdminSDHolder. If not specified, auto-detects based on domain.

.INPUTS
    None
    This function does not accept pipeline input.

.OUTPUTS
    PSCustomObject
    Returns an object containing the operation results including the created user's DN and security information.

.EXAMPLE
    New-ADUserWithAdminSDSecurity -UserName "protecteduser" -ParentPath "CN=Users,DC=domain,DC=com"

    Creates a user object with the same security descriptor as AdminSDHolder.

.EXAMPLE
    New-ADUserWithAdminSDSecurity -UserName "jdoe" -ParentPath "OU=ProtectedUsers,DC=domain,DC=com" -ObjectClass "inetOrgPerson" -DisplayName "John Doe"

    Creates an inetOrgPerson object with AdminSDHolder security and custom display name.

.EXAMPLE
    New-ADUserWithAdminSDSecurity -UserName "serviceacct" -ParentPath "CN=Users,DC=domain,DC=com" -Description "Protected Service Account" -AdminSDHolderPath "CN=AdminSDHolder,CN=System,DC=domain,DC=com"

    Creates a user with explicit AdminSDHolder path and description.

.NOTES
    This function uses only .NET methods in PowerShell and ADSI for Active Directory operations.
    The created user will have the exact same security descriptor as AdminSDHolder, making it
    highly protected against unauthorized access and modification.
    Requires appropriate permissions to create objects and read AdminSDHolder security.
#>
function New-ADUserWithAdminSDSecurity {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$UserName,

        [Parameter(Mandatory = $true)]
        [string]$ParentPath,

        [Parameter(Mandatory = $false)]
        [ValidateSet("user", "inetOrgPerson")]
        [string]$ObjectClass = "user",

        [Parameter(Mandatory = $false)]
        [string]$DisplayName,

        [Parameter(Mandatory = $false)]
        [string]$Description,

        [Parameter(Mandatory = $false)]
        [string]$UserPrincipalName,

        [Parameter(Mandatory = $false)]
        [string]$AdminSDHolderPath
    )

    $parentEntry = $null
    $newUser = $null
    $adminSDHolder = $null

    try {
        Write-Verbose "Creating $ObjectClass object '$UserName' with AdminSDHolder security in parent '$ParentPath'"

        # Create the full Distinguished Name for the new user
        $userDN = "CN=$UserName,$ParentPath"
        Write-Verbose "User DN will be: $userDN"

        # Auto-detect AdminSDHolder path if not provided
        if ([string]::IsNullOrEmpty($AdminSDHolderPath)) {
            Write-Verbose "Auto-detecting AdminSDHolder path"
            # Extract domain components from parent path
            $domainParts = ($ParentPath -split ',' | Where-Object { $_ -like 'DC=*' })
            $domainDN = $domainParts -join ','
            $AdminSDHolderPath = "CN=AdminSDHolder,CN=System,$domainDN"
            Write-Verbose "Detected AdminSDHolder path: $AdminSDHolderPath"
        }

        # Auto-generate UserPrincipalName if not provided
        if ([string]::IsNullOrEmpty($UserPrincipalName)) {
            $domainParts = ($ParentPath -split ',' | Where-Object { $_ -like 'DC=*' }) -replace 'DC=', ''
            $domainName = $domainParts -join '.'
            $UserPrincipalName = "$UserName@$domainName"
            Write-Verbose "Generated UPN: $UserPrincipalName"
        }

        # Use UserName as DisplayName if not provided
        if ([string]::IsNullOrEmpty($DisplayName)) {
            $DisplayName = $UserName
        }

        # First, get the AdminSDHolder security descriptor
        Write-Verbose "Retrieving AdminSDHolder security descriptor from: $AdminSDHolderPath"
        $adminSDHolder = [ADSI]"LDAP://$AdminSDHolderPath"

        # Validate AdminSDHolder exists
        if ([string]::IsNullOrEmpty($adminSDHolder.distinguishedName)) {
            throw "AdminSDHolder at path '$AdminSDHolderPath' does not exist or is not accessible"
        }

        Write-Verbose "Successfully accessed AdminSDHolder: $($adminSDHolder.distinguishedName)"

        # Get the AdminSDHolder security descriptor
        $adminSDSecurity = $adminSDHolder.ObjectSecurity
        $adminSDDL = $adminSDSecurity.GetSecurityDescriptorSddlForm([System.Security.AccessControl.AccessControlSections]::All)
        Write-Verbose "Retrieved AdminSDHolder SDDL (length: $($adminSDDL.Length))"

        # Bind to the parent container
        Write-Verbose "Binding to parent container: $ParentPath"
        $parentEntry = [ADSI]"LDAP://$ParentPath"

        # Validate parent exists
        if ([string]::IsNullOrEmpty($parentEntry.distinguishedName)) {
            throw "Parent path '$ParentPath' does not exist or is not accessible"
        }

        Write-Verbose "Successfully bound to parent: $($parentEntry.distinguishedName)"

        # Check if user already exists
        try {
            $existingUser = [ADSI]"LDAP://$userDN"
            if (-not [string]::IsNullOrEmpty($existingUser.distinguishedName)) {
                throw "User '$userDN' already exists"
            }
        }
        catch [System.Runtime.InteropServices.COMException] {
            # Expected if user doesn't exist - continue
            Write-Verbose "User does not exist (as expected)"
        }

        # Create the new user object
        Write-Verbose "Creating new $ObjectClass object"
        $newUser = $parentEntry.Children.Add("CN=$UserName", $ObjectClass)

        # Set required user attributes
        Write-Verbose "Setting user attributes"
        $newUser.Properties["sAMAccountName"].Value = $UserName
        $newUser.Properties["userPrincipalName"].Value = $UserPrincipalName
        $newUser.Properties["displayName"].Value = $DisplayName

        # Set description if provided
        if (-not [string]::IsNullOrEmpty($Description)) {
            Write-Verbose "Setting description: $Description"
            $newUser.Properties["description"].Value = $Description
        }

        # Set user account control (normal account, password not required for initial creation)
        $newUser.Properties["userAccountControl"].Value = 0x220  # NORMAL_ACCOUNT | PASSWD_NOTREQD

        # Commit the user creation first
        Write-Verbose "Committing user creation"
        $newUser.CommitChanges()
        Write-Verbose "User created successfully"

        # Now apply the AdminSDHolder security descriptor
        Write-Verbose "Applying AdminSDHolder security descriptor to user"

        # Create a new security descriptor object from the AdminSDHolder SDDL
        $userSecurity = New-Object System.DirectoryServices.ActiveDirectorySecurity
        $userSecurity.SetSecurityDescriptorSddlForm($adminSDDL)

        # Apply the security descriptor to the user
        $newUser.ObjectSecurity = $userSecurity

        # Commit the security changes
        Write-Verbose "Committing security descriptor changes"
        $newUser.CommitChanges()

        # Refresh to get current state
        $newUser.RefreshCache()

        # Get the applied security descriptor for verification
        $appliedSecurity = $newUser.ObjectSecurity
        $appliedSDDL = $appliedSecurity.GetSecurityDescriptorSddlForm([System.Security.AccessControl.AccessControlSections]::All)

        # Get owner information
        $owner = $appliedSecurity.GetOwner([System.Security.Principal.SecurityIdentifier])

        # Get access rules summary
        $accessRules = $appliedSecurity.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])
        $ruleCount = $accessRules.Count

        Write-Verbose "AdminSDHolder security descriptor applied successfully"
        Write-Verbose "Applied $ruleCount access rules from AdminSDHolder"

        # Verify the SDDL matches (basic verification)
        $sddlMatch = ($adminSDDL -eq $appliedSDDL)
        if ($sddlMatch) {
            Write-Verbose "SDDL verification: Perfect match with AdminSDHolder"
        }
        else {
            Write-Verbose "SDDL verification: Applied SDDL differs from AdminSDHolder (may be due to object-specific variations)"
        }

        # Return success result
        return [PSCustomObject]@{
            UserName          = $UserName
            DistinguishedName = $userDN
            ParentPath        = $ParentPath
            ObjectClass       = $ObjectClass
            DisplayName       = $DisplayName
            UserPrincipalName = $UserPrincipalName
            SAMAccountName    = $UserName
            Description       = if ($Description) { $Description } else { "Not set" }
            AdminSDHolderPath = $AdminSDHolderPath
            Owner             = $owner.Value
            AccessRuleCount   = $ruleCount
            AppliedSDDL       = $appliedSDDL
            AdminSDHolderSDDL = $adminSDDL
            SDDLMatch         = $sddlMatch
            SecuritySummary   = "Copied from AdminSDHolder ($ruleCount access rules)"
            Success           = $true
            Timestamp         = Get-Date
        }
    }
    catch {
        Write-Error "Failed to create user '$UserName' with AdminSDHolder security: $($_.Exception.Message)"
        return [PSCustomObject]@{
            UserName          = $UserName
            DistinguishedName = "CN=$UserName,$ParentPath"
            ParentPath        = $ParentPath
            ObjectClass       = $ObjectClass
            DisplayName       = if ($DisplayName) { $DisplayName } else { $UserName }
            UserPrincipalName = if ($UserPrincipalName) { $UserPrincipalName } else { "Not set" }
            SAMAccountName    = $UserName
            Description       = if ($Description) { $Description } else { "Not set" }
            AdminSDHolderPath = if ($AdminSDHolderPath) { $AdminSDHolderPath } else { "Auto-detect failed" }
            Owner             = "Failed to apply"
            AccessRuleCount   = 0
            AppliedSDDL       = "Failed to apply"
            AdminSDHolderSDDL = "Failed to retrieve"
            SDDLMatch         = $false
            SecuritySummary   = "Failed to copy AdminSDHolder security"
            Success           = $false
            Error             = $_.Exception.Message
            Timestamp         = Get-Date
        }
    }
    finally {
        # Clean up ADSI objects
        if ($newUser) {
            try { $newUser.Dispose() } catch { }
        }
        if ($parentEntry) {
            try { $parentEntry.Dispose() } catch { }
        }
        if ($adminSDHolder) {
            try { $adminSDHolder.Dispose() } catch { }
        }
    }
}

# Helper function to compare security descriptors
function Compare-ADObjectSecurity {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourceObjectDN,

        [Parameter(Mandatory = $true)]
        [string]$TargetObjectDN
    )

    try {
        $sourceObject = [ADSI]"LDAP://$SourceObjectDN"
        $targetObject = [ADSI]"LDAP://$TargetObjectDN"

        $sourceSecurity = $sourceObject.ObjectSecurity
        $targetSecurity = $targetObject.ObjectSecurity

        $sourceSDDL = $sourceSecurity.GetSecurityDescriptorSddlForm([System.Security.AccessControl.AccessControlSections]::All)
        $targetSDDL = $targetSecurity.GetSecurityDescriptorSddlForm([System.Security.AccessControl.AccessControlSections]::All)

        $sourceRules = $sourceSecurity.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])
        $targetRules = $targetSecurity.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])

        return [PSCustomObject]@{
            SourceObject    = $SourceObjectDN
            TargetObject    = $TargetObjectDN
            SourceRuleCount = $sourceRules.Count
            TargetRuleCount = $targetRules.Count
            SDDLMatch       = ($sourceSDDL -eq $targetSDDL)
            SourceSDDL      = $sourceSDDL
            TargetSDDL      = $targetSDDL
        }
    }
    catch {
        Write-Error "Failed to compare security descriptors: $($_.Exception.Message)"
        return $null
    }
    finally {
        if ($sourceObject) { $sourceObject.Dispose() }
        if ($targetObject) { $targetObject.Dispose() }
    }
}

# Example usage helper
Write-Host @"
New-ADUserWithAdminSDSecurity Function Loaded
============================================

Basic Examples:

# Create user with AdminSDHolder security
New-ADUserWithAdminSDSecurity -UserName "protecteduser" -ParentPath "CN=Users,DC=domain,DC=com"

# Create inetOrgPerson with AdminSDHolder security
New-ADUserWithAdminSDSecurity -UserName "jdoe" -ParentPath "OU=ProtectedUsers,DC=domain,DC=com" -ObjectClass "inetOrgPerson" -DisplayName "John Doe"

# Create user with custom AdminSDHolder path
New-ADUserWithAdminSDSecurity -UserName "serviceacct" -ParentPath "CN=Users,DC=domain,DC=com" -AdminSDHolderPath "CN=AdminSDHolder,CN=System,DC=domain,DC=com"

# Compare security between objects
`$comparison = Compare-ADObjectSecurity -SourceObjectDN "CN=AdminSDHolder,CN=System,DC=domain,DC=com" -TargetObjectDN "CN=protecteduser,CN=Users,DC=domain,DC=com"
`$comparison.SDDLMatch

Benefits of AdminSDHolder security:
- Same protection level as AdminSDHolder container
- Protected against inheritance changes
- Consistent with AD's administrative account protection model
- Automatically includes all necessary administrative access rules

"@ -ForegroundColor Green