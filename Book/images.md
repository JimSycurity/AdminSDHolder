| Figure | Description | Page | Source | Notes |
| --- | --- | --- | --- | --- |
| Figure 1 | Microsoft Authorization & Access Control Process | 7 | https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/media/authorization-and-access-control-process.png |  |
| Figure 2 | An MSPaint Waterfall of Permissions | 10 |  |  |
| Figure 3 | T-Boz's Standard User Account Permissions | 11 |  | redo |
| Figure 4 | T-Boz's Admin Account Permisions | 12 |  |  |
| Figure 5 | Computer Object Schema With defaultSecurityDescriptor in SDDL | 13 |  |  |
| Figure 6 | Computer Object Schema defaultSecurityDescriptor Converted to Display in LDP’s SD Edit Function | 14 |  | redo |
| Figure 7 | Screenshot of Advanced Security Settings for AdminSDHolder in Windows Server 2019 | 17 |  |  |
| Figure 8 | Screenshot of LDP.exe Security Descriptor for AdminSDHolder in Windows Server 2019 | 17 |  |  |
| Figure 9 | Screenshot of PowerShell Security Descriptor for AdminSDHolder in Windows Server 2019 | 19 |  |  |
| Figure 10 | Screenshot of PowerShell Get-Acl Security Descriptor for AdminSDHolder in Windows Server 2019 | 20 |  |  |
| Figure 11 | Screenshot of DSACLS.exe Security Descriptor for AdminSDHolder in Windows Server 2019 | 21 |  |  |
| Figure 12 | AdminSDHolder Security Descriptor for AD Schema Version 13 | 25 |  |  |
| Figure 13 | AdminSDHolder Security Descriptor for AD Schema Version 30 | 26 |  |  |
| Figure 14 | AdminSDHolder Security Descriptor AD Schema Version 44 | 27 |  |  |
| Figure 15 | “Dangerous” Permissions | 28 |  |  |
| Figure 16 | Appendix C Microsoft AD-DS - March 2025 (Incorrect) | 29 | https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/security-best-practices/appendix-c--protected-accounts-and-groups-in-active-directory |  |
| Figure 17 | MS-ADTS Protection Operation (Correct) | 30 | https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/0a8a143b-d00b-425e-b43f-91df23779828 |  |
| Figure 18 | Microsoft TechNet AdminSDHolder – Screenshot March 2025 (Incorrect) | 31 | https://social.technet.microsoft.com/wiki/contents/articles/22331.adminsdholder-protected-groups-and-security-descriptor-propagator.aspx |  |
| Figure 19 | Screenshot From tenable.ad blog ‘Securing AD: How to Prevent the SDProp and adminSDHolder Attack’ | 34 | https://www.tenable.com/blog/securing-active-directory-how-to-prevent-the-sdprop-and-adminsdholder-attack |  |
| Figure 20 | Theory of Operation - secadmin.c | 34 |  |  |
| Figure 21 | SDProp: The Root Cause | 35 |  |  |
| Figure 22 | fixupInheritance: Runs on any DC | 35 |  |  |
| Figure 23 | runProtectAdminGroupsTask: Only Functions on PDCe FSMO Role Holder | 36 |  |  |
| Figure 24 | Screenshot of Generative AI in Google Search Answering “What is AdminSDHolder” | 37 | https://google.com |  |
| Figure 25 | Screenshot of ChatGPT Answering “What is AdminSDHolder?” | 38 |  |  |
| Figure 26 | Screenshot of Claude.ai Answering “What is AdminSDHolder?” | 39 |  |  |
| Figure 27 | Changing SDProp Interval | 39 | https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/security-best-practices/appendix-c--protected-accounts-and-groups-in-active-directory#changing-sdprop-interval |  |
| Figure 28 | Running SDProp Manually | 40 | https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/security-best-practices/appendix-c--protected-accounts-and-groups-in-active-directory |  |
| Figure 29 | BES Send-As | 43 |  |  |
| Figure 30 | BES Domain Admin | 43 |  |  |
| Figure 31 | Disable AdminSDHolder | 43 |  |  |
| Figure 32 | Small Business Server | 44 |  |  |
| Figure 33 | Release Candidate Issues Resolved in the Exchange 2010 RTM Installer | 44 |  |  |
| Figure 34 | https://learn.microsoft.com/en-gb/archive/blogs/askds/five-common-questions-about-adminsdholder-and-sdprop | 47 |  |  |
| Figure 35 | https://www.tenable.com/blog/securing-active-directory-how-to-prevent-the-sdprop-and-adminsdholder-attack | 47 |  |  |
| Figure 36 | Screenshot of the Admin Count User with adminCount of 1 | 48 |  |  |
| Figure 37 | Screenshot of Admin Count’s Security Descriptor | 49 |  |  |
| Figure 38 | Forest Root Domain AdminSDHolder Security Descriptor - magic.lab.lan | 51 |  |  |
| Figure 39 | Child Domain AdminSDHolder Security Descriptor - foolus.magic.lab.lan | 52 |  |  |
| Figure 40 | EA Local-AdminSDHolder User in Child Domain, which is a Member of Enterprise Admins in the Forest | 53 |  |  |
| Figure 41 | Security Descriptor of the EA Local-AdminSDHolder User, Which Matches the AdminSDHolder Security Descriptor of the Child Domain | 54 |  |  |
| Figure 42 | EA Local-AdminSDHolder User adminCount Attribute Value | 55 |  |  |
| Figure 43 | Screenshot of a Windows PowerShell Session | 57 |  |  |
| Figure 44 | ADUC open to Universal InDomainLocalGroup | 57 |  |  |
| Figure 45 | Screenshot of UniversalUser InDomainLocalGroup Properties | 58 |  |  |
| Figure 46 | Screenshot of ADUC Advanced Security Settings for Magic and PowerShell | 59 |  |  |
| Figure 47 | Arrows.app Diagram of the UniversalUser InDomainLocalGroup Scenario | 60 |  |  |
| Figure 48 | Screenshot of the Builtin Groups from a Windows Server 2025 Domain Controller | 61 |  |  |
| Figure 49 | AdminSDHolderProtectiveOperations-Observed (full diagram on GitHub) | 62 |  |  |
| Figure 50 | Not From our Domain; Skip and Try the Next Entry - secadmin.c Screenshot | 63 |  |  |
| Figure 51 | AdminSDHolderProtectiveOperations-CodeReview (full diagram on GitHub) | 65 | also on page 126 as figure 103 |  |
| Figure 52 | AdminSDHolderProtectiveOperations Overview | 66 |  |  |
| Figure 54 | BuiltinDomainSecureAdminTable | 67 |  |  |
| Figure 55 | AccountDomainSecureAdminTable | 68 |  |  |
| Figure 56 | Membership Expansion | 69 |  |  |
| Figure 57 | Security Descriptor Evaluation | 69 |  |  |
| Figure 58 | Do NOT Send Account Domain Global Groups or Builtin Domain Local Groups to GC - samlogon.cxx Screenshot | 70 |  |  |
| Figure 59 | Cross-Domain Attack Path | 71 |  |  |
| Figure 60 | Screenshot of ministryofmagic.lab.lan Properties | 72 |  |  |
| Figure 61 | Screenshot of MINDFREAKAdmins FSP | 73 |  |  |
| Figure 62 | Screenshot of FSP Security Descriptor | 74 |  |  |
| Figure 63 | Screenshot of FSP Properties | 75 |  |  |
| Figure 64 | Screenshot of MINDFREAKAdmins Group Properties from LDP | 75 |  |  |
| Figure 65 | Screenshot of MINDFREAKAdmins Security Descriptor | 76 |  |  |
| Figure 66 | Screenshot of MINDFREAKAdmins Properties | 77 |  |  |
| Figure 67 | Screenshot of MINDFREAKAdmins Members | 78 |  |  |
| Figure 68 | Screenshot of Jim Sykora - Managed Forest Admin Security Descriptor | 78 |  |  |
| Figure 69 | Screenshot of Jim Sykora - Managed Forest Admin Properties | 79 |  |  |
| Figure 70 | Screenshot of PowerShell Session Ping Command | 81 |  |  |
| Figure 71 | Screenshot of PowerShell Terminal Ping Command and ADUC Security Descriptor | 82 |  |  |
| Figure 72 | Event ID 4780: ACL was Set on Accounts Which are Members of Administrators Groups | 84 |  |  |
| Figure 73 | Screenshot of Group Policy Management Editor Account Management Audit Policies | 85 |  |  |
| Figure 74 | EID 4780 Description | 86 |  |  |
| Figure 75 | Screenshot of samlogon.cxx Source Code File from Leaked Windows Server 2003 RC Code | 87 |  |  |
| Figure 76 | What is a protected group? | 88 |  |  |
| Figure 77 | AD DS Appendix C “Protected Groups” Table | 88 |  |  |
| Figure 78 | Protected Objects Table | 89 |  |  |
| Figure 79 | KB318180: AdminSDHolder Thread Affects Transitive Members of Distribution Groups | 90 |  |  |
| Figure 80 | Screenshot From https://musingsoftheproletariat.com/exchange-2010-phones-and-adminsdholder/ | 94 |  |  |
| Figure 81 | A Series of Unfortunate 4780 Event Log Entries | 95 |  |  |
| Figure 82 | Advanced Security Settings for AdminSDHolder | 96 |  |  |
| Figure 83 | Screenshot of Advanced Security Settings for AdminSDHolder | 97 |  |  |
| Figure 84 | Screenshot of ADUC OU Hierarchy | 98 |  |  |
| Figure 85 | Screenshot of Advanced Security Settings for Tier Zero OU | 99 |  |  |
| Figure 86 | Screenshot of Advanced Security Settings for Laura Williric - AO User | 100 |  |  |
| Figure 87 | Screenshot of Administrators Group Highlighting DOMAIN_DISALLOW_MOVE systemFlag | 100 |  |  |
| Figure 88 | Screenshot of Advanced Security Settings for Administrators Group | 101 |  |  |
| Figure 89 | BloodHound Attack Graph: Jane Doe to Administrators | 102 |  |  |
| Figure 90 | BloodHound Attack Graph: Jane Doe to Jonathan James A0 | 102 |  |  |
| Figure 91 | Jonathan James - A0 Membership Properties | 103 |  |  |
| Figure 92 | BloodHound Attack Graph: Inbound to Administrators | 104 |  |  |
| Figure 93 | BloodHound Attack Graph: Jane Doe to Jonathan James A0 | 105 |  |  |
| Figure 94 | Screenshot of Security Descriptor of AdminSDHolder | 107 |  |  |
| Figure 95 | Interesting Attributes of Personal-Information and Public-Information Property Sets | 108 |  |  |
| Figure 96 | Deny ACEs Added to AdminSDHolder by June 2019 Exchange Quarterly Release | 108 |  |  |
| Figure 97 | Apologies to Jonas for this one. | 110 |  |  |
| Figure 98 | Screenshot of DA_computer Object Properties in ad2025.lan Domain | 111 |  |  |
| Figure 99 | MSRC Case Response | 116 |  |  |
| Figure 100 | 6.1.3.3 Processing Specifics | 121 |  |  |
| Figure 101 | Screenshot from Daniel Ulrichs’ Blog | 121 |  |  |
| Figure 102 | Screenshot of Windows Source Code | 123 |  |  |
| Figure 103 | Flowchart of AdminSDHolder Process | 129 |  |  |
| Figure 104 | Screenshot of Creating New AdminSDHolderProtection Global Distribution Group | 135 |  |  |
| Figure 105 | AdminSDHolderProtection-Global Properties | 136 |  |  |
| Figure 106 | Print Operator Members | 136 |  |  |
| Figure 107 | Screenshot of Group Policy Management | 137 |  |  |
| Figure 108 | Screenshot of Allow Log On Locally Properties | 138 |  |  |
| Figure 109 | Screenshot of Load and Unload Device Drivers Properties | 139 |  |  |
| Figure 110 | Screenshot of Shut Down the System Properties | 140 |  |  |
| Figure 111 | Screenshot of Spooler Properties | 141 |  |  |
| Figure 112 | ADUC Screenshot of Kim Smith (PKI Admin) Member Of Properties | 142 |  |  |
| Figure 113 | Screenshot of Kim Smith (PKI Admin) Properties | 143 |  |  |
| Figure 114 | AdminSDHolder Protects Kim’s Account | 144 |  |  |
| Figure 115 | Screenshot of AdminSDHolderProtection-Global Group Members | 145 |  |  |
| Figure 116 | Screenshot of AdminSDHolder@ad2025.lan From BHE 7.4RC2 | 147 |  |  |
| Figure 117 | AdminSDHolder Inbound Object Control Screenshot | 148 |  |  |
| Figure 118 | Decision Flow for Determining AdminSDHolder Protection | 149 |  |  |
| Figure 119 | New BloodHound Features: AdminSDHolder Protected | 151 |  |  |
| Figure 120 | New BloodHound Features: Cypher Queries | 151 |  |  |
| Figure 121 | New BloodHound Features:  ProtectAdminGroups edge | 152 |  |  |

