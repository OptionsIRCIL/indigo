# Indigo

Main repository for the Indigo Community Navigation System

## Building

```sh
make clean && make
docker load -i ./dist/image.tar.gz
docker run --env-file .env -p 80:80 -p 443:443 --mount type=bind,src=./config.json,dst=/var/indigo/config.json,ro -it OptionsIRCIL/indigo:latest
```
