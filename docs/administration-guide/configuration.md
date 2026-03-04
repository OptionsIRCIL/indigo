# Configuration

Indigo is configured via a JSON file. The following snippet is an example
configuration. Each field is expanded upon within this page, and a
JSON schema is available [in the backend repo](https://github.com/OptionsIRCIL/indigo-backend/blob/local_auth/docs/config-schema.json).

```json title="config.json"
{
  "database": {
    "dsn": "indigo:correct horse battery staple@tcp(db.example.com:3306)/indigo?charset=utf8mb4"
  },
  "authentication": {
    "hmacKey": "this-property-is-required-and-must-be-at-least-64-characters-long",
    "ldap": {
      "url": "ldaps://dc1.example.com:636",
      "searchBase": "CN=Users,DC=ad,DC=example,DC=com",
      "domain": "AD",
      "username": "CN=IndigoServiceAcct,CN=Users,DC=ad,DC=example,DC=com",
      "password": "correct horse battery staple"
    },
    "local": {}
  }
}
```
