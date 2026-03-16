# Maintenance Scripts

The Indigo container ships with a variety of scripts
for application maintenance.

## Local User Management

To create a local user, run the following on the command line:

```shell
docker compose exec -it indigo idg-create-user \
    -username "john.doe" \
    -password "correct-horse-battery-staple" \
    -first "John" \
    -last "Doe"
```
