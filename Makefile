pdf: narrative.pdf abstract.pdf

abstract.pdf: abstract.tex
	pdflatex abstract.tex

narrative.pdf: narrative.tex timeline.pdf narrative.bib
	pdflatex narrative.tex
	
bib:
	pdflatex narrative.tex               
	bibtex narrative
	pdflatex narrative.tex
	pdflatex narrative.tex

clean:
	rm -vf *.aux *.log *.blg *.bbl narrative.pdf abstract.pdf
