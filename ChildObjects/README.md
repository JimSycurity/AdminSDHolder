# Child Objects of Protected Objects Tests

My friend and former coworker Jake Hildreth posed a question to me:

> Does AdminSDHolder protect child objects of protected objects? IE, if a User account is protected, would a child object under it gain the same SD?

Active Directory Schema defines which instances of object classes can be parents of each object class via the possSuperiors and systemPossSuperiors attributes on each object class. It's common to think of the domain root (domainDNS objectClass), containers, and organizational units (OUs) as THE containers in AD. But as I'm apt to say, anything can be a container if your AD Schema is brave enough. The AD Schema is object-oriented in that child classes inherit attributes from their parents. So, if an object class is a child class of 'container' for example, any object class that defines 'container' as a possSuperior or systemPossSuperior can also be placed in that child class of container.

There are lots of ways to demonstrate this, but I really like bringing up [CVE-2021-34470](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34470) which is an Elevation of Privilege security vulnerability discovered by [James Forshaw](https://project-zero.issues.chromium.org/issues/42451302). The gist of it is:

> Exchange modifies the AD schema to add a lot of additional classes. Doing a scan I noticed that the msExchStorageGroup is derived from the container class, but is also allowed to be created inside a computer object. This can then be used to create any object which a container can do including arbitrary users and groups and also things like domainTrust.

This means that in an AD Forest with older versions of Exchange installed, the AD Schema itself is a vulnerability. Microsoft [released patches](https://techcommunity.microsoft.com/blog/exchange/released-july-2021-exchange-server-security-updates/2523421) for this vulnerability in July of 2021. But what if you had already moved to Exchange Online and decomissioned Exchange on-prem or had otherwise discontinued using Exchange? How can you patch something that no longer exists? That's the rub, once you modify the AD Schema, it's always modified. Uninstalling Exchange doesn't revert any of the numerous extensions of the AD Schema. For those instances, Microsoft released a [script in August 2021](https://techcommunity.microsoft.com/blog/exchange/how-to-update-ad-schema-to-address-cve-2021-34470-if-exchange-is-very-old-or-no-/2617083) that checks if the AD Schema is vulnerable to CVE-2021-34470 and if so, corrects the issue. Does your vulnerability scanner scan the AD Schema?

Anyhow, to answer Jake's question I created a computer object in one of my lab forests which has Exchange installed, which is still vulnerable to CVE-2021-34470:

1. Create CN=AdminPC,OU=ProtChildObj,OU=AdminSDHolder-ExchangeTests,OU=Misconfigs,DC=houdini,DC=lab,DC=lan
2. Add AdminPC to Print Operators and ensure ProtectAdminGroups task runs
3. Verify that AdminPC is protected
4. Use modified version of James Forshaw's poc_exchange_schema.ps1 script to create an msExchStorageGroup object as a child of AdminPC: CN=ASDHTest,CN=AdminPC,OU=ProtChildObj,OU=AdminSDHolder-ExchangeTests,OU=Misconfigs,DC=houdini,DC=lab,DC=lan
5. The modified script also created a user object as a child of the ASDHTest msExchStorageGroup object: CN=ADSHTestUser,CN=ASDHTest,CN=AdminPC,OU=ProtChildObj,OU=AdminSDHolder-ExchangeTests,OU=Misconfigs,DC=houdini,DC=lab,DC=lan
6. Ensure ProtectAdminGroups has run.
7. Review security descriptors of the child objects of AdminPC:
   a. ASDHTest object security descriptor is completely different from AdminPC's. It has only 2 ACEs and they're both Allow grants to Everyone. AdminSDHolder did not protect this child object.
   b. ADSHTestUser object security descriptor is the default security descriptor for a newly created user object. It is not the same as AdminSDHolder's security descriptor. AdminSDHolder did not protect this object.
8. Noted that poc_exchange_schema specifies an extremely permissive security descriptor on the msExchStorageGroup object. As I test I created a second msExchStorageGroup object as a child of AdminPC, this time using an object creation method that did not specify a security descriptor for the object at creation: CN=ASDHTestNoSD,CN=AdminPC,OU=ProtChildObj,OU=AdminSDHolder-ExchangeTests,OU=Misconfigs,DC=houdini,DC=lab,DC=lan
9. In reviewing the security descriptor of ASDHTestNoSD, the DACL matches that of AdminPC and thus AdminSDHolder, however it does not have the DACL_PROTECTED flag set, so it is not a match and is not protected by AdminSDHolder. The DACL was simply inherited from AdminPC.

Conclusion: Child objects of AdminSDHolder protected objects are not protected by AdminSDHolder.
