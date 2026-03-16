<table role="presentation" border="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <img width=128 height=128 src="docs/asset/logo/display.svg" alt="Options Indigo logo"/>
        </td>
        <td>
            <h1>Indigo Community Navigation System</h1>
            <p><i>Daisy Codenys, Jack Parrish, Angelina Toste (Frontend Developers)</i></p>
            <p><i>Joseph Melancon,  Cade Wasti (Backend Developers)</i></p>
            <p><i>Kyle Holter Vogel (Project Manager, Options IRCIL Employee)</i></p>
            <p><i>University of North Dakota, Fall 2025 to Spring 2026</i></p>
            <p><i>Additional Contributors included in THANKS.md</i></p>
        </td>
    </tr>
</table>
<hr/>

## Dependencies

Install [Docker](https://www.docker.com/) on a Linux distribution of your choice.

We recommend running Indigo on a stable Linux distribution such as [Debian](https://www.debian.org/) or [Red Hat Enterprise Linux](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux).

## Deployment

```sh
make
docker load -i ./dist/image.tar.gz
docker run --env-file .env -p 80:80 -p 443:443 --mount type=bind,src=./config.json,dst=/var/indigo/config.json,ro -it OptionsIRCIL/indigo:latest
```
