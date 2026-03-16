# SSL Certificates

By default, Indigo requires all outbound connections to be SSL-secured. Enforcement
of HTTPS is due to the potential risks posed by transmitting consumer
personal health information over an unencrypted connection.

To do this, SSL certificates are utilized. For the uninitiated, the following resources
may be helpful to get a baseline understanding of SSL certs:

 - [What is an SSL Certificate? (cloudflare.com)](https://www.cloudflare.com/learning/ssl/what-is-an-ssl-certificate/)
 - [Bulletproof TLS Guide (feistyduck.com)](https://www.feistyduck.com/library/bulletproof-tls-guide/online/)

If you do not have an SSL certificate yet, [Let's Encrypt](https://letsencrypt.org)
is a good certificate authority for small to medium size projects. The EFF
maintains a [useful tool](https://certbot.eff.org) for automating renewal of 
these certificates.

By default, Indigo will generate self-signed certificates on startup.
Use of these certificates, however, are not recommended as they are not signed
by a certificate authority (CA). It's thus recommended that you either
[provide Indigo with signed certificates](#providing-certificates-to-indigo) or 
[place Indigo behind a reverse proxy](#place-indigo-behind-a-reverse-proxy).

## Providing Certificates to Indigo

By default, Indigo will check for certificates in `/var/indigo`. It looks for a
certificate at `/var/indigo/fullchain.cer` and a key at `/var/indigo/key.pem`.
To add your certificates to these locations, you may add them to the `source`
provided in the bind mount configured for the `indigo` service in `compose.yml`.

!!! example "Updated Example File Structure"
      For those using the suggested file structure, you can place these files
      in `./config/`.
      <div class="file-tree" markdown>

      - 📁 indigo
         - 📄 compose.yml
         - 📁 config
            - ⚙️ config.json
            - 🔏 fullchain.cer
            - 🔑 key.pem
         - 📁 data
            - 📁 indigo
            - 📁 mariadb

      </div>

## Place Indigo Behind a Reverse Proxy

In some instances, it may be more useful to place Indigo behind a reverse proxy
to centralize certificate management. While not officially supported, the following
configuration options are recommended:

### Max Payload Size

To ensure larger attachments successfully upload, ensure that a proper max
payload size is specified.

### X-Forwarded-For

Add an `X-Forwarded-For` heading so Indigo is still aware of client IP addresses.
<!-- Possible TODO: Review backend implementation of this -->
