# Configuration

Indigo is configured via a JSON file. The following snippet is an example
configuration. Each field is expanded upon within this page, and a
JSON schema is available [in the backend repo](https://github.com/OptionsIRCIL/indigo-backend/blob/local_auth/docs/config-schema.json).

!!! note
    This config will not function right out of the box. Please read the documentation here,
    misconfiguration or reused defaults may result in unexpected or undesired behavior.

<!-- Add hyperlinks to config.json keys -->
<script type="module" id="linker">
    function addJsonKeyLinks(){
        document.querySelectorAll("script#linker + div.language-json .md-code__content .nt").forEach(
            (keyElement, i) => {
                const keyText = keyElement.innerText
                const key = keyText.substring(1, keyText.length - 1)
                const heading = document.querySelector(".json-key-" + i);

                if (heading instanceof HTMLHeadingElement) {
                    // Cope and seethe
                    keyElement.innerHTML = `"<a href="#${heading.id}" class="nt" style="text-decoration: underline;">${key}</a>"`;
                }
            })
    }
    addEventListener("DOMContentLoaded", addJsonKeyLinks);
</script>

```json title="config.json"
--8<-- "docs/example/config.json"
```

Config files should be [mounted to the container filesystem](https://docs.docker.com/reference/compose-file/services/#volumes) at 
`/var/indigo/config.json`. 

!!! example "Updated Example File Structure"
      For those using the template `compose.yml` provided
      in [Installation](installation.md), you may place `config.json` in `./config/`.
      <div class="file-tree" markdown>

      - 📁 indigo
         - 📄 compose.yml
         - 📁 config
            - ⚙️ config.json
         - 📁 data
            - 📁 indigo
            - 📁 mariadb

      </div>

If the config file must reside in a different location, 
the environment variable `INDIGO_CONFIG_LOCATION` can be used to specify 
an alternate location.

## `database` { .json-key-0 }

Indigo requires a connection to a relational database. Use this property to configure
connection details.

### `database.dsn` { #database-dsn .json-key-1 }

Your DSN string for database connection. Only MariaDB is supported at the moment.
See [https://github.com/go-sql-driver/mysql#dsn-data-source-name](https://github.com/go-sql-driver/mysql#dsn-data-source-name)
for string syntax.

!!! example
    Those using the default `compose.yml` should specify this variable like so:
    ```json
    "dsn": "user:pass@tcp(db:3306)/indigo"
    ```
    Replace `user` and `pass` with the values configured in `compose.yml`.

## `authentication` { .json-key-2 }

Options for authentication methods. `hmacKey` and at
least one configuration mode must be specified.

### `authentication.hmacKey` { #authentication-hmacKey .json-key-3 }

The HMAC512 key used for signing and verifying issued JWT cookies. The
key must be at least 64 characters in length.

!!! danger
    **DO NOT utilize the default secret**. This secret is the root of trust for all
    cookies issued by the system. If a secret is compromised, bad actors will have
    the ability to create and sign their own cookies.

### `authentication.ldap` { #authentication-ldap .json-key-4 }

Configuration set for LDAP authentication. Useful in workplaces utilizing
Active Directory; enables single-sign on for users.

#### `authentication.ldap.url` { #authentication-ldap-url .json-key-5 }

The URL of your LDAP server or Domain Controller.

#### `authentication.ldap.domain` { #authentication-ldap-domain .json-key-6 }

The domain prefix of your Active Directory instance. See
[https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/assigning-domain-names](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/assigning-domain-names) for more information.

#### `authentication.ldap.searchBase` { #authentication-ldap-searchBase .json-key-7 }

The search base to use when selecting users.

#### `authentication.ldap.username` { #authentication-ldap-username .json-key-8 }

The username of an LDAP account with permissions to query user information.

#### `authentication.ldap.password` { #authentication-ldap-password .json-key-9 }

The service account's password.

### `authentication.local` { #authentication-local .json-key-10 }

Enables local creation and storage of users without single sign on. Not
recommended except in cases where Active Directory is not available. There's no 
properties present to configure this authenticator, so to enable this option, 
simply specify an empty object as the key's value (`{}`).


*[LDAP]: Lightweight Directory Access Protocol
*[JWT]: JSON Web Token
*[HMAC512]: Keyed-Hash Message Authentication Code
