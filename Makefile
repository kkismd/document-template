DIAGRAM_ENV = -e DIAGRAM_PLANTUML_CLASSPATH=/documents/bin/plantuml.1.2021.12.jar
DOCKER_RUN = docker run -it --rm -v $(shell pwd):/documents/ $(DIAGRAM_ENV) asciidoctor/docker-asciidoctor
REQUIRE = -r asciidoctor-diagram -a scripts=cjk
ARGS = -a pdf-theme=./themes/my-theme.yml -a imagesoutdir=./plantuml-images -a pdf-fontsdir=./fonts
ASCIIDOCTOR = $(DOCKER_RUN) asciidoctor-pdf $(REQUIRE) $(ARGS)

all: index.pdf

index.pdf: index.adoc

%.pdf: %.adoc
	$(ASCIIDOCTOR) -o $@ $<

.PHONY: fonts
fonts:
	(cd fonts && ./download.sh)

.PHONY: clean
clean:
	rm -f *.pdf
	rm -f plantuml-images/*

.PHONY: bin
bin:
	(cd bin && ./download.sh)
