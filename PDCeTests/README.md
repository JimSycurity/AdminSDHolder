# Primary Domain Controller FSMO Role Tests

The goal with this set of tests is to demonstrate that it is the OS of PDC FSMO role hold that is responsible for which items are protected objects and show the flow of protection as a domain is upgraded over time.

During each step of the test I will capture a baseline without the Create-AdminSdHolderTest.ps1 and then a post test capture. This means that between steps I will be performing a Delete Subtree operation on the AdminSDHolderTests OU prior to capturing the baseline.

## Step 1

A domain with a single Windows Server 2012R2 domain controller. It is the PDCe FSMO role holder.

1. Data is captured from the environment as a baseline:

- AdminSDHolder-SD-2012R2.txt
- DSACLS.txt
- LDP SecurityDescriptor Dump.txt
- Screenshot 2025-04-18 140204.png
- Screenshot 2025-04-18 151852.png
- Sysinfo.txt
- Test-AdminSDHolderBaseline.csv

2. Create-AdminSDHolderTest.ps1 is run to populate objects in groups:

- Create-AdminSDHolderTest.txt

3. Capture data post test:

- Test-AdminSDHolderPostTest.csv

In hindsight, I should have captured the security descriptor of the domain root, showing that Enterprise Key Admins and Key Admins were not present.

## Step 2

An additional Windows Server 2016 domain controller is added to the domain. The Server 2012R2 DC remains the PDCe FSMO role holder.

The SIDs for Key Admins and Enterprise Key Admins will now exist, but not resolve to names.

1. Delete Subtree OU=AdminSDHolderTests
2. Validate that SD-DC2012R2PDCE is still the PDCe FSMO role holder:

- FSMORoles.png

## Step 3

The PDCe FSMO role is transfered from the Server 2012 R2 DC to the Server 2016 DC.

Key Admins and Enterprise Key Admins names now resolve, but the objects are not protected nor are their members.

## Step 4

A 3rd Windows Server 2019 domain controller is added to the domain. The Server 2016 DC remains the PDCe FSMO role holder.

# Step 5

The PDCe FSMO role is transferred from the Server 2016 DC to the Server 2019 DC.

Key Admins and Enterprise Key Admins, and their members, are now protected objects.
