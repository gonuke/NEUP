pdf: narrative.pdf abstract.pdf

abstract.pdf: abstract.tex
	pdflatex abstract.tex

narrative.pdf: narrative.tex timeline.pdf narrative.bib
	pdflatex narrative.tex
