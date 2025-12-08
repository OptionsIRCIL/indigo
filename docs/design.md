# Design

## Standards

To ensure Indigo can be useful to the broadest possible audience, this project
is committed to adhering to any applicable industry standards.

### Inform USA Spec

lorem ipsum

### WCAG 2.0

lorem ipsum

### HIPAA

lorem ipsum

## Architecture

Indigo is designed in line with the REST (Representational State Transfer)
software design pattern. Using this pattern allows for a separation of concerns
that enables modularity, simplifying work if one component grows out of date.

The following details a high-level overview of the default components:

```mermaid
flowchart TB
    frontend@{label: "Frontend", shape: rect}
    backend@{label: "Backend", shape: rect}
    db@{label: "Database", shape: database}

    frontend -- [1] Makes REST API Requests --> backend
    backend -- [4] Responds to REST API Requests --> frontend
    backend -- [2] Queries or Inserts Relevant Resource(s) --> db
    db -- [3] Returns Resource(s) (If Applicable) --> backend
```

### Database

The core of this application, as with many others, is the database. It's not
special in any particular way; it's just a container for structured data. By
using a generic component for this important task, we're able to integrate with
existing tools people already know.

### Backend

Common in modern web applications is a backend application. Using an MVC
(Model-View-Controller) pattern, the backend provides an interface for a client
to interact with the database in an intuitive manner.

### Frontend



### Detailed Example

In an ideal deployment, Indigo is deployed as detailed in the diagram below.
Notably, all connections that run outside the Indigo container are encrypted.
When running in a production environment, encrypted connections are
**required** by the backend.

```mermaid
flowchart RL
    subgraph CNS Internal Network
        subgraph VLAN 1 - Employees
            subgraph Employee Desktop
                frontend("Frontend Application<br>[Angular]")
            end
        end
        subgraph VLAN 2 - Servers
            subgraph Domain Controller
                ldap[("Active Directory<br>[LDAP]")]
            end
            subgraph Indigo Host
                subgraph Docker Compose
                    subgraph MariaDB
                        mariadb[("MariaDB")]
                    end
                    subgraph Indigo
                        backend@{ shape: rect, label: "Backend"}
                        index@{ shape: docs, label: "Frontend HTML/CSS/JS" }
                        nginx@{ shape: rect, label: "nginx" }
                    end
                end
            end
        end
    end

    nginx -->|Serves<br/>_&lpar;Read from FS&rpar;_| index
    nginx -->|Proxies To<br/>_&lpar;HTTP&rpar;_| backend

    backend -->|Queries<br/>_&lpar;LDAPS&rpar;_| ldap
    backend -->|Reads/Writes From<br/>_&lpar;MySQL over TLS&rpar;_| mariadb

    frontend -->|Loads SPA From<br/>_&lpar;HTTPS&rpar;_| nginx
    frontend -->|Makes REST Calls To<br/>_&lpar;JSON/HTTPS&rpar;_| nginx
```
