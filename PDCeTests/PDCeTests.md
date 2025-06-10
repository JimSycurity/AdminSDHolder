# Primary Domain Controller FSMO Role Tests

The goal with this set of tests is to demonstrate that it is the OS of PDC FSMO role hold that is responsible for which items are protected objects and show the flow of protection as a domain is upgraded over time.

## Step 1

A domain with a single Windows Server 2012R2 domain controller. It is the PDCe FSMO role holder. Data is captured from the environment as a baseline.

## Step 2

An additional Windows Server 2016 domain controller is added to the domain. The Server 2012R2 DC remains the PDCe FSMO role holder.

The SIDs for Key Admins and Enterprise Key Admins will now exist.

## Step 3

The PDCe FSMO role is transfered from the Server 2012 R2 DC to the Server 2016 DC.

Key Admins and Enterprise Key Admins names now resolve, but the objects are not protected nor are their members.

## Step 4

A 3rd Windows Server 2019 domain controller is added to the domain. The Server 2016 DC remains the PDCe FSMO role holder.

# Step 5

The PDCe FSMO role is transferred from the Server 2016 DC to the Server 2019 DC.

Key Admins and Enterprise Key Admins, and their members, are now protected objects.
