STYLE := the-china-quarterly.csl
BIBLIOGRAPHY := test/references.bib
PDF := output/pdf/the-china-quarterly-citation-examples.pdf
PDF_TEXT := tmp/pdfs/the-china-quarterly-citation-examples.txt
FONTCONFIG_FILE := tmp/fonts/fonts.conf
FONTCONFIG_ENV := FONTCONFIG_FILE="$(CURDIR)/$(FONTCONFIG_FILE)"
UNIFONT_DIR := $(shell realpath "$(DEVBOX_PACKAGES_DIR)/share/fonts")
TERMES_DIR := $(dir $(shell kpsewhich texgyretermes-regular.otf))

.PHONY: test pandoc-test pdf pdf-test

test: pandoc-test pdf-test

pandoc-test:
	pandoc test/example.md --citeproc --csl="$(STYLE)" --bibliography="$(BIBLIOGRAPHY)" --to=markdown_strict --wrap=none --output=test/actual.md
	diff -u example-output.md test/actual.md
	@printf '%s\n' 'Pandoc rendering: passed'

pdf:
	@mkdir -p "$(dir $(PDF))" "$(dir $(FONTCONFIG_FILE))"
	@printf '%s\n' \
		'<?xml version="1.0"?>' \
		'<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">' \
		'<fontconfig>' \
		'  <dir>$(TERMES_DIR)</dir>' \
		'  <dir>$(UNIFONT_DIR)</dir>' \
		'</fontconfig>' > "$(FONTCONFIG_FILE)"
	$(FONTCONFIG_ENV) TZ=UTC SOURCE_DATE_EPOCH=946684800 pandoc test/example.md \
		--citeproc \
		--csl="$(STYLE)" \
		--bibliography="$(BIBLIOGRAPHY)" \
		--standalone \
		--include-in-header=test/cjk-header.tex \
		--pdf-engine=xelatex \
		--metadata=title:'The China Quarterly CSL' \
		--metadata=subtitle:'Rendered citation and reference examples' \
		--metadata=date:'Validation fixture' \
		--variable=papersize:a4 \
		--variable=mainfont:'TeX Gyre Termes' \
		--variable=geometry:margin=25mm \
		--variable=fontsize:11pt \
		--output="$(PDF)"

pdf-test: pdf
	@mkdir -p "$(dir $(PDF_TEXT))"
	qpdf --check "$(PDF)"
	pdftotext -layout "$(PDF)" "$(PDF_TEXT)"
	rg -Fq 'Duckett 2010.' "$(PDF_TEXT)"
	rg -Fq 'Ibid., 54.' "$(PDF_TEXT)"
	rg -Fq 'O’Brien and Li 2006.' "$(PDF_TEXT)"
	rg -Fq '中国社会科学院' "$(PDF_TEXT)"
	rg -Fq 'Zhongwai guanggao shi (A History of Advertising in China and' "$(PDF_TEXT)"
	rg -Fq 'Zhongguo yujia chubanshe.' "$(PDF_TEXT)"
	rg -Fq '“A translated title” (trans.). 2010. China Daily, 12 June.' "$(PDF_TEXT)"
	rg -Fq '“a recorded song,” An Album, Recording, Example Records.' "$(PDF_TEXT)"
	@reference_page=$$(for page in $$(seq 1 $$(pdfinfo "$(PDF)" | awk '/^Pages:/ {print $$2}')); do \
		first_text=$$(pdftotext -f "$$page" -l "$$page" "$(PDF)" - | sed '/^[[:space:]]*$$/d' | head -n 1); \
		if [ "$$first_text" = 'References' ]; then printf '%s' "$$page"; break; fi; \
	done); \
	test -n "$$reference_page"; \
	printf '%s\n' "References start on a new page: $$reference_page"
	@printf '%s\n' 'PDF content: passed'
