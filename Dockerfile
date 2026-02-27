# syntax=docker/dockerfile:1-labs
FROM alpine:3.23.3 AS indigo_skel
RUN apk add -v \
      nginx=~1 \
      openssl=~3 &&\
    rm -rf /var/cache/apk

FROM indigo_skel AS indigo_compile
RUN apk add -v \
    npm \
    go=~1.25

# Install sources
COPY backend /src/backend
COPY frontend /src/frontend

# Build server
RUN go build \
    -C /src/backend \
    -v \
    -o /dist/server \
    ./cmd/indigo/main.go;

# Pull client deps
RUN npm install --verbose --prefix=/src/frontend

# Build client
RUN npm run ng build indigo-frontend --verbose --prefix=/src/frontend -- \
    --output-path=/dist/frontend \
    --output-mode=static \
    --verbose

FROM indigo_skel AS dist

# Install server
COPY --chmod=0755 --from=indigo_compile /dist/server /usr/bin/indigo_backend

# Install client
COPY --from=indigo_compile /dist/frontend/browser /var/www/browser
COPY --from=indigo_compile /dist/frontend/3rdpartylicenses.txt /var/www/browser/3rdpartylicenses_frontend.txt

# Install nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Install entrypoint
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install scripts
COPY --chmod=0755 bin /usr/bin

ENTRYPOINT ["/entrypoint.sh"]
