# Schema.INI

This is a collection of configurations related to the AdminSDHolder object and its parent objects as collected from the SCHEMA.INI of Windows Server Operating Systems. The intention is to catalogue a collection of the nTSecurityDescriptor for the AdminSDHolder container in each OS version.

## Windows Server 2000 B3

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CIOI;RPWPCRLCLOCCRCWDWOSDDTSW;;;BA)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CIOI;RPWPCRLCLOCCRCWDWOSDDTSW;;;EA)S:(AU;CIOISAFA;WDWOSDDTWPCRCCDCSW;;;WD)
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
gPLink=$REGISTRY=GPODomainLink
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure

## Windows Server 2000 RC1

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)S:(AU;CISAFA;WDWOSDDTWPCRCCDCSW;;;WD)
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure

## Windows Server 2000 RC2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)S:(AU;CISAFA;WDWOSDDTWPCRCCDCSW;;;WD)
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals

## Windows Server 2000 RTM

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)S:(AU;CISAFA;WDWOSDDTWPCRCCDCSW;;;WD)
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals

## Windows Server 2000 SP4

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)S:(AU;CISAFA;WDWOSDDTWPCRCCDCSW;;;WD)
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals

## Windows Server 2003 RTM

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD = DomainUpdates

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=0
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain

## Windows Server 2003 SP1

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD = DomainUpdates

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=0
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain

## Windows Server 2003 R2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD = DomainUpdates

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=0
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain

## Windows Server 2003 SP2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD = DomainUpdates

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=0
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain

## Windows Server 2003 R2 SP2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD = DomainUpdates

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=0
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain

## Windows Server 2008 SP2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain

## Windows Server 2008 R2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts

## Windows Server 2012

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices

## Windows Server 2012 R2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices

## Windows Server 2016

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:683a24e2e8164bd3af86ac3c2cf3f981:CN=Keys,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000
msDS-ExpirePasswordsOnSmartCardOnlyAccounts=True

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices
CHILD= Keys

## Windows Server 2019

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:683a24e2e8164bd3af86ac3c2cf3f981:CN=Keys,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000
msDS-ExpirePasswordsOnSmartCardOnlyAccounts=True

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices
CHILD= Keys

## Windows Server 2022

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:683a24e2e8164bd3af86ac3c2cf3f981:CN=Keys,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000
msDS-ExpirePasswordsOnSmartCardOnlyAccounts=True

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices
CHILD= Keys

## Windows Server 2025

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:683a24e2e8164bd3af86ac3c2cf3f981:CN=Keys,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000
msDS-ExpirePasswordsOnSmartCardOnlyAccounts=True

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices
CHILD= Keys

## Windows Small Business Server 2000

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)S:(AU;CISAFA;WDWOSDDTWPCRCCDCSW;;;WD)
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals

## Windows Small Business Server 2003

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD = DomainUpdates

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=1
;Its a NC ROOT
instanceType=5
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=0
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain

## Windows Small Business Server 2011

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts

## Windows Server Semi Annual Channel 1804

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:683a24e2e8164bd3af86ac3c2cf3f981:CN=Keys,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000
msDS-ExpirePasswordsOnSmartCardOnlyAccounts=True

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices
CHILD= Keys

## Windows Server Semi Annual Channel 20H2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:683a24e2e8164bd3af86ac3c2cf3f981:CN=Keys,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000
msDS-ExpirePasswordsOnSmartCardOnlyAccounts=True

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices
CHILD= Keys

## Windows Server Semi Annual Channel 23H2

[AdminSDHolder]
nTSecurityDescriptor=O:DAG:DAD:P(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCDCRCWDWOSWSD;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;EA)(A;;RPWPCRLCLOCCDCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;WD)(OA;;CR;ab721a53-1e2f-11d0-9819-00aa0040529b;;PS)(OA;;RPWP;bf967a7f-0de6-11d0-a285-00aa003049e2;;CA)(OA;;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;46a9b11d-60ae-405a-b7e8-ff8a58d456d2;;S-1-5-32-560)(OA;;WPRP;6db69a1c-9422-11d1-aebd-0000f80367c1;;S-1-5-32-561)(OA;;WPRP;5805bc62-bdc9-4428-a5e2-856a0f4c185e;;S-1-5-32-561)(OA;CI;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)S:(AU;SA;WDWOWP;;;WD)
objectClass =Container
ObjectCategory =Container
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

[System]
nTSecurityDescriptor=O:DAG:DAD:(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)
objectClass =Container
ObjectCategory =Container
description=Builtin system settings
ShowInAdvancedViewOnly=True
isCriticalSystemObject=True
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000

CHILD= WinsockServices
CHILD= RpcServices
CHILD= FileLinks
CHILD= Default Domain Policy
CHILD= Meetings
CHILD= Policies
CHILD= RAS and IAS Servers Access Check
CHILD= File Replication Service
CHILD= Dfs-Configuration
CHILD= IP Security
CHILD= AdminSDHolder
CHILD= ComPartitions
CHILD= ComPartitionSets
CHILD= WMIPolicy
CHILD= DomainUpdates
CHILD= Password Settings Container
CHILD= PSPs

[DEFAULTROOTDOMAIN]
objectClass = DomainDNS
objectCategory = Domain-DNS
NTSecurityDescriptor=O:DAG:DAD:(A;;RP;;;WD)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6aa-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ab-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;1131f6ac-9c07-11d1-f79f-00c04fc2dcd2;;BA)(A;;RPLCLORC;;;AU)(A;;RPWPCRLCLOCCRCWDWOSW;;;DA)(A;CI;RPWPCRLCLOCCRCWDWOSDSW;;;BA)(A;;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;SY)(A;CI;RPWPCRLCLOCCDCRCWDWOSDDTSW;;;EA)(A;CI;LC;;;RU)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(OA;;RP;c7407360-20bf-11d0-a768-00aa006e0529;;RU)(OA;CIIO;RPLCLORC;;bf967a9c-0de6-11d0-a285-00aa003049e2;RU)(A;;RPRC;;;RU)(OA;CIIO;RPLCLORC;;bf967aba-0de6-11d0-a285-00aa003049e2;RU)(A;;LCRPLORC;;;ED)(OA;CIIO;RP;037088f8-0ae1-11d2-b422-00a0c968f939;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;59ba2f42-79a2-11d0-9020-00c04fc2d3cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;bc0ac240-79a9-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;4c164200-20c0-11d0-a768-00aa006e0529;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RP;5f202010-79a5-11d0-9020-00c04fc2d4cf;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;CIIO;RPLCLORC;;4828CC14-1437-45bc-9B07-AD6F015E5F28;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;RU)(OA;;RP;b8119fd0-04f6-4762-ab7a-4986c76b3f9a;;AU)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967aba-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a9c-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;RP;b7c69e6d-2cc7-11d2-854e-00a0c983f608;bf967a86-0de6-11d0-a285-00aa003049e2;ED)(OA;CIIO;WP;ea1b7b93-5e48-46d5-bc6c-4df4fda78a35;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;DD)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;ED)(OA;;CR;1131f6ad-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;;CR;89e95b76-444d-4c62-991a-0facbeda640c;;BA)(OA;;CR;e2a36dc9-ae17-47c3-b58b-be34c55ba633;;S-1-5-32-557)(OA;;CR;280f369c-67c7-438e-ae98-1d46f3c6f541;;AU)(OA;;CR;ccc2dc7d-a6ad-4a7a-8846-c04e3cc53501;;AU)(OA;;CR;05c74c5e-4deb-43b4-bd9f-86664c2a7fd5;;AU)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;ED)(OA;;CR;1131f6ae-9c07-11d1-f79f-00c04fc2dcd2;;BA)(OA;CIIO;CRRPWP;91e647de-d96f-4b70-9557-d63ff4f3ccd8;;PS)(OA;CIOI;RPWP;3f78c3e5-f79a-46bd-a0b8-9d18116ddc79;;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;PS)(OA;CIIO;SW;9b026da6-0d3c-465c-8bee-5199d7165cba;bf967a86-0de6-11d0-a285-00aa003049e2;CO)S:(AU;SA;WDWOWP;;;WD)(AU;SA;CR;;;BA)(AU;SA;CR;;;DU)(OU;CISA;WP;f30e3bbe-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)(OU;CISA;WP;f30e3bbf-9ff0-11d1-b603-0000f80367c1;bf967aa5-0de6-11d0-a285-00aa003049e2;WD)
; WARNING: For downward compatibility, Domain-DNS objects are actually
; stamped with the default SD from [Sam-Domain]. To avoid confusion,
; keep the default SD on [Sam-Domain], the default SD on [Domain-DNS],
; and the nTSecurityDescriptor on DEFAULTROOTDOMAIN in schema.ini
; the same.
auditingPolicy=\x0001
nTMixedDomain=0
;Its a NC ROOT
instanceType=5
;default nc
msDS-NcType=0
;Its the PDC, set FSMO role owner
fSMORoleOwner=$REGISTRY=Machine DN Name
wellKnownObjects=$EMBEDDED:32:a9d1ca15768811d1aded00c04fd8d5cd:cn=Users,<Root Domain
wellKnownObjects=$EMBEDDED:32:aa312825768811d1aded00c04fd8d5cd:cn=Computers,<Root Domain
wellKnownObjects=$EMBEDDED:32:a361b2ffffd211d1aa4b00c04fd7d83a:ou=Domain Controllers,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab1d30f3768811d1aded00c04fd8d5cd:cn=System,<Root Domain
wellKnownObjects=$EMBEDDED:32:ab8153b7768811d1aded00c04fd8d5cd:cn=LostAndFound,<Root Domain
wellKnownObjects=$EMBEDDED:32:2fbac1870ade11d297c400c04fd8d5cd:cn=Infrastructure,<Root Domain
wellKnownObjects=$EMBEDDED:32:18e2ea80684f11d2b9aa00c04f79f805:cn=Deleted Objects,<Root Domain
wellKnownObjects=$EMBEDDED:32:22b70c67d56e4efb91e9300fca3dc1aa:cn=ForeignSecurityPrincipals,<Root Domain
wellKnownObjects=$EMBEDDED:32:09460c08ae1e4a4ea0f64aee7daa1e5a:CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:f4be92a4c777485e878e9421d53087db:CN=Microsoft,CN=Program Data,<Root Domain
wellKnownObjects=$EMBEDDED:32:6227f0af1fc2410d8e3bb10615bb5b0f:CN=NTDS Quotas,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:1eb93889e40c45df9f0c64d23bbb6237:CN=Managed Service Accounts,<Root Domain
otherWellKnownObjects=$EMBEDDED:32:683a24e2e8164bd3af86ac3c2cf3f981:CN=Keys,<Root Domain
gPLink=$REGISTRY=GPODomainLink
mS-DS-MachineAccountQuota=10
msDS-AllUsersTrustQuota=1000
msDS-PerUserTrustQuota=1
msDS-PerUserTrustTombstonesQuota=10
isCriticalSystemObject=True
msDs-Behavior-Version=$REGISTRY=InstallDomainBehaviorVersion
;systemFlags=FLAG_CONFIG_DISALLOW_RENAME |
; FLAG_CONFIG_DISALLOW_MOVE |
; FLAG_DISALLOW_DELETE
systemFlags=0x8C000000
msDS-ExpirePasswordsOnSmartCardOnlyAccounts=True

; every domain needs these in the root
CHILD= LostAndFound
CHILD= Deleted Objects
CHILD= Users
CHILD= Computers
CHILD= System
CHILD= Domain Controllers
CHILD= Infrastructure
CHILD= ForeignSecurityPrincipals
CHILD= Program Data
CHILD= NTDS Quotas domain
CHILD= Managed Service Accounts
CHILD= TPM Devices
CHILD= Keys
