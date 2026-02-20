FROM alpine:3.23.0

# Install required packages
# TODO: Compile backend binary with musl to avoid needing gcompat
RUN apk add -v \
      nginx=~1 \
      openssl=~3 \
      gcompat=~1

# Install server
COPY --chmod=0755 dist/backend/indigo_backend /usr/bin/indigo_backend

# Install client
COPY dist/frontend/browser /var/www/browser
COPY dist/frontend/3rdpartylicenses.txt /var/www/browser/3rdpartylicenses_frontend.txt

# Install nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Install entrypoint
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
