# Indigo

Main repository for the Indigo Community Navigation System

## Dependencies

Install [Docker](https://www.docker.com/) on a Linux distribution of your choice.

We recommend running Indigo on a stable Linux distribution such as [Debian](https://www.debian.org/) or [Red Hat Enterprise Linux](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux).

## Deployment

```sh
make
docker load -i ./dist/image.tar.gz
docker run --env-file .env -p 80:80 -p 443:443 --mount type=bind,src=./config.json,dst=/var/indigo/config.json,ro -it OptionsIRCIL/indigo:latest
```
