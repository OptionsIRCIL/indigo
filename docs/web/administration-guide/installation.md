# Installation

The preferred method to install Indigo on your server is via
[Docker Compose](https://docs.docker.com/compose/). Stable builds of the product are 
[delivered via ghcr.io](https://github.com/OptionsIRCIL/indigo/pkgs/container/indigo).

## Compose Template

The following `compose.yml` may be used as a template for new deployments:

```yaml title="compose.yml"
services:
  db:
    image: mariadb:latest
    hostname: mariadb
    restart: unless-stopped
    volumes:
      - type: bind
        source: ./data/mariadb
        target: /var/lib/mysql
    environment:
      MARIADB_ROOT_PASSWORD: "correct-horse-battery-staple"
      MARIADB_DATABASE: "indigo"

  indigo:
    image: OptionsIRCIL/indigo:latest
    restart: unless-stopped
    ports:
      - "443:443"
    depends_on:
      directory:
        condition: service_healthy
    volumes:
      - type: bind
        source: ./config
        target: /var/indigo
        readonly: true
      - type: bind
        source: ./data/indigo
        target: /placeholder
        readonly: true
```

!!! example "Example File Structure"
      If you're using the default bind mounts, your file structure 
      should look something like this:
      <div class="file-tree" markdown>

      - 📁 indigo
         - 📄 compose.yml
         - 📁 config
         - 📁 data
            - 📁 indigo
            - 📁 mariadb

      </div>

Changes may be made as needed, such as if port remapping is required. 
When finished, proceed to [Configuration](configuration.md).
