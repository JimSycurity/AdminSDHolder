# Misconfiguration Sources

This will be an attempt to call out online documentation that encourages behavior that creates a misconfiguration or decreases the security of the AdminSDHolder object or the process around it. Each item will include a link to the source

## CyberArk

## Microsoft

## Okta

- Grant Okta Active Directory (AD) agent password management permissions: https://help.okta.com/oie/en-us/content/topics/privileged-access/pam-ad-setup-ad-agent.htm
  - Recommendations:
    - Add dangerous ACEs to AdminSDHolder - Misconfiguration

## SecureAuth

- Not able to update AD attributes for some users using different Service Account: https://support.secureauth.com/hc/en-us/articles/360019648172-Not-able-to-update-AD-attributes-for-some-users-using-different-Service-Account
  - Recommendations:
    - Enable inheritance on AdminSDHolder - Misconfiguration
    - Add dangerous ACEs to AdminSDHolder - Misconfiguration
- SecureAuth IdP Service Account Setup and Configuration Guide for LDAP Directories (Active Directory and others): https://docs.secureauth.com/2307/en/secureauth-idp-service-account-setup-and-configuration-guide-for-ldap-directories--active-directory-and-others-.html
  - Recommendations:
    - Add SecureAuth IdP Service Account to Domain Admins - Misconfiguration with a warning
    - Utilize separate end-user accounts for SecureAuth IdP service instead of the privileged accounts - Solid advice!!
    - Add dangerous ACEs to AdminSDHolder - Misconfiguration with a warning
