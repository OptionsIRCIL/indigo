# Authentication

To cut down on system complexity and reduce attack surface, Indigo only
supports authentication via a Single Sign On (SSO) provider. If your CNS
runs its computers on top of Microsoft Active Directory, Indigo will integrate
perfectly with that.

Configuration is relatively cut-and-dry. The backend utilizes LDAP
(Lightweight Directory Access Protocol) to both authenticate and authorize
users. All it needs to do this is a service account within your AD domain
with access to query users and view their account details.

The configuration should be specified with the following `.env` variables:

```env
# The URL of your LDAP server.
LDAP_URL="ldaps://ad.example.com:636"

# The search base to use when selecting users.
LDAP_SEARCH_BASE="CN=Users,DC=ad,DC=example,DC=com"

# The username of an LDAP account with permissions to query user information.
LDAP_USERNAME="CN=IndigoService,CN=Users,DC=ad,DC=example,DC=com"

# The service account's password.
LDAP_PASSWORD="correct horse battery staple"

# The domain prefix of your Active Directory instance.
# https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/assigning-domain-names
LDAP_DOMAIN="AD"
```
