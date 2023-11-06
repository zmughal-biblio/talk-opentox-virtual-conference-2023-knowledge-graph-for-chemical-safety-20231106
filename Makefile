## Config global
LATEXMK = latexmk $(LATEXMKRC_FLAGS) -f -pdf -silent -diagnostics
XELATEX_OPT := -e '$$pdflatex=q/xelatex -synctex=1 %O %S/'

%.pdf: %.tex
	-$(LATEXMK) $<

PRESENT_DEP := preamble/present-helper.tex meta/present.tex gfx/knowledge-org.tex gfx/simple-rdf.tex

BASE := opentox-2023-knowledge-graph-for-chemical-safety

MINIMAL_TARGETS := $(BASE).pdf

ALL_TARGETS := $(MINIMAL_TARGETS)

all: $(ALL_TARGETS)

minimal: $(MINIMAL_TARGETS)

$(BASE).pdf: LATEXMKRC_FLAGS +=  $(XELATEX_OPT)
$(BASE).pdf: $(BASE).tex $(PRESENT_DEP)

include ~/sw_projects/zmughal/scraps/scraps/build/latex/clean.mk

cleanall::
	rm -Rf $(ALL_TARGETS)
