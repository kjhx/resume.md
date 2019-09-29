#!make
OUTPUT = out
STATIC = static/ out/html/static/
CSS = static/resume.css dist/style.css
HTML_DIR = $(OUTPUT)/html
PDF_DIR = $(OUTPUT)/pdf

mkdir = mkdir -p $(1)
cp = cp -r $(1)

all: html pdf

html:
	$(call mkdir, $(OUTPUT))
	$(call mkdir, $(HTML_DIR))
	$(call cp, $(STATIC))
	pandoc --section-divs -s ./src/resume.md -H static/header.html -c static/resume.css -o ./${HTML_DIR}/resume.html
	pandoc --section-divs -s ./src/letter.md -H static/header.html -c static/letter.css -o ./${HTML_DIR}/letter.html
	# pandoc --section-divs -s ./src/references.md -H static/header.html -c static/references.css -o ./${HTML_DIR}/references.html

pdf: html
	$(call mkdir, $(PDF_DIR))
	node bin/render.js "resume.html" "$(PDF_DIR)/resume.pdf"
	node bin/render.js "letter.html" "$(PDF_DIR)/letter.pdf"
	# node bin/render.js "references.html" "$(PDF_DIR)/references.pdf"

clean:
	rm -rf out/