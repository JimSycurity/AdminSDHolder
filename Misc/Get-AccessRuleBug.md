# .NET System.Security.AccessControl.DirectoryObjectSecurity GetAccessRules() Bug

In the GetAccessRules() method of the [System.Security.AccessControl.DirectoryObjectSecurity](https://learn.microsoft.com/en-us/dotnet/api/system.security.accesscontrol.directoryobjectsecurity?view=net-9.0)
class there appears to be a bug in the display of InheritedObjectType property. It always displays an empty guid (00000000-0000-0000-0000-000000000000) instead of the actual value. I first noticed this when reviewing output of type [System.Security.AccessControl.ActiveDirectorySecurity](https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.activedirectorysecurity?view=windowsdesktop-9.0) across the various AdminSDHolder data collections.

This behavior occurs accross Active Directory domain controllers from Windows Server 2008 R2 through Windows Server 2025. It's repeatable with Windows PowerShell (5.1) and the current latest version (7.5.2). I have not yet tested it in C#.

The GetAccessRules() method on [System.Security.AccessControl.ActiveDirectorySecurity] is inherited from the parent class [System.Security.AccessControl.DirectoryObjectSecurity]. Regardless of whether the 'Access' CodeProperty or the GetAccessRules() method are called, the results are the same. It should go without saying, as they both result in an instance of the same object class, but the results are the same when accessing the DACL of an AD object via pure .NET methods or via Get-ACL.

I've uploaded a [transcript](GetAccessRuleTranscript.txt) of PowerShell output confirming the bug. The transcript also demonstrates that James Forshaw's NTObjectManager module properly parses and displays the InheritedObjectType via the Format-Win32SecurityDescriptor function.

## Data

Below, the same security descriptor is presented in SDDL format (newlines added for ease of reading) and via the GetAccessRules() method of System.Security.AccessControl.ActiveDirectorySecurity, which is inherited from System.Security.AccessControl.DirectoryObjectSecurity. Above each ACE in the GetAccessRules() output I copied the corresponding SDDL ACE.

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
