pdf: narrative.pdf abstract.pdf benefits_of_collaboration.pdf capabilities.pdf

abstract.pdf: abstract.tex
	pdflatex abstract.tex

capabilities.pdf: capabilities.tex
	pdflatex capabilities.tex

narrative.pdf: narrative.tex timeline.pdf narrative.bib
	pdflatex narrative.tex

benefits_of_collaboration.pdf: benefits_of_collaboration.tex 
	pdflatex benefits_of_collaboration.tex

bib:
	pdflatex narrative.tex               
	bibtex narrative
	pdflatex narrative.tex
	pdflatex narrative.tex

clean:
	rm -vf *.aux *.log *.blg *.bbl narrative.pdf abstract.pdf
