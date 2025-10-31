# AdminSDHolder

Additional documentation for AdminSDHolder Misconceptions and Misconfigurations research paper.

You can read a summary of the document in this blog post: https://specterops.io/blog/2025/10/31/adminsdholder-misconceptions-misconfigurations-and-myths/

The research paper is available as an eBook PDF here: https://specterops.io/resources/adminsdholder/

## adminCount
[Additional documentation](./adminCount/README.md) around the adminCount property and demonstrations of why adminCount is not an accurate way to determine privileged account status.

## Child Objects

This folder contains data from [tests](./ChildObjects/README.md) performed to determine if AdminSDHolder would protect child objects of protected objects.

## Exchange

Microsoft Exchange server tends to be one of the more common causes of AdminSDHolder misconfigurations that I have noted in AD environments. This folder contains [data and tests](./Exchange/README.md) showing how various Exchange server versions impact AdminSDHolder security.

## Inheritance

This folder contains [data from a set of tests](./Inheritance/README.md) performed around when the DACL_Protected flag is removed from the AdminSDHolder object, which enables DACL inheritance on objects protected by AdminSDHolder, and the AdminSDHolder itself. The tests were performed in the AD2025.lan forest, specifically in the Inheritance.AD2025.lan child domain of my home lab.

DACL Inheritance Enabled contains screenshots and data captured from when the AdminSDHolder's DACL_Protected flag is removed, rendering the configuration in a less secure state.

DACL Protected State contains screenshots and data captured after the DACL_Protected flag had been re-enabled (which is the default state).

## OS Levels

This folder contains data captured across a wide variety of Active Directory forests, each created on a domain controller of a specific Windows Server operating system. Each child folder represents the OS of the original DC of that AD environment.

In earlier legacy OS folders for Windows Server 2000, Windows Server 2003, and Windows Server 2008 there is limited data collected due to the lack of PowerShell integration with this OSes. Each of these folders will have:

- Text dump of the DSACLS.exe output for the AdminsDHolder object in that domain
- Text dump of the LDP security descriptor output for the AdminSDHolder object in text format
- A screenshot showing the OS version (optional)
- A screenshot of the Active Directory Users and Computers security properties of the AdminSDHolder object

Windows Server 2003 and newer will also include:

- SharpHound collection
- SDDL output of the current, default, and schema for AdminSDHolder
- A screenshot of the AdminSDHolder security descriptor displayed graphically in LDP.exe

Windows Server 2012 and newer also include:

- A 'AdminSDHolder-SD-<version>.txt data dump of OS and AdminSDHolder data from a PowerShell script Get-PowerShellSD.ps1
- SysInfo.txt
- Screenshot of SysInfo
- Output from the Test-AdminSDHolder.ps1 script prior to running Create-AdminSDHolderTest.ps1 and again after

Note: I made an error in the Test-AdminSDHolder.ps1 script that caused it to not collect computer or service account service principals. I didn't notice this error until after I had collected post data. As no computer objects or service account service principals are protected by AdminSDHolder by default, this should not affect the outcome. I recaptured the post-test data with a corrected script.

## PDCeTests

[Data and tests](./PDCeTests/README.md) that demonstrate how the PDCe FSMO role holder in a domain is the only DC which matters for the purposes of determining what the default AdminSDHolder container security descriptor is and how the ProtectAdminGroups background task functions.

## SchemaAdminDomainDefaults

This folder contains [data](./SchemaAndDomainDefaults/README.md) collected from various AD Schema versions. This demonstrates the various AdminSDHolder security descriptors over schema versions. The other intention is to demonstrate the defaultSecurityDescriptor in the AD Schema across common security principals and OUs.

## Scripts

A set of cobbled together scripts for performing the tests and collecting the data in this repository.

## Misconfiguration Sources

I'd like to build a [library of technical documentation and blogs](./Misconfiguration%20Sources/README.md) that encourage users of certain products to make unnecessary configurations to the AdminSDHolder object or the security processes around it.

## Diagrams

Some drawio diagrams in PDF format which [chart out the flow](AdminSDHolder_ProtectiveOperation-Code.drawio.pdf) of operation in the ProtectAdminGroups background task.

## Matrix

The [AdminSDHolderTruthMatrix.xlsx](./AdminSDHolderTruthMatrix.xlsx) is an aggregation of data I've collected during this project to which AD objects are protected across various versions of the Windows Server OS as it relates to the PDCe for a domain.
