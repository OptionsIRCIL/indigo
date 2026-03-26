# syntax=docker/dockerfile:1-labs

ARG VERSION_GOLANG=1.26.1
ARG VERSION_NODE=24
ARG VERSION_ALPINE=3.23
ARG VERSION_NGINX=3
ARG VERSION_OPENSSL=1

# Compile OptionsIRCIL/indigo-backend
FROM --platform=$BUILDPLATFORM golang:${VERSION_GOLANG}-alpine${VERSION_ALPINE} AS indigo_compile_backend
ARG TARGETOS
ARG TARGETARCH
COPY backend /src/backend
RUN --mount=type=cache,target=/go/pkg/mod <<EOF
go build \
    -C /src/backend \
    -v \
    -o /dist/server \
    ./cmd/indigo/main.go;
EOF

# Generated API spec from OptionsIRCIL/indigo-backend
FROM --platform=$BUILDPLATFORM indigo_compile_backend AS indigo_compile_backend_openapi_spec
COPY docs/example/config.json /config.json
WORKDIR /
RUN /dist/server generate_openapi_spec > /api.json

# Compile OptionsIRCIL/indigo-frontend
FROM --platform=$BUILDPLATFORM node:${VERSION_NODE}-alpine${VERSION_ALPINE} AS indigo_compile_frontend
COPY frontend /src/frontend
RUN --mount=type=cache,target=/dist-cache <<EOF
if [ -f /dist-cache/3rdpartylicenses.txt ]; then
  mkdir -p /dist/frontend
  cp /dist-cache/* /dist/frontend/
  exit 0
fi
npm install --verbose --prefix=/src/frontend
npm run ng build indigo-frontend --verbose --prefix=/src/frontend -- \
    --output-path=/dist/frontend \
    --output-mode=static \
    --verbose
cp /dist/frontend/* /dist-cache/
EOF

FROM alpine:$VERSION_ALPINE AS dist
RUN apk add -v \
      nginx=~1 \
      openssl=~3 &&\
    rm -rf /var/cache/apk

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

# Install scripts
COPY --chmod=0755 bin /usr/bin

ENTRYPOINT ["/entrypoint.sh"]

FROM --platform=$BUILDPLATFORM scratch AS dist_openapi_spec
COPY --from=indigo_compile_backend_openapi_spec /api.json /api.json

FROM dist AS dev
# Allow API over port 80
COPY nginx/indigo.d/80.conf /etc/nginx/indigo.d/80.conf
