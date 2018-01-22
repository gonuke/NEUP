projectid=15645




pdf: narrative.pdf abstract.pdf benefits_of_collaboration.pdf capabilities.pdf

abstract.pdf: abstract.tex
	pdflatex abstract.tex

capabilities.pdf: capabilities.tex
	pdflatex capabilities.tex

narrative: acronyms.tex defs.tex narrative.tex \
	narrative_1_objective.tex \
	narrative_2_scope.tex \
    narrative_3_logical_path.tex\
	task_1_fcci.tex \
	task_2_robustness.tex \
    narrative_5.tex \
    narrative_6.tex \
	narrative.bib
	pdflatex narrative.tex
	pdflatex narrative.tex
	pdflatex narrative.tex
	mv narrative.pdf 2018-CFA-Narrative-${projectid}.pdf

benefits_of_collaboration.pdf: defs.tex benefits_of_collaboration.tex 
	pdflatex benefits_of_collaboration.tex

bib:
	pdflatex narrative.tex               
	bibtex narrative
	pdflatex narrative.tex
	pdflatex narrative.tex

clean:
	rm -vf *.aux *.log *.blg *.bbl narrative.pdf abstract.pdf
