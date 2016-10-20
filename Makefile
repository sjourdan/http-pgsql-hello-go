COMMIT = $$(git describe --always)

.PHONY: all

all: build

help: ## This help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build binary
	GOOS=linux CGO_ENABLED=0 go build -o server -ldflags "-X main.GitCommit=\"$(COMMIT)\""

clean: ## Clean repository
	go clean
	rm -f server

dep: ## Get dependencies
	git submodule update --init
	mkdir -p src pkg bin
	GOPATH="$$PWD" go get github.com/lib/pq
