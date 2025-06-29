<#
.SYNOPSIS
    Sets the security descriptor of the AdminSDHolder object using a provided SDDL string.

.DESCRIPTION
    This function modifies the security descriptor of the AdminSDHolder container in the local domain
    by applying a provided SDDL (Security Descriptor Definition Language) string. This affects
    the security template that Active Directory uses for protected administrative accounts.

.PARAMETER SDDL
    The SDDL (Security Descriptor Definition Language) string to apply to AdminSDHolder.

.PARAMETER AdminSDHolderPath
    Optional custom path to AdminSDHolder. If not specified, auto-detects based on current domain.

.PARAMETER BackupCurrentSecurity
    Creates a backup of the current security descriptor before applying changes.
    The backup will be saved as a file and the path returned in the results.

.PARAMETER Force
    Bypasses confirmation prompts and applies the security descriptor immediately.

.INPUTS
    None
    This function does not accept pipeline input.

.OUTPUTS
    PSCustomObject
    Returns an object containing the operation results including previous and current security information.

.EXAMPLE
    Set-AdminSDHolderSecurity -SDDL "D:(A;;GA;;;SY)(A;;GA;;;DA)"

    Sets AdminSDHolder security to allow only SYSTEM and Domain Admins full access.

.EXAMPLE
    Set-AdminSDHolderSecurity -SDDL "D:(A;;GA;;;SY)(A;;GA;;;DA)(A;;RP;;;AU)" -BackupCurrentSecurity -Force

    Sets AdminSDHolder security with backup and no confirmation prompt.

.EXAMPLE
    $sddl = "D:(A;;GA;;;SY)(A;;GA;;;DA)(A;;RPWPCRCCDCLCLORCWOWDSDDTSW;;;EA)"
    Set-AdminSDHolderSecurity -SDDL $sddl -AdminSDHolderPath "CN=AdminSDHolder,CN=System,DC=domain,DC=com"

    Sets AdminSDHolder security with explicit path and custom SDDL.

.NOTES
    WARNING: This function modifies critical Active Directory security infrastructure.
    - Changes affect all objects protected by AdminSDHolder (administrative accounts)
    - SDProp process will propagate these changes to protected accounts  (Claude with MISC1 - Jim)
    - Always backup current security before making changes
    - Test in lab environments before production use
    - Requires high-level administrative privileges

    This function uses only .NET methods in PowerShell and ADSI for Active Directory operations.
#>
function Set-AdminSDHolderSecurity {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [string]$SDDL,

        [Parameter(Mandatory = $false)]
        [string]$AdminSDHolderPath,

        [Parameter(Mandatory = $false)]
        [switch]$BackupCurrentSecurity,

        [Parameter(Mandatory = $false)]
        [switch]$Force
    )

    $adminSDHolder = $null
    $backupFilePath = $null

    try {
        Write-Verbose "Setting AdminSDHolder security descriptor"

        # Auto-detect AdminSDHolder path if not provided
        if ([string]::IsNullOrEmpty($AdminSDHolderPath)) {
            Write-Verbose "Auto-detecting AdminSDHolder path"
            try {
                # Get current domain
                $domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
                $domainDN = "DC=" + ($domain.Name -replace "\.", ",DC=")
                $AdminSDHolderPath = "CN=AdminSDHolder,CN=System,$domainDN"
                Write-Verbose "Detected AdminSDHolder path: $AdminSDHolderPath"
            }
            catch {
                throw "Could not auto-detect domain. Please provide AdminSDHolderPath parameter explicitly. Error: $($_.Exception.Message)"
            }
        }

        # Validate SDDL format
        Write-Verbose "Validating SDDL format"
        try {
            $testSecurity = New-Object System.DirectoryServices.ActiveDirectorySecurity
            $testSecurity.SetSecurityDescriptorSddlForm($SDDL)
            Write-Verbose "SDDL format validation successful"
        }
        catch {
            throw "Invalid SDDL format: $($_.Exception.Message)"
        }

        # Bind to AdminSDHolder
        Write-Verbose "Binding to AdminSDHolder: $AdminSDHolderPath"
        $adminSDHolder = [ADSI]"LDAP://$AdminSDHolderPath"

        # Validate AdminSDHolder exists
        if ([string]::IsNullOrEmpty($adminSDHolder.distinguishedName)) {
            throw "AdminSDHolder at path '$AdminSDHolderPath' does not exist or is not accessible"
        }

        Write-Verbose "Successfully bound to AdminSDHolder: $($adminSDHolder.distinguishedName)"

        # Get current security descriptor for backup and comparison
        Write-Verbose "Retrieving current security descriptor"
        $currentSecurity = $adminSDHolder.ObjectSecurity
        $currentSDDL = $currentSecurity.GetSecurityDescriptorSddlForm([System.Security.AccessControl.AccessControlSections]::All)
        $currentOwner = $currentSecurity.GetOwner([System.Security.Principal.SecurityIdentifier])
        $currentAccessRules = $currentSecurity.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])

        Write-Verbose "Current security descriptor retrieved (SDDL length: $($currentSDDL.Length), Access rules: $($currentAccessRules.Count))"

        # Create backup if requested
        if ($BackupCurrentSecurity) {
            Write-Verbose "Creating security descriptor backup"
            $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
            $backupFileName = "AdminSDHolder_Security_Backup_$timestamp.txt"
            $backupFilePath = Join-Path -Path $env:TEMP -ChildPath $backupFileName

            $backupContent = @"
AdminSDHolder Security Descriptor Backup
========================================
Date: $(Get-Date)
AdminSDHolder Path: $AdminSDHolderPath
Current Owner: $($currentOwner.Value)
Access Rules Count: $($currentAccessRules.Count)

Current SDDL:
$currentSDDL

"@

            try {
                $backupContent | Out-File -FilePath $backupFilePath -Encoding UTF8
                Write-Verbose "Backup created: $backupFilePath"
            }
            catch {
                Write-Warning "Failed to create backup file: $($_.Exception.Message)"
                $backupFilePath = $null
            }
        }

        # Show security descriptor comparison
        Write-Verbose "Preparing to apply new security descriptor"
        $newSecurity = New-Object System.DirectoryServices.ActiveDirectorySecurity
        $newSecurity.SetSecurityDescriptorSddlForm($SDDL)
        $newOwner = $newSecurity.GetOwner([System.Security.Principal.SecurityIdentifier])
        $newAccessRules = $newSecurity.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])

        # Create confirmation message
        $confirmationMessage = @"
Apply new security descriptor to AdminSDHolder?

Current Security:
  Owner: $($currentOwner.Value)
  Access Rules: $($currentAccessRules.Count)

New Security:
  Owner: $($newOwner.Value)
  Access Rules: $($newAccessRules.Count)

AdminSDHolder Path: $AdminSDHolderPath
"@

        Write-Host $confirmationMessage -ForegroundColor Yellow

        # Confirm the operation
        if ($Force -or $PSCmdlet.ShouldProcess($AdminSDHolderPath, "Apply new security descriptor with $($newAccessRules.Count) access rules")) {

            Write-Verbose "Applying new security descriptor"

            # Apply the new security descriptor
            $adminSDHolder.ObjectSecurity = $newSecurity

            # Commit the changes
            Write-Verbose "Committing security descriptor changes"
            $adminSDHolder.CommitChanges()

            # Refresh and verify
            $adminSDHolder.RefreshCache()
            $appliedSecurity = $adminSDHolder.ObjectSecurity
            $appliedSDDL = $appliedSecurity.GetSecurityDescriptorSddlForm([System.Security.AccessControl.AccessControlSections]::All)
            $appliedOwner = $appliedSecurity.GetOwner([System.Security.Principal.SecurityIdentifier])
            $appliedAccessRules = $appliedSecurity.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])

            # Verify application
            $sddlMatch = ($SDDL -eq $appliedSDDL)

            Write-Verbose "Security descriptor applied successfully"
            Write-Verbose "SDDL verification: $(if ($sddlMatch) { 'Perfect match' } else { 'Applied SDDL differs from input' })"

            # Important note about SDProp
            Write-Host "`nIMPORTANT: The AdminSDHolder security changes will be propagated to protected administrative accounts by the SDProp process. (Claude with MISC1 - Jim)" -ForegroundColor Cyan  # Claude with MISC1
            Write-Host "This typically runs every 60 minutes, or can be triggered manually using:" -ForegroundColor Cyan
            Write-Host "  ldp.exe -> Modify -> Run SDProp    (Claude with MISC3) - Jim" -ForegroundColor White  # Claude with MISC3
            Write-Host "  Or: Get-ADObject -Filter 'adminCount -eq 1' | Set-ADObject -Replace @{adminCount=1}  (Claude with MISC5 and hallucinations - Jim" -ForegroundColor White # Claude with MISC5

            # Return success result
            return [PSCustomObject]@{
                AdminSDHolderPath       = $AdminSDHolderPath
                Operation               = "Set Security Descriptor"
                InputSDDL               = $SDDL
                AppliedSDDL             = $appliedSDDL
                SDDLMatch               = $sddlMatch
                PreviousOwner           = $currentOwner.Value
                NewOwner                = $appliedOwner.Value
                PreviousAccessRuleCount = $currentAccessRules.Count
                NewAccessRuleCount      = $appliedAccessRules.Count
                BackupFilePath          = $backupFilePath
                Success                 = $true
                Timestamp               = Get-Date
                SDPropNote              = "Changes will propagate to protected accounts via SDProp process  (Claude with MISC1.  Changes propagate with ProtectAdminGroups - Jim)" # Claude with MISC1
            }
        }
        else {
            Write-Verbose "Operation cancelled by user"
            return [PSCustomObject]@{
                AdminSDHolderPath       = $AdminSDHolderPath
                Operation               = "Set Security Descriptor"
                InputSDDL               = $SDDL
                AppliedSDDL             = "Not applied - cancelled"
                SDDLMatch               = $false
                PreviousOwner           = $currentOwner.Value
                NewOwner                = "Not changed - cancelled"
                PreviousAccessRuleCount = $currentAccessRules.Count
                NewAccessRuleCount      = "Not changed - cancelled"
                BackupFilePath          = $backupFilePath
                Success                 = $false
                Error                   = "Operation cancelled by user"
                Timestamp               = Get-Date
                SDPropNote              = "No changes made  (MISC1 - Jim)"  # Claude with MISC1
            }
        }
    }
    catch {
        Write-Error "Failed to set AdminSDHolder security descriptor: $($_.Exception.Message)"
        return [PSCustomObject]@{
            AdminSDHolderPath       = if ($AdminSDHolderPath) { $AdminSDHolderPath } else { "Auto-detect failed" }
            Operation               = "Set Security Descriptor"
            InputSDDL               = $SDDL
            AppliedSDDL             = "Failed to apply"
            SDDLMatch               = $false
            PreviousOwner           = "Failed to retrieve"
            NewOwner                = "Failed to apply"
            PreviousAccessRuleCount = "Failed to retrieve"
            NewAccessRuleCount      = "Failed to apply"
            BackupFilePath          = $backupFilePath
            Success                 = $false
            Error                   = $_.Exception.Message
            Timestamp               = Get-Date
            SDPropNote              = "No changes made due to error  (MISC1 - Jim" # Claud with MISC1
        }
    }
    finally {
        # Clean up ADSI objects
        if ($adminSDHolder) {
            try { $adminSDHolder.Dispose() } catch { }
        }
    }
}

# Helper function to get current AdminSDHolder security
function Get-AdminSDHolderSecurity {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$AdminSDHolderPath
    )

    try {
        # Auto-detect AdminSDHolder path if not provided
        if ([string]::IsNullOrEmpty($AdminSDHolderPath)) {
            $domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
            $domainDN = "DC=" + ($domain.Name -replace "\.", ",DC=")
            $AdminSDHolderPath = "CN=AdminSDHolder,CN=System,$domainDN"
        }

        $adminSDHolder = [ADSI]"LDAP://$AdminSDHolderPath"
        $security = $adminSDHolder.ObjectSecurity
        $sddl = $security.GetSecurityDescriptorSddlForm([System.Security.AccessControl.AccessControlSections]::All)
        $owner = $security.GetOwner([System.Security.Principal.SecurityIdentifier])
        $accessRules = $security.GetAccessRules($true, $true, [System.Security.Principal.SecurityIdentifier])

        return [PSCustomObject]@{
            AdminSDHolderPath = $AdminSDHolderPath
            Owner             = $owner.Value
            AccessRuleCount   = $accessRules.Count
            SDDL              = $sddl
            AccessRules       = $accessRules
        }
    }
    catch {
        Write-Error "Failed to get AdminSDHolder security: $($_.Exception.Message)"
        return $null
    }
    finally {
        if ($adminSDHolder) { $adminSDHolder.Dispose() }
    }
}

# Example usage helper
Write-Host @"
Set-AdminSDHolderSecurity Function Loaded
========================================

Basic Examples:

# Set minimal security (SYSTEM and Domain Admins only)
Set-AdminSDHolderSecurity -SDDL "D:(A;;GA;;;SY)(A;;GA;;;DA)" -BackupCurrentSecurity

# Set security with Enterprise Admins access
`$sddl = "D:(A;;GA;;;SY)(A;;GA;;;DA)(A;;RPWPCRCCDCLCLORCWOWDSDDTSW;;;EA)"
Set-AdminSDHolderSecurity -SDDL `$sddl -Force

# Get current AdminSDHolder security
`$current = Get-AdminSDHolderSecurity
`$current.SDDL

# Set custom security with explicit path
Set-AdminSDHolderSecurity -SDDL "D:(A;;GA;;;SY)(A;;GA;;;DA)" -AdminSDHolderPath "CN=AdminSDHolder,CN=System,DC=domain,DC=com"

WARNING: Changes to AdminSDHolder affect all protected administrative accounts!
The SDProp process will propagate these changes every 60 minutes. (Claude with MISC1)

Common SDDL Patterns:
- D:(A;;GA;;;SY)(A;;GA;;;DA) = SYSTEM and Domain Admins full access
- D:(A;;GA;;;SY)(A;;GA;;;DA)(A;;GA;;;EA) = Add Enterprise Admins full access
- D:(A;;GA;;;SY)(A;;GA;;;DA)(A;;RP;;;AU) = Add Authenticated Users read access

"@ -ForegroundColor Green