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

## Compose Development Quick-Start

It's possible to quickly bootstrap this repo like so:

```shell
# Create config directory
mkdir -p config

# Write a basic config
cat > ./config/config.json <<EOF
{
  "database": {
    "dsn": "root:correct-horse-battery-staple@tcp(db:3306)/indigo"
  },
  "authentication": {
    "hmacKey": "c0ffee->c0ffee->c0ffee->c0ffee->c0ffee->c0ffee->c0ffee->c0ffee!!",
    "local": {}
  }
}
EOF

# Build and serve
docker compose up -d --force-recreate --build
```

Some other useful commands are as follows.

### Log Monitoring

You can check the container logs with `docker compose logs`.
```shell
docker compose logs indigo -f
```

### User Creation

Local users can be made like so:
```shell
docker compose exec -it indigo idg-create-user \
    -username "john.doe" \
    -password "correct-horse-battery-staple" \
    -first "John" \
    -last "Doe"
```

### Playwright Tests

Once Indigo is running, you can run tests using Playwright.
Note that Playwright only supports Ubuntu.

```shell
npx playwright test
npx playwright show-report
```
