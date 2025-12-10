#!/bin/sh
cat<<RIZZ
██████▒ ██▒   ██▒ ████▒   ██████▒   ████▒     ████▒
  ██▒   ████▒ ██▒ ██▒ ██▒   ██▒   ██▒       ██▒   ██▒
  ██▒   ██▒ ████▒ ██▒ ██▒   ██▒   ██▒ ████▒ ██▒   ██▒
██████▒ ██▒   ██▒ ████▒   ██████▒   ████▒     ████▒

v0.0.0
RIZZ

# Ensure cert directory
mkdir -p /var/indigo/ssl

# Check for SSL certs
if ! [ -f /var/indigo/ssl/key.pem ] || ! [ -f /var/indigo/ssl/fullchain.cer ]; then
  echo "WARNING! No SSL certificates were supplied. If you're connecting clients directly to the container"
  echo "without a reverse proxy, it's highly recommended that one is supplied to prevent server impersonation."
  echo ""
  echo "Generating self-signed certificates..."
  openssl req -newkey \
          rsa:2048 \
          -nodes \
          -keyout /var/indigo/ssl/key.pem \
          -x509 \
          -subj "/C=US/ST=MN/L=East Grand Forks/O=Options IRCIL/OU=Indigo Project/CN=myoptions.info" \
          -out /var/indigo/ssl/fullchain.cer
fi

echo

# Start nginx
nginx &

# Start server
# TODO: Socket permissions are bad. Figure out a way to let nginx read/write socket.
cd /var/indigo || (echo "FATAL: Couldn't enter /var/indigo" && exit 1)
indigo_backend -socket /var/run/indigo_backend.sock -socket_gid "$(getent group nginx | cut -d: -f3)"