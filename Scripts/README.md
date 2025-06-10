# AdminSDHolder Scripts

I'm not a professional developer or software engineer. These scripts perform the functions I need of them, but they are not elegant or production ready. Use at your own risk.

## Create-AdminSDHolderTest.ps1

The purpose of this script is to build a configuration in an AD Domain to
determine which objects are protected by AdminSDHolder programatically.

1. First build an OU structure, groups, and security principals
   of different types.
2. Nest those objects in all available groups that are suspected to
   include transitive group membership when the object is protected.
3. Start the Protection Operation on the PDCe

## Get-PowerShellSD.ps1

This script captures data from an AD Domain including data about the domain itself. It then collects the security descriptor of the AdminSDHolder object in multiple formats and outputs it to a text file.

## SecurityDescriptorMatchTest.ps1

This script is a POC to show that if an object already has an exact match of the security descriptor of AdminSDHolder and then is added to a group such that it is in scope of the ProtectAdminGroups task, the object will not be protected by AdminSDHolder and will not receive an adminCount of 1 because the security descriptor already matches.

## Test-AdminSDHolder.ps1

The purpose of this script is to collect data about the AdminSDHolder for each domain in the forest and '
then compare all security principals in each domain in the forest to that AdminSDHolder, looking for either
an exact SD match or a match based on implicit ACEs and other characteristics to account for instances
where inheritence is unfortunately enabled on the AdminSDHolder object.

The output is a CSV file with rows expressing each security principal that was compared and columns providing
data on each principal, including enough information to determine whether that object is a protected object.
