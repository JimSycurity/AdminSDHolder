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
G:DA
D:PAI
(A;;LCRPLORC;;;AU)
(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)
(A;;CCDCLCSWRPWPLOCRSDRCWDWO;;;BA)
(A;;CCDCLCSWRPWPLOCRRCWDWO;;;DA)
(A;;CCDCLCSWRPWPLOCRRCWDWO;;;S-1-5-21-1753113456-3794003277-551465778-519)
(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)
(OA;CI;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)
(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)
(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)
(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)
(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)
(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)
(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)
(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)
(OA;;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)
(OA;;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)
(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)
(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)
(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)
(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)
(OA;;RPWP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)
(OA;;RPWP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)
(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)

(A;;LCRPLORC;;;AU)
ActiveDirectoryRights : GenericRead
InheritanceType : None
ObjectType : 00000000-0000-0000-0000-000000000000
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : None
AccessControlType : Allow
IdentityReference : NT AUTHORITY\Authenticated Users
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;SY)
ActiveDirectoryRights : GenericAll
InheritanceType : None
ObjectType : 00000000-0000-0000-0000-000000000000
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : None
AccessControlType : Allow
IdentityReference : NT AUTHORITY\SYSTEM
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(A;;CCDCLCSWRPWPLOCRSDRCWDWO;;;BA)
ActiveDirectoryRights : CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, Delete, GenericRead, WriteDacl,
WriteOwner
InheritanceType : None
ObjectType : 00000000-0000-0000-0000-000000000000
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : None
AccessControlType : Allow
IdentityReference : BUILTIN\Administrators
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(A;;CCDCLCSWRPWPLOCRRCWDWO;;;DA)
ActiveDirectoryRights : CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl,
WriteOwner
InheritanceType : None
ObjectType : 00000000-0000-0000-0000-000000000000
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : None
AccessControlType : Allow
IdentityReference : AD2025\Domain Admins
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(A;;CCDCLCSWRPWPLOCRRCWDWO;;;S-1-5-21-1753113456-3794003277-551465778-519)
ActiveDirectoryRights : CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl,
WriteOwner
InheritanceType : None
ObjectType : 00000000-0000-0000-0000-000000000000
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : None
AccessControlType : Allow
IdentityReference : AD2025\Enterprise Admins
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)
ActiveDirectoryRights : ExtendedRight
InheritanceType : None
ObjectType : ab721a53-1e2f-11d0-9819-00aa0040529b
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : Everyone
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(OA;CI;RPWPCR;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)
ActiveDirectoryRights : ReadProperty, WriteProperty, ExtendedRight
InheritanceType : All
ObjectType : 91e647de-d96f-4b70-9557-d63ff4f3ccd8
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : NT AUTHORITY\SELF
IsInherited : False
InheritanceFlags : ContainerInherit
PropagationFlags : None

(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)
ActiveDirectoryRights : ExtendedRight
InheritanceType : None
ObjectType : ab721a53-1e2f-11d0-9819-00aa0040529b
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : NT AUTHORITY\SELF
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : 037088f8-0ae1-11d2-b422-00a0c968f939
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : 037088f8-0ae1-11d2-b422-00a0c968f939
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : 4c164200-20c0-11d0-a768-00aa006e0529
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : 59ba2f42-79a2-11d0-9020-00c04fc2d3cf
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : bc0ac240-79a9-11d0-9020-00c04fc2d4cf
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : bc0ac240-79a9-11d0-9020-00c04fc2d4cf
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;LCRPLORC;;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**
ActiveDirectoryRights : GenericRead
InheritanceType : None
ObjectType : 00000000-0000-0000-0000-000000000000
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : None
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;LCRPLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**
ActiveDirectoryRights : GenericRead
InheritanceType : None
ObjectType : 00000000-0000-0000-0000-000000000000
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : None
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : 59ba2f42-79a2-11d0-9020-00c04fc2d3cf
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : 5f202010-79a5-11d0-9020-00c04fc2d4cf
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

**(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828cc14-1437-45bc-9b07-ad6f015e5f28;RU)**
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : 4c164200-20c0-11d0-a768-00aa006e0529
**InheritedObjectType : 00000000-0000-0000-0000-000000000000**
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Pre-Windows 2000 Compatible Access
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)
ActiveDirectoryRights : ReadProperty
InheritanceType : None
ObjectType : 46a9b11d-60ae-405a-b7e8-ff8a58d456d2
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Windows Authorization Access Group
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(OA;;RPWP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)
ActiveDirectoryRights : ReadProperty, WriteProperty
InheritanceType : None
ObjectType : 6db69a1c-9422-11d1-aebd-0000f80367c1
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Terminal Server License Servers
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(OA;;RPWP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)
ActiveDirectoryRights : ReadProperty, WriteProperty
InheritanceType : None
ObjectType : 5805bc62-bdc9-4428-a5e2-856a0f4c185e
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : BUILTIN\Terminal Server License Servers
IsInherited : False
InheritanceFlags : None
PropagationFlags : None

(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)
ActiveDirectoryRights : ReadProperty, WriteProperty
InheritanceType : None
ObjectType : bf967a7f-0de6-11d0-a285-00aa003049e2
InheritedObjectType : 00000000-0000-0000-0000-000000000000
ObjectFlags : ObjectAceTypePresent
AccessControlType : Allow
IdentityReference : AD2025\Cert Publishers
IsInherited : False
InheritanceFlags : None
PropagationFlags : None
