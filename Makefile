HUGO_IMAGE ?= hugomods/hugo:latest
DOCKER     ?= docker
PORT       ?= 1313

DOCKER_RUN = $(DOCKER) run --rm -it \
	-v $(PWD):/src \
	-w /src \
	-p $(PORT):$(PORT) \
	$(HUGO_IMAGE)

.PHONY: help serve build clean version shell

help:
	@echo "Targets:"
	@echo "  make serve    - run Hugo dev server on http://localhost:$(PORT)"
	@echo "  make build    - build the site into ./docs"
	@echo "  make clean    - remove ./docs and cached resources"
	@echo "  make version  - print Hugo version from the container"
	@echo "  make shell    - open a shell inside the Hugo container"

serve:
	$(DOCKER_RUN) hugo server \
		--bind 0.0.0.0 \
		--port $(PORT) \
		--baseURL http://localhost:$(PORT)/ \
		--appendPort=false \
		--buildDrafts \
		--disableFastRender

build:
	$(DOCKER_RUN) hugo --gc --minify --cleanDestinationDir

clean:
	rm -rf docs resources/_gen public

version:
	$(DOCKER_RUN) hugo version

shell:
	$(DOCKER_RUN) sh
