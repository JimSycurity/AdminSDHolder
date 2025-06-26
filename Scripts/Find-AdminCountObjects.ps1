<#
.SYNOPSIS
    Searches Active Directory for all objects that have an adminCount attribute set to 1.

.DESCRIPTION
    This function uses .NET DirectorySearcher to find all Active Directory objects with
    adminCount=1. It searches the entire current domain and returns detailed information
    about each matching object including Distinguished Name, object class, and account names.

.PARAMETER Domain
    The domain to search. If not specified, uses the current domain.

.PARAMETER SearchBase
    The Distinguished Name of the container to start the search from. If not specified,
    searches from the domain root.

.INPUTS
    None
    This function does not accept pipeline input.

.OUTPUTS
    PSCustomObject[]
    Returns an array of objects containing DistinguishedName, Name, SAMAccountName,
    ObjectClass, and AdminCount properties for each matching object.

.EXAMPLE
    Find-AdminCountObjects

    Searches the current domain for all objects with adminCount=1 and displays results.

.EXAMPLE
    $adminObjects = Find-AdminCountObjects
    $adminObjects | Where-Object { $_.ObjectClass -eq "user" }

    Finds all adminCount=1 objects and filters to show only user objects.

.EXAMPLE
    Find-AdminCountObjects | Select-Object -ExpandProperty DistinguishedName | Clear-AdminCount

    Finds all adminCount=1 objects and pipes their Distinguished Names to Clear-AdminCount function.

.EXAMPLE
    $results = Find-AdminCountObjects
    $results | Export-Csv -Path "AdminCountObjects.csv" -NoTypeInformation

    Finds all adminCount=1 objects and exports the results to a CSV file.

.EXAMPLE
    Find-AdminCountObjects -SearchBase "OU=Users,DC=domain,DC=com"

    Searches only within the specified organizational unit for adminCount=1 objects.

.NOTES
    This function uses only .NET methods in PowerShell and DirectorySearcher for Active Directory operations.
    Requires appropriate permissions to read Active Directory objects.
#>
function Find-AdminCountObjects {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$Domain,

        [Parameter(Mandatory = $false)]
        [string]$SearchBase
    )

    try {
        # Determine the search root
        if ([string]::IsNullOrEmpty($SearchBase)) {
            if ([string]::IsNullOrEmpty($Domain)) {
                # Get the current domain's distinguished name
                $domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
                $domainDN = "DC=" + ($domainObj.Name -replace "\.", ",DC=")
                $domainName = $domainObj.Name
                Write-Verbose "Using current domain: $domainName ($domainDN)"
            }
            else {
                # Use specified domain
                $domainDN = "DC=" + ($Domain -replace "\.", ",DC=")
                $domainName = $Domain
                Write-Verbose "Using specified domain: $domainName ($domainDN)"
            }
            $searchRoot = "LDAP://$domainDN"
        }
        else {
            # Use specified search base
            $searchRoot = "LDAP://$SearchBase"
            $domainName = "Custom SearchBase"
            Write-Verbose "Using specified search base: $SearchBase"
        }

        Write-Verbose "Search root: $searchRoot"

        # Create DirectorySearcher object
        $searcher = New-Object System.DirectoryServices.DirectorySearcher
        $searcher.SearchRoot = New-Object System.DirectoryServices.DirectoryEntry($searchRoot)

        # Set the LDAP filter to find objects with adminCount = 1
        $searcher.Filter = "(adminCount=1)"

        # Specify which properties to load
        $searcher.PropertiesToLoad.AddRange(@("distinguishedName", "objectClass", "sAMAccountName", "adminCount", "name"))

        # Set search scope to subtree (search entire container)
        $searcher.SearchScope = [System.DirectoryServices.SearchScope]::Subtree

        # Set page size for large result sets
        $searcher.PageSize = 1000

        Write-Verbose "Executing search for objects with adminCount=1..."

        # Execute the search
        $searchResults = $searcher.FindAll()

        Write-Verbose "Found $($searchResults.Count) objects with adminCount=1"

        # Process and display results
        $results = @()
        foreach ($result in $searchResults) {
            $properties = $result.Properties

            # Extract property values safely
            $distinguishedName = if ($properties["distinguishedName"].Count -gt 0) { $properties["distinguishedName"][0] } else { "N/A" }
            $objectClass = if ($properties["objectClass"].Count -gt 0) { $properties["objectClass"][-1] } else { "N/A" }  # Last value is most specific
            $sAMAccountName = if ($properties["sAMAccountName"].Count -gt 0) { $properties["sAMAccountName"][0] } else { "N/A" }
            $adminCount = if ($properties["adminCount"].Count -gt 0) { $properties["adminCount"][0] } else { "N/A" }
            $name = if ($properties["name"].Count -gt 0) { $properties["name"][0] } else { "N/A" }

            # Create result object
            $objectInfo = [PSCustomObject]@{
                DistinguishedName = $distinguishedName
                Name              = $name
                SAMAccountName    = $sAMAccountName
                ObjectClass       = $objectClass
                AdminCount        = $adminCount
            }

            $results += $objectInfo
        }

        # Display summary information if verbose
        if ($results.Count -gt 0) {
            Write-Verbose "Objects found by class: $(($results | Group-Object ObjectClass | ForEach-Object { "$($_.Name): $($_.Count)" }) -join ', ')"
        }

        # Clean up
        $searchResults.Dispose()
        $searcher.Dispose()

        # Return results
        return $results
    }
    catch {
        Write-Error "Failed to search for adminCount objects: $($_.Exception.Message)"
        return @()
    }
}