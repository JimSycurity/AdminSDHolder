<#
.SYNOPSIS
    Creates an Active Directory container with custom security descriptor.

.DESCRIPTION
    This function creates a new container object in Active Directory at the specified path
    and applies either a provided SDDL string or an ActiveDirectorySecurity object to set
    the container's security descriptor.

.PARAMETER ContainerName
    The name of the container to create (without CN= prefix).

.PARAMETER ParentPath
    The Distinguished Name of the parent container where the new container will be created.

.PARAMETER SDDL
    An SDDL (Security Descriptor Definition Language) string to apply to the container.
    Cannot be used together with SecurityDescriptor parameter.

.PARAMETER SecurityDescriptor
    An ActiveDirectorySecurity object to apply to the container.
    Cannot be used together with SDDL parameter.

.PARAMETER Description
    Optional description for the container.

.INPUTS
    None
    This function does not accept pipeline input.

.OUTPUTS
    PSCustomObject
    Returns an object containing the operation results including the created container's DN and security information.

.EXAMPLE
    New-ADContainer -ContainerName "TestContainer" -ParentPath "OU=Test,DC=domain,DC=com" -SDDL "D:(A;;GA;;;SY)(A;;GA;;;DA)"

    Creates a container named "TestContainer" with the specified SDDL security descriptor.

.EXAMPLE
    $security = New-Object System.DirectoryServices.ActiveDirectorySecurity
    $rule = New-Object System.Security.AccessControl.ActiveDirectoryAccessRule(
        [System.Security.Principal.SecurityIdentifier]"S-1-5-32-544",
        [System.DirectoryServices.ActiveDirectoryRights]::FullControl,
        [System.Security.AccessControl.AccessControlType]::Allow
    )
    $security.SetAccessRule($rule)
    New-ADContainer -ContainerName "SecureContainer" -ParentPath "CN=System,DC=domain,DC=com" -SecurityDescriptor $security

    Creates a container with a custom ActiveDirectorySecurity object.

.EXAMPLE
    New-ADContainer -ContainerName "MyContainer" -ParentPath "DC=domain,DC=com" -Description "Custom container for testing" -SDDL "D:(A;;GA;;;WD)"

    Creates a container with a description and grants full access to Everyone.

.NOTES
    This function uses only .NET methods in PowerShell and ADSI for Active Directory operations.
    Requires appropriate permissions to create objects in the target container.
    The container will be created with objectClass "container".
#>
function New-ADContainer {
    [CmdletBinding(DefaultParameterSetName = 'SDDL')]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ContainerName,

        [Parameter(Mandatory = $true)]
        [string]$ParentPath,

        [Parameter(Mandatory = $true, ParameterSetName = 'SDDL')]
        [string]$SDDL,

        [Parameter(Mandatory = $true, ParameterSetName = 'SecurityDescriptor')]
        [System.DirectoryServices.ActiveDirectorySecurity]$SecurityDescriptor,

        [Parameter(Mandatory = $false)]
        [string]$Description
    )

    $parentEntry = $null
    $newContainer = $null

    try {
        Write-Verbose "Creating container '$ContainerName' in parent '$ParentPath'"

        # Create the full Distinguished Name for the new container
        $containerDN = "CN=$ContainerName,$ParentPath"
        Write-Verbose "Container DN will be: $containerDN"

        # Bind to the parent container
        Write-Verbose "Binding to parent container: $ParentPath"
        $parentEntry = [ADSI]"LDAP://$ParentPath"

        # Validate parent exists
        if ([string]::IsNullOrEmpty($parentEntry.distinguishedName)) {
            throw "Parent path '$ParentPath' does not exist or is not accessible"
        }

        Write-Verbose "Successfully bound to parent: $($parentEntry.distinguishedName)"

        # Check if container already exists
        try {
            $existingContainer = [ADSI]"LDAP://$containerDN"
            if (-not [string]::IsNullOrEmpty($existingContainer.distinguishedName)) {
                throw "Container '$containerDN' already exists"
            }
        }
        catch [System.Runtime.InteropServices.COMException] {
            # Expected if container doesn't exist - continue
            Write-Verbose "Container does not exist (as expected)"
        }

        # Create the new container
        Write-Verbose "Creating new container object"
        $newContainer = $parentEntry.Children.Add("CN=$ContainerName", "container")

        # Set description if provided
        if (-not [string]::IsNullOrEmpty($Description)) {
            Write-Verbose "Setting description: $Description"
            $newContainer.Properties["description"].Value = $Description
        }

        # Commit the container creation first
        Write-Verbose "Committing container creation"
        $newContainer.CommitChanges()
        Write-Verbose "Container created successfully"

        # Now apply the security descriptor
        Write-Verbose "Applying security descriptor"

        if ($PSCmdlet.ParameterSetName -eq 'SDDL') {
            Write-Verbose "Converting SDDL to ActiveDirectorySecurity object"

            # Create ActiveDirectorySecurity object from SDDL
            $adSecurity = New-Object System.DirectoryServices.ActiveDirectorySecurity
            $adSecurity.SetSecurityDescriptorSddlForm($SDDL)

            Write-Verbose "Applying SDDL security descriptor"
            $newContainer.ObjectSecurity = $adSecurity
        }
        else {
            Write-Verbose "Applying provided ActiveDirectorySecurity object"
            $newContainer.ObjectSecurity = $SecurityDescriptor
        }

        # Commit the security changes
        Write-Verbose "Committing security descriptor changes"
        $newContainer.CommitChanges()

        # Refresh to get current state
        $newContainer.RefreshCache()

        # Get the applied security descriptor for verification
        $appliedSecurity = $newContainer.ObjectSecurity
        $appliedSDDL = $appliedSecurity.GetSecurityDescriptorSddlForm([System.Security.AccessControl.AccessControlSections]::All)

        Write-Verbose "Security descriptor applied successfully"

        # Return success result
        return [PSCustomObject]@{
            ContainerName     = $ContainerName
            DistinguishedName = $containerDN
            ParentPath        = $ParentPath
            Description       = if ($Description) { $Description } else { "Not set" }
            SecurityMethod    = $PSCmdlet.ParameterSetName
            AppliedSDDL       = $appliedSDDL
            ObjectClass       = "container"
            Success           = $true
            Timestamp         = Get-Date
        }
    }
    catch {
        Write-Error "Failed to create container '$ContainerName': $($_.Exception.Message)"
        return [PSCustomObject]@{
            ContainerName     = $ContainerName
            DistinguishedName = "CN=$ContainerName,$ParentPath"
            ParentPath        = $ParentPath
            Description       = if ($Description) { $Description } else { "Not set" }
            SecurityMethod    = $PSCmdlet.ParameterSetName
            AppliedSDDL       = "Failed to apply"
            ObjectClass       = "container"
            Success           = $false
            Error             = $_.Exception.Message
            Timestamp         = Get-Date
        }
    }
    finally {
        # Clean up ADSI objects
        if ($newContainer) {
            try { $newContainer.Dispose() } catch { }
        }
        if ($parentEntry) {
            try { $parentEntry.Dispose() } catch { }
        }
    }
}

# Helper function to create common security descriptors
function New-ContainerSecurityDescriptor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$PrincipalSID,

        [Parameter(Mandatory = $false)]
        [System.DirectoryServices.ActiveDirectoryRights]$Rights = [System.DirectoryServices.ActiveDirectoryRights]::GenericAll,

        [Parameter(Mandatory = $false)]
        [System.Security.AccessControl.AccessControlType]$AccessType = [System.Security.AccessControl.AccessControlType]::Allow,

        [Parameter(Mandatory = $false)]
        [System.DirectoryServices.ActiveDirectorySecurityInheritance]$Inheritance = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::All
    )

    try {
        # Create security descriptor
        $security = New-Object System.DirectoryServices.ActiveDirectorySecurity

        # Create access rule
        $sid = New-Object System.Security.Principal.SecurityIdentifier($PrincipalSID)
        $accessRule = New-Object System.Security.AccessControl.ActiveDirectoryAccessRule(
            $sid,
            $Rights,
            $AccessType,
            [System.Guid]::Empty,
            $Inheritance
        )

        # Add the rule
        $security.SetAccessRule($accessRule)

        return $security
    }
    catch {
        Write-Error "Failed to create security descriptor: $($_.Exception.Message)"
        return $null
    }
}

# Example usage helper
Write-Host @"
New-ADContainer Function Loaded
==============================

Basic Examples:

# Create container with SDDL
New-ADContainer -ContainerName "TestContainer" -ParentPath "DC=domain,DC=com" -SDDL "D:(A;;GA;;;SY)(A;;GA;;;DA)"

# Create container with custom security object
`$security = New-ContainerSecurityDescriptor -PrincipalSID "S-1-5-32-544" -Rights FullControl
New-ADContainer -ContainerName "SecureContainer" -ParentPath "DC=domain,DC=com" -SecurityDescriptor `$security

# Create container with description
New-ADContainer -ContainerName "MyContainer" -ParentPath "OU=Test,DC=domain,DC=com" -Description "Test container" -SDDL "D:(A;;GA;;;WD)"

Common SIDs:
- S-1-5-32-544 = Administrators
- S-1-5-32-545 = Users
- S-1-1-0 = Everyone
- S-1-5-18 = SYSTEM
- S-1-5-19 = LOCAL SERVICE
- S-1-5-20 = NETWORK SERVICE

"@ -ForegroundColor Green