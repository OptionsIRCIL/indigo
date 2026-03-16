# Security

## Authentication Process

At a high level, Indigo's backend authentication process calls identity provider
modules to obtain an *Employee* object. Identity providers, in this case, are
plugins that, given an HTTP request, either return biographical data about the
user in a predefined structure or return an error. The former should only be
returned on successful identity verification (I.E. a correct password).

After an *Employee* object is returned, the backend uses this information to
build and sign a JWT. This token is then returned as a browser cookie and
may be used to authenticate a user for the next 8 hours. The information stored
in the token is treated as non-falsifiable as it carries a signature from
the configured HMAC secret.

### JWT Contents

The following claims are written to each issued JWT:

 - `given_name`: The user's first name
 - `family_name`: The user's last name
 - `groups`: Any security roles relevant to system authorization
 - `sub`: The user's username
 - `aud`: A string array containing `indigo-frontend` and `indigo-backend`
 - `iss`: The constant `indigo-backend`
 - `iat`: The time the token was issued at
 - `nbf`: "Not before", populated with the same value as `iat`
 - `exp`: Expiration time, defaults to `iss` + 10 hours

More details about each claim may be found in 
[IANA's JWT specification](https://www.iana.org/assignments/jwt/jwt.xhtml#claims).

## Authentication Providers

### Standalone

The standalone provider

### Lightweight Directory Access Protocol (LDAP)

LDAP may be used to connect to an Active Directory instance for single
sign-on. This is done via means of an authenticated bind. When logging in, the
backend attempts to connect to the LDAP server with the credentials provided
by the user. If the connection is successful, the user credentials are assumed
to be valid. The server then connects to the LDAP server with its own
credentials (ideally a service account). Employee data is pulled and returned.


*[LDAP]: Lightweight Directory Access Protocol
*[JWT]: JSON Web Token
*[HMAC]: Keyed-Hash Message Authentication Code
