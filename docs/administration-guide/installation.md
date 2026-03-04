# Installation

The preferred method to install Indigo on your server is via
[Docker Compose](https://docs.docker.com/compose/). Stable builds of the product are 
[delivered via ghrc.io](https://github.com/OptionsIRCIL/indigo/pkgs/container/indigo).

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
        source: ./indigo_data
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
        source: ./indigo_config
        target: /var/indigo
        readonly: true
```

Changes may be made as needed, such as if port remapping is required. 
When finished, proceed to [Configuration](configuration.md).
