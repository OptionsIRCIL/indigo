# syntax=docker/dockerfile:1-labs
FROM alpine:3.23.3 AS indigo_skel
RUN apk add -v \
      nginx=~1 \
      openssl=~3 &&\
    rm -rf /var/cache/apk

FROM --platform=$BUILDPLATFORM indigo_skel AS indigo_compile_backend
ARG TARGETOS
ARG TARGETARCH
RUN apk add -v go=~1.25

# Install sources
COPY backend /src/backend

# Build server
RUN go build \
    -C /src/backend \
    -v \
    -o /dist/server \
    ./cmd/indigo/main.go;

FROM --platform=$BUILDPLATFORM indigo_compile_backend AS indigo_compile_backend_openapi_spec
COPY docs/example/config.json /config.json
RUN /dist/server generate_openapi_spec > /api.json

FROM --platform=$BUILDPLATFORM indigo_skel AS indigo_compile_frontend
RUN apk add -v npm

# Install sources
COPY frontend /src/frontend

# Pull client deps
RUN npm install --verbose --prefix=/src/frontend

# Build client
RUN npm run ng build indigo-frontend --verbose --prefix=/src/frontend -- \
    --output-path=/dist/frontend \
    --output-mode=static \
    --verbose

FROM indigo_skel AS dist

# Install server
COPY --chmod=0755 --from=indigo_compile_backend /dist/server /usr/bin/indigo_backend

# Install client
COPY --from=indigo_compile_frontend /dist/frontend/browser /var/www/browser
COPY --from=indigo_compile_frontend /dist/frontend/3rdpartylicenses.txt /var/www/browser/3rdpartylicenses_frontend.txt

# Install nginx config
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/indigo.d/80-redirect.conf /etc/nginx/indigo.d/80.conf
COPY nginx/indigo.d/443.conf /etc/nginx/indigo.d/443.conf

# Install entrypoint
COPY --chmod=0755 entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install scripts
COPY --chmod=0755 bin /usr/bin

ENTRYPOINT ["/entrypoint.sh"]

FROM --platform=$BUILDPLATFORM scratch AS dist_openapi_spec
COPY --from=indigo_compile_backend_openapi_spec /api.json /api.json

FROM dist AS dev
# Allow API over port 80
COPY nginx/indigo.d/80.conf /etc/nginx/indigo.d/80.conf
