# Primary Domain Controller FSMO Role Tests

The goal with this set of tests is to demonstrate that it is the OS of PDC FSMO role hold that is responsible for which items are protected objects and show the flow of protection as a domain is upgraded over time.

During each step of the test I will capture a baseline without the Create-AdminSdHolderTest.ps1 and then a post test capture. This means that between steps I will be performing a Delete Subtree operation on the AdminSDHolderTests OU prior to capturing the baseline.

## Step 1

A domain with a single Windows Server 2012R2 domain controller: SD-DC2012R2PDCeTests. It is the PDCe FSMO role holder.

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

An additional Windows Server 2016 domain controller SD-DC2016CUPDCeTests is added to the domain and promoted. The Server 2012R2 DC SD-DC2012R2PDCeTests remains the PDCe FSMO role holder.

The SIDs for Key Admins and Enterprise Key Admins will now exist in security descriptors, such as the domain root, but not resolve to names. This is because the principals do not exist in AD yet. At this point those SIDs in the DACLs are not much different than an orphaned SID. Except the principal hasn't been deleted leaving an orphaned SID. The SID is in an ACE in the DACL but the principal(s) don't exist yet.

1. Delete Subtree OU=AdminSDHolderTests
2. Validate that SD-DC2012R2PDCE is still the PDCe FSMO role holder:
   - FSMORoles.png
3. Data is captured from the environment as a baseline:
   - AdminSDHolder-SD-2012R2.txt
   - DomainRoot.png
   - DomainRoot.txt
   - DomainRoot2016.png
   - DSACLS.txt
   - LDP SecurityDescriptor Dump.txt
   - Sysinfo.txt
   - Test-AdminSDHolderBaseline.csv
4. Create-AdminSDHolderTest.ps1
   - Create-AdminSDHolderTest.txt
   - CouldNotFindGroup.png
5. Capture data post test:
   - Test-AdminSDHolderPostTest.csv

## Step 3

The PDCe FSMO role is transfered from the Server 2012 R2 DC SD-DC2012R2PDCeTests to the Server 2016 DC SD-DC2016CUPDCeTests.

Key Admins and Enterprise Key Admins names now resolve. Key Admins is now protected (after a delay). Enterprise Key Admins is not protected.

1. Delete Subtree OU=AdminSDHolderTests
2. Transfer the PDCe FSMO Role to SD-DC2016PDCeTests
   - TransferPDCeRole.png
   - OperationsMasters.png
3. Review Groups: Key Admins and Enterprise Key Admins exist upon transfer of PDCe role to Server 2016 DC.
   - KeyAdminsPrincipals.png
4. Review Domain Root security descriptor: Note that Enterprise Key Admins is the trustee on 2 ACEs in the domain root DACL. Grant Allow Enterprise Key Admins ReadProperty/WriteProperty on the msDS-KeyCredentialLink property & Grant Allow Enterprise Key Admins FullControl. Both ACEs are configured to be inheritable. This Full Control ACE is an error on Microsoft's part. I'm not sure what they were thinking or why this happened, but this ACE was removed in a later version of Windows, specifically the [Windows Server Semi-Annual Channel and all versions after that](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/deploy/domain-wide-updates#windows-server-semi-annual-channel-domain-wide-updates), so 2019+. This ACE that grants Enterprise Key Admins FullControl (GenericAll) over domain root means that Enterprise Key Admins is a Tier Zero security principal. Yet as we'll see in our baseline collection, this group is not protected by AdminSDHolder. So for many organizations, for the entire time that their PDCe was Server 2016, there is a Tier Zero group which has Full Control over the domain and it's not protected in any way. Daniel Ulrichs [blogged about this back in 2017](https://secureidentity.se/adprep-bug-in-windows-server-2016/). In the blog he states that he reported the Enterprise Key Admins FullControl issue to MSRC on 12/29/2016. MSRC's response was to claim it was not a vulnerability because "Quote MSRC: The reason being is that customers should not be adding new members to groups of high-privilege without full understanding of what they are doing." Any attacker managing to add an attacker-controlled account to Enterprise Key Admins would be able to DCSync the domain, resulting in full AD Forest compromise.
   - DomainRoot.png
   - DomainRoot2016.txt
   - DomainRootLDP.png
5. Data is captured from the environment as a baseline: Note that neither Key Admins or Enterprise Key Admins is protected by AdminSDHolder.
   - AdminSDHolder-SD-2012R2.txt
   - AdminSDHolder-SD-2016.txt
   - DSACLS.txt
   - LDP SecurityDescriptor Dump.txt
   - Sysinfo2012R2.txt
   - Sysinfo2016.txt
   - Test-AdminSDHolderBaseline.csv
6. Create-AdminSDHolderTest.ps1
   - Create-AdminSDHolderTest.txt
7. Capture data post test:
   - Test-AdminSDHolderPostTest.csv

**Observation:** In step 7 during the post-test capture the Key Admins group is now protected by AdminSDHolder and so are its members. Enterprise Key Admins, the most highly privileged of the two key admins groups, is still not protected by AdminSDHolder and neither are its members.

**Note:** I did not manually force AdminSDHolder's ProtectAdminGroups task to run prior to collecting baseline data. Nor did I manually force AdminSDHolder's ProtectAdminGroups task to run prior to collecting baseline data in any of the OS Levels tests. However, in all OS Levels test instances, the Domain Controller was the PDCe of its domain for at least 1 hour before I collected the baseline data, so ProtectAdminGroups task should have run automatically. I can potentially validate this via timestamps of domain creation on, for example, SD-DC2016 and compare it with the timestamp of the baseline data collection. In reviewing another forest in my lab running Windows Server 2016 on the only DC the Key Admins group is protected by AdminSDHolder, but Enterprise Key Admins is not.

**Hypothesis:** I speculate that in Windows Server 2016, Microsoft added both Key Admins and Enterprise Key Admins to the AccountDomainSecureAdminTable. This is appropriate for Key Admins as it is a global security group, but not appropriate for Enterprise Key Admins as it is a universal security group that exists at the AD Forest level, same as Enterprise Admins and Schema Admins. The way I read the code, the processing path would from AccountDomainSecureAdminTable would have resulted in Key Admins being protected (eventually, I'll get to that in a moment), but not Enterprise Key Admins due to the group scope and the way the different structs are handled in the process of sending objects to the global catalog query sets. I also speculate that the change that Microsoft made in Windows Server 2019 and SAC 1804 was the appropriately add Enterprise Key Admins to the step where the SIDs for Enterprise Admins and Schema Admins are gathered and pass the group through the process with that list, while also removing Enterprise Key Admins from the AccountDomainSecureAdminTable. However, I don't have access to Windows source code from this era to validate and I'm not sure how to go about debugging something like that.

As for the delay in Key Admins being protected when a Server 2016 DC is made the PDCe FSMO role holder, I speculate that the updated AccountDomainSecureAdminTable list isn't part of the SampProtectAdministratorsList() function until either that PDCe DC is rebooted or the ProtectAdminGroups() task is forced to run manually, which reloads the task.

## Step 4

A 3rd Windows Server 2019 domain controller SD-DC2019CUPDCeTests is added to the domain and promoted. The Server 2016 DC SD-DC2016CUPDCeTests remains the PDCe FSMO role holder.

1. Delete Subtree OU=AdminSDHolderTests
2. Promote SD-DC2019CUPDCeTests to a DC
3. Validate that SD-DC2012R2PDCE is still the PDCe FSMO role holder:
   - FSMORoles.png
4. Data is captured from the environment as a baseline
   - AdminSDHolder-SD-2016.txt
   - Test-AdminSDHolderBaseline.csv
   - LDP Security Descriptor Dump.txt
5. Review Domain Root security descriptor: Note that adding the Server 2019 DC removed the errant Enterprise Key Admins Full Control ACE on Domain Root.
   - DomainRoot2016.png
   - DomainRoot.txt
   - DomainRoot2016LDP.png
6. Create-AdminSDHolderTest.ps1
   - Create-AdminSDHolderTest.txt
7. Capture data post test:
   - Test-AdminSDHolderPostTest.csv

The primary change in introducing a 2019 DC, but not yet moving the PDCe FSMO role to it is that the errant Enterprise Key Admins Full Control ACE granted on Domain Root is removed by ADPrep. Enterprise Key Admins is still not a protected object.

# Step 5

The PDCe FSMO role is transferred from the Server 2016 DC SD-DC2016CUPDCeTests to the Server 2019 DC SD-DC2019CUPDCeTests.

Enterprise Key Admins and its members, are now protected objects.

1. Delete Subtree OU=AdminSDHolderTests
2. Transfer the PDCe FSMO Role to SD-DC2016PDCeTests
   - TransferPDCeRole.png
3. Review Domain Root security descriptor:
   - DomainRoot.txt
   - DomainRoot2019.png
   - DomainRoot2019LDP.png
4. Data is captured from the environment as a baseline: Note that at the time of the baseline capture Enterprise Key Admins is still not protected.
   - AdminSDHolder-SD-2019.txt
   - Test-AdminSDHolderBaseline.csv
   - LDP Security Descriptor Dump.txt
5. Wait for X days to see if Enterprise Key Admins becomes protected.
   x. Create-AdminSDHolderTest.ps1
   - Create-AdminSDHolderTest.txt

Observation: At the time of the baseline capture, Enterprise Key Admins was still not protected. Instead of forcing the ProtectAdminGroups task during Create-AdminSDHolderTest.ps1, I waited for several cycles of ProtectAdminGroups to occur to monitor results and see if it would be protected. If this doesn't work, I'll reboot SD-DC2016CUPDCeTests to see if this would cause the protection to occur.
