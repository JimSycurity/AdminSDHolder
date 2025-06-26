<#
.SYNOPSIS
    Clears the adminCount attribute from Active Directory objects when set to 1.

.DESCRIPTION
    This function checks if an Active Directory object has an adminCount attribute set to 1,
    and if so, clears the attribute by setting it to null. The function supports pipeline
    input for batch processing multiple objects.

    **WARNING:** This script is not intended to be used in a production environment.
    This is for testing purposes only.  Use at your own risk!

.PARAMETER DistinguishedName
    The Distinguished Name of the Active Directory object to process. This parameter accepts
    pipeline input and can be bound by property name.

.INPUTS
    System.String
    You can pipe Distinguished Name strings to this function.

    PSCustomObject
    You can pipe objects with a DistinguishedName property to this function.

.OUTPUTS
    PSCustomObject
    Returns an object containing the processing results including DistinguishedName,
    previous and current adminCount values, action taken, and success status.

.EXAMPLE
    Clear-AdminCount -DistinguishedName "CN=TestUser,CN=Users,DC=domain,DC=com"

    Processes a single Active Directory object and clears its adminCount if set to 1.

.EXAMPLE
    @("CN=User1,CN=Users,DC=domain,DC=com", "CN=User2,CN=Users,DC=domain,DC=com") | Clear-AdminCount

    Processes multiple Distinguished Names from an array via pipeline.

.EXAMPLE
    $users = @(
        [PSCustomObject]@{ DistinguishedName = "CN=User1,CN=Users,DC=domain,DC=com" },
        [PSCustomObject]@{ DistinguishedName = "CN=User2,CN=Users,DC=domain,DC=com" }
    )
    $users | Clear-AdminCount

    Processes objects containing DistinguishedName properties via pipeline.

.EXAMPLE
    Get-ADUser -Filter "adminCount -eq 1" | Select-Object DistinguishedName | Clear-AdminCount

    Finds all users with adminCount set to 1 and clears the attribute for each.

.EXAMPLE
    $results = @("CN=User1,CN=Users,DC=domain,DC=com", "CN=User2,CN=Users,DC=domain,DC=com") | Clear-AdminCount
    $results | Where-Object { $_.Success -eq $false } | Format-Table -AutoSize

    Processes multiple objects and filters results to show only failed operations.

.NOTES
    This function uses only .NET methods in PowerShell and ADSI for Active Directory operations.
    Requires appropriate permissions to modify the target Active Directory objects.
#>
function Clear-AdminCount {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string]$DistinguishedName
    )

    begin {
        Write-Verbose "Starting Clear-AdminCount pipeline processing"
    }

    process {
        try {
            # Bind to the AD object
            Write-Verbose "Processing: $DistinguishedName"
            $adsiObject = [ADSI]"LDAP://$DistinguishedName"

            # Validate the object exists
            $null = $adsiObject.distinguishedName
            if ([string]::IsNullOrEmpty($adsiObject.distinguishedName)) {
                throw "Distinguished Name '$DistinguishedName' does not exist or is not accessible"
            }

            Write-Verbose "Successfully bound to AD object: $($adsiObject.distinguishedName)"

            # Check if adminCount attribute exists and get its value
            $adminCountProperty = $adsiObject.Properties["adminCount"]
            $currentAdminCount = $null

            if ($adminCountProperty.Count -gt 0) {
                $currentAdminCount = $adminCountProperty.Value
                Write-Verbose "Current adminCount value: $currentAdminCount"
            }
            else {
                Write-Verbose "adminCount attribute is not set or does not exist"
            }

            # Check if adminCount is set to 1
            if ($currentAdminCount -eq 1) {
                Write-Verbose "adminCount is set to 1, clearing the attribute"

                # Clear the adminCount attribute by setting it to null
                $adsiObject.Properties["adminCount"].Clear()

                # Commit the changes
                $adsiObject.CommitChanges()

                Write-Verbose "Successfully cleared adminCount attribute for $DistinguishedName"

                [PSCustomObject]@{
                    DistinguishedName  = $DistinguishedName
                    PreviousAdminCount = $currentAdminCount
                    CurrentAdminCount  = $null
                    ActionTaken        = "Cleared adminCount attribute"
                    Success            = $true
                }
            }
            elseif ($currentAdminCount -eq $null -or $adminCountProperty.Count -eq 0) {
                Write-Verbose "adminCount is already null or not set for $DistinguishedName - no action needed"

                [PSCustomObject]@{
                    DistinguishedName  = $DistinguishedName
                    PreviousAdminCount = $null
                    CurrentAdminCount  = $null
                    ActionTaken        = "No action needed - adminCount already null"
                    Success            = $true
                }
            }
            else {
                Write-Verbose "adminCount is set to $currentAdminCount (not 1) for $DistinguishedName - no action needed"

                [PSCustomObject]@{
                    DistinguishedName  = $DistinguishedName
                    PreviousAdminCount = $currentAdminCount
                    CurrentAdminCount  = $currentAdminCount
                    ActionTaken        = "No action needed - adminCount is not 1"
                    Success            = $true
                }
            }
        }
        catch {
            Write-Error "Failed to process adminCount for '$DistinguishedName': $($_.Exception.Message)"
            [PSCustomObject]@{
                DistinguishedName  = $DistinguishedName
                PreviousAdminCount = if ($currentAdminCount) { $currentAdminCount } else { "Unknown" }
                CurrentAdminCount  = "Unknown"
                ActionTaken        = "Failed"
                Success            = $false
                Error              = $_.Exception.Message
            }
        }
    }

    end {
        Write-Verbose "Completed Clear-AdminCount pipeline processing"
    }
}