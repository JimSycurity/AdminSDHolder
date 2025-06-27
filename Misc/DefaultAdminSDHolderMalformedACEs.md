# AdminSDHolder Malformed ACEs Issue

While exploring AdminSDHolder security descriptors, I noticed issues with the InheritedObjectType property on the default AdminSDHolder security descriptor. Originally I thought this was an issue with the way the instances of the ActiveDirectoryAccessRule class displayed InheritedObjectType data due to discrepencies between the output there and from viewing the DACL as an SDDL string. For example:

**(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 037088f8-0ae1-11d2-b422-00a0c968f939<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

The example ACE in SDDL is an ObjectAllow grant for the Pre-Windows 2000 Compatible Access (Pre-Win2k) group to ReadProperty on the property set Remote Access Information (ObjectType 037088f8-0ae1-11d2-b422-00a0c968f939) on inetOrgPerson objects (InheritedObjectType 4828cc14-1437-45bc-9b07-ad6f015e5f28). The ActiveDirectoryAccessRule in the example shows the same information, except for the InheritedObjectType, which is an empty guid. When I orignally looked at this, I thought that the empty guid of all zeros was an error. However, with the way the security descriptors are supplied to Windows by the Schema in SDDL format, these Pre-Windows 2000 Compatible Access ACEs with an InheritedObjectType are not properly formed. When they are set by the SYSTEM directly there are no constraints applied, so even if incorrect, they are still applied. If and when any Windows APIs modify the security descriptor, the malformed ACEs are removed.

The intent of this ACE appears to be allow members of Pre-Win2k to read all of the properties in the Remote Access Information property set on descendant inetOrgPerson objects. However, while AdminSDHolder is a container that could theoretically have descendant child objects, it doesn't. And the objects AdminSDHolder protects are those object instances, not descendant objects of AdminSDHolder. They're descendants of whichever OU or container they are placed in. And while objects that AdminSDHolder protects could have child objects, that's not the norm and the majority of the ACEs in the default AdminSDHolder DACL do not have inheritance or propagation flags which would allow them to be inherited by child objects.

In any default AdminSDHolder security descriptor there are multiple ObjectAllow ACE grants to the trustee Pre-Windows 2000 Compatible Access. Every one of these ACEs includes an InheritedObjectType guid. This is true whether you view the security descriptor in the LDP.exe GUI, as a [text dump in LDP.exe](./2019/DefaultAdminSDHolderSD2019LDPTextDump.txt), or in SDDL format:
![Local Image](./2019/DefaultAdminSDHolderSD2019LDP.png)

![Local Image](./2019/DefaultAdminSDHolderSD2019SDDL.png)

All of the Pre-Win2k ACEs with the InheritedObjectType of User have existed since Windows Server 2000 and were configured by [Schema Update 13](../SchemaAndDomainDefaults/AdminSDHolderDefaults/Schema13SD.png). The additional Pre-Win2k ACEs with the InheritedObjectType of inetOrgPerson have been around since [Schema Update 30](../SchemaAndDomainDefaults/AdminSDHolderDefaults/Schema30SD.png), which coincides with the release to manufacturer of Windows Server 2003.

I did some testing and attempted to create a new instance of an ActiveDirectoryAccessRule which has an InheritedObjectType and no InheritanceFlags using the following:

```PowerShell
$rule = [System.DirectoryServices.ActiveDirectoryAccessRule]::new(
    [System.Security.Principal.SecurityIdentifier]::new("S-1-5-32-544"),  # Identity (Administrators SID as example)
    [System.DirectoryServices.ActiveDirectoryRights]::ReadProperty,       # Rights
    [System.Security.AccessControl.AccessControlType]::Allow,             # Access type
    [System.Guid]::new("f3a64788-5306-11d1-a9c5-0000f80367c1"),          # ObjectType (servicePrincipalName attribute GUID)
    [System.DirectoryServices.ActiveDirectorySecurityInheritance]::None,  # Inheritance type
    [System.Guid]::new("bf967a86-0de6-11d0-a285-00aa003049e2")           # InheritedObjectType (Computer class GUID)
)
```

I can create the ACE with this code with no errors, but when I display the rule we can see the InheritedObjectType is empty (all zeros):
![Local Image](ADAccessRule-WithIOT.png)

If I take this a step further and create a new instance of an ActiveDirectory security descriptor and add this ACE to it, the results indicate that the InheritedObjectType was dropped completely by the Windows APIs when creating the ACE:

```PowerShell
# Using $rule from above
$sd = [System.DirectoryServices.ActiveDirectorySecurity]::new()
$sd.AddAccessRule($rule)
$sd
$sd.Access
$sd.Sddl
```

This results in an empty InheritedObjectType in both the GetAccessRules() method and when viewd by SDDL:
![Local Image](SDWithIOTACE.png)

Then I thought I'd take a different approach and try to create a new instance of an AD security descriptor with multiple ACEs, each having InheritedObjectTypes. What I did is modify the SDDL for the [Schema Update 44](../SchemaAndDomainDefaults/AdminSDHolderDefaults/Schema44SD.png) AdminSDHolder security descriptor to remove all ACEs that are not for Pre-Win2k (RU):

```PowerShell
$sddl = 'O:DAG:DAD:PAI(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)(OA;;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)'
$sddlsd = [System.DirectoryServices.ActiveDirectorySecurity]::new()
$sddlsd.SetSecurityDescriptorSddlForm($sddl, 15) # 15 is the Flag value for All parts of a security descriptor
$sddlsd.Sddl
$sddlsd.Access
```

The results show that GetAccessRules(), for which Access is a codeproperty, does not display any InheritedObjectTypes. However, the SDDL display of the security descriptor maintains the ACEs with their InheritedObjectType guid:
![Local Image](SDfromSDDLWithIOT.png)

Would the DACL be modified if we make any modifications to $sddlsd?

```PowerShell
# Create a basic ActiveDirectoryAccessRule
$basicrule = [System.DirectoryServices.ActiveDirectoryAccessRule]::new(
    [System.Security.Principal.SecurityIdentifier]::new("S-1-5-32-544"),  # Identity (Administrators SID as example)
    [System.DirectoryServices.ActiveDirectoryRights]::GenericAll,       # Rights
    [System.Security.AccessControl.AccessControlType]::Allow             # Access type
)
$sddlsd.AddAccessRule($basicrule)
$sddlsd.Sddl
$sddlsd.Access
```

Interestingly enough, adding another ACE does not reset the security descriptor like it does when modifying the actual AdminSDHolder security descriptor in an AD domain:
![Local Image](SdfromSDDLACEAdded.png)

## Incorrect First Observations

In the GetAccessRules() method of the [System.Security.AccessControl.DirectoryObjectSecurity](https://learn.microsoft.com/en-us/dotnet/api/system.security.accesscontrol.directoryobjectsecurity?view=net-9.0)
class, which results in an [AuthorizationRuleCollection](https://learn.microsoft.com/en-us/dotnet/api/system.security.accesscontrol.authorizationrulecollection?view=net-9.0) of [ActiveDirectoryAccessRule](https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.activedirectoryaccessrule?view=windowsdesktop-9.0) objects, there appears to be a bug in the display of InheritedObjectType property. It always displays an empty guid (00000000-0000-0000-0000-000000000000) instead of the actual value. I first noticed this when reviewing output of type [System.Security.AccessControl.ActiveDirectorySecurity](https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.activedirectorysecurity?view=windowsdesktop-9.0) across the various AdminSDHolder data collections.

This behavior occurs accross Active Directory domain controllers from Windows Server 2008 R2 through Windows Server 2025. It's repeatable with Windows PowerShell (5.1) and the current latest version (7.5.2). I have not yet tested it in C#.

The GetAccessRules() method on [System.Security.AccessControl.ActiveDirectorySecurity] is inherited from the parent class [System.Security.AccessControl.DirectoryObjectSecurity]. Regardless of whether the 'Access' CodeProperty or the GetAccessRules() method are called, the results in each ActiveDirectoryAccessRule are the same. It should go without saying, as they both result in an instance of the same object class, but the results are the same when accessing the DACL of an AD object via pure .NET methods or via Get-ACL.

I've uploaded a [transcript](GetAccessRuleTranscript.txt) of PowerShell output confirming the bug. The transcript also demonstrates that James Forshaw's NTObjectManager module properly parses and displays the InheritedObjectType via the Format-Win32SecurityDescriptor function.

## Default Security Descriptor Data

Below, the same security descriptor is presented in SDDL format (newlines added for ease of reading) and via the GetAccessRules() method of System.Security.AccessControl.ActiveDirectorySecurity, which is inherited from System.Security.AccessControl.DirectoryObjectSecurity and results in an AuthorizationRuleCollection of ActiveDirectoryAccessRule objects. Above each ACE in the GetAccessRules() output I copied the corresponding SDDL ACE.

Note in the SDDL format that all ACEs for the trustee BUILTIN\Pre-Windows 2000 Compatible Access (RU) include an InheritedObjectType.
However, none of the BUILTIN\Pre-Windows 2000 Compatible Access ACEs in the GetAccessRules output contain that InheritedObjectType guid.

The errant ACEs have been highlighted in **bold** font.

O:DA<br/>
G:DA<br/>
D:PAI<br/>
(A;;LCRPLORC;;;AU)<br/>
(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)<br/>
(A;;CCDCLCSWRPWPLOCRSDRCWDWO;;;BA)<br/>
(A;;CCDCLCSWRPWPLOCRRCWDWO;;;DA)<br/>
(A;;CCDCLCSWRPWPLOCRRCWDWO;;;S-1-5-21-1753113456-3794003277-551465778-519)<br/>
(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)<br/>
(OA;CI;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)<br/>
(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)<br/>
(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)<br/>
(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)<br/>
(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)<br/>
(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)<br/>
(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)<br/>
(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)<br/>
(OA;;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)<br/>
(OA;;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)<br/>
(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)<br/>
(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)<br/>
(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)<br/>
(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)<br/>
(OA;;RPWP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)<br/>
(OA;;RPWP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)<br/>
(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)<br/>

(A;;LCRPLORC;;;AU)<br/>
ActiveDirectoryRights : GenericRead<br/>
InheritanceType : None<br/>
ObjectType : 00000000-0000-0000-0000-000000000000<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : None<br/>
AccessControlType : Allow<br/>
IdentityReference : NT AUTHORITY\Authenticated Users<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)<br/>
ActiveDirectoryRights : GenericAll<br/>
InheritanceType : None<br/>
ObjectType : 00000000-0000-0000-0000-000000000000<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : None<br/>
AccessControlType : Allow<br/>
IdentityReference : NT AUTHORITY\SYSTEM<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(A;;CCDCLCSWRPWPLOCRSDRCWDWO;;;BA)<br/>
ActiveDirectoryRights : CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, Delete, GenericRead, WriteDacl,<br/>
WriteOwner<br/>
InheritanceType : None<br/>
ObjectType : 00000000-0000-0000-0000-000000000000<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : None<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Administrators<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(A;;CCDCLCSWRPWPLOCRRCWDWO;;;DA)<br/>
ActiveDirectoryRights : CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl,<br/>
WriteOwner<br/>
InheritanceType : None<br/>
ObjectType : 00000000-0000-0000-0000-000000000000<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : None<br/>
AccessControlType : Allow<br/>
IdentityReference : AD2025\Domain Admins<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(A;;CCDCLCSWRPWPLOCRRCWDWO;;;S-1-5-21-1753113456-3794003277-551465778-519)<br/>
ActiveDirectoryRights : CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl,<br/>
WriteOwner<br/>
InheritanceType : None<br/>
ObjectType : 00000000-0000-0000-0000-000000000000<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : None<br/>
AccessControlType : Allow<br/>
IdentityReference : AD2025\Enterprise Admins<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)<br/>
ActiveDirectoryRights : ExtendedRight<br/>
InheritanceType : None<br/>
ObjectType : ab721a53-1e2f-11d0-9819-00aa0040529b<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : Everyone<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(OA;CI;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)<br/>
ActiveDirectoryRights : ReadProperty, WriteProperty, ExtendedRight<br/>
InheritanceType : All<br/>
ObjectType : 91e647de-d96f-4b70-9557-d63ff4f3ccd8<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : NT AUTHORITY\SELF<br/>
IsInherited : False<br/>
InheritanceFlags : ContainerInherit<br/>
PropagationFlags : None<br/>

(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)<br/>
ActiveDirectoryRights : ExtendedRight<br/>
InheritanceType : None<br/>
ObjectType : ab721a53-1e2f-11d0-9819-00aa0040529b<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : NT AUTHORITY\SELF<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 037088f8-0ae1-11d2-b422-00a0c968f939<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 037088f8-0ae1-11d2-b422-00a0c968f939<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 4c164200-20c0-11d0-a768-00aa006e0529<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 59ba2f42-79a2-11d0-9020-00c04fc2d3cf<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : bc0ac240-79a9-11d0-9020-00c04fc2d4cf<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : bc0ac240-79a9-11d0-9020-00c04fc2d4cf<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**<br/>
ActiveDirectoryRights : GenericRead<br/>
InheritanceType : None<br/>
ObjectType : 00000000-0000-0000-0000-000000000000<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : None<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**<br/>
ActiveDirectoryRights : GenericRead<br/>
InheritanceType : None<br/>
ObjectType : 00000000-0000-0000-0000-000000000000<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : None<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 59ba2f42-79a2-11d0-9020-00c04fc2d3cf<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 5f202010-79a5-11d0-9020-00c04fc2d4cf<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

**(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 4c164200-20c0-11d0-a768-00aa006e0529<br/>
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)<br/>
ActiveDirectoryRights : ReadProperty<br/>
InheritanceType : None<br/>
ObjectType : 46a9b11d-60ae-405a-b7e8-ff8a58d456d2<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Windows Authorization Access Group<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(OA;;RPWP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)<br/>
ActiveDirectoryRights : ReadProperty, WriteProperty<br/>
InheritanceType : None<br/>
ObjectType : 6db69a1c-9422-11d1-aebd-0000f80367c1<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Terminal Server License Servers<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(OA;;RPWP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)<br/>
ActiveDirectoryRights : ReadProperty, WriteProperty<br/>
InheritanceType : None<br/>
ObjectType : 5805bc62-bdc9-4428-a5e2-856a0f4c185e<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : BUILTIN\Terminal Server License Servers<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>

(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)<br/>
ActiveDirectoryRights : ReadProperty, WriteProperty<br/>
InheritanceType : None<br/>
ObjectType : bf967a7f-0de6-11d0-a285-00aa003049e2<br/>
InheritedObjectType : 00000000-0000-0000-0000-000000000000<br/>
ObjectFlags : ObjectAceTypePresent<br/>
AccessControlType : Allow<br/>
IdentityReference : AD2025\Cert Publishers<br/>
IsInherited : False<br/>
InheritanceFlags : None<br/>
PropagationFlags : None<br/>
