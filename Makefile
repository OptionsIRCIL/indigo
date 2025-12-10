.PHONY: clean_go clean_npm clean_buildx_builder buildx_builder

all: dist/image.tar.gz

dist/image.tar.gz: dist/image.tar
	gzip dist/image.tar

dist/image.tar: dist/backend/indigo_backend dist/frontend/browser/index.html buildx_builder
	docker buildx build . \
		--builder=indigo_container \
		--progress=plain \
		--tag OptionsIRCIL/indigo \
		-o "type=docker,dest=dist/image.tar"

buildx_builder:
	docker buildx inspect indigo_container || docker buildx create --name indigo_container --driver=docker-container

dist/backend/indigo_backend:
	go build \
		-C ./backend \
		-v \
		-o ../dist/backend/indigo_backend \
		./cmd/indigo/main.go;

dist/frontend/browser/index.html: frontend/node_modules
	npm run ng build indigo-frontend --verbose --prefix=./frontend -- \
		--output-path=../dist/frontend \
		--output-mode=static \
		--verbose

frontend/node_modules:
	npm install --verbose --prefix=./frontend

clean: clean_go clean_npm clean_buildx_builder
	rm -rf ./dist

clean_go:
	cd ./backend && go clean;

clean_npm:
	rm -rf ./frontend/node_modules;

clean_buildx_builder:
	docker buildx rm indigo_container