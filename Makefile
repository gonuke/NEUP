foaid=2018-CFA
projectid=15645

narrative=${foaid}-Narrative-${projectid}.pdf
abstract=${foaid}-Abstract-${projectid}.pdf
capabilities=${foaid}-Capabilities-${projectid}.pdf
benefits_of_collaboration=${foaid}-Benefits-of-Collaboration-${projectid}.pdf

all: ${narrative} ${abstract} ${benefits_of_collaboration} ${capabilities}

${abstract}: defs.tex abstract.tex
	pdflatex abstract.tex
	pdflatex abstract.tex
	mv abstract.pdf ${foaid}-Abstract-${projectid}.pdf

${capabilities}: defs.tex capabilities.tex
	pdflatex capabilities.tex
	pdflatex capabilities.tex
	mv capabilities.pdf ${foaid}-Capabilities-${projectid}.pdf

${narrative}: acronyms.tex defs.tex narrative.tex \
	narrative_1_objective.tex \
	narrative_2_scope.tex \
    narrative_3_logical_path.tex\
	task_1_fcci.tex \
	task_2_robustness.tex \
    narrative_4.tex \
    narrative_5.tex \
	narrative.bib
	pdflatex narrative.tex
	pdflatex narrative.tex
	pdflatex narrative.tex
	mv narrative.pdf ${foaid}-Narrative-${projectid}.pdf

${benefits_of_collaboration}: defs.tex benefits_of_collaboration.tex 
	pdflatex benefits_of_collaboration.tex
	pdflatex benefits_of_collaboration.tex
	mv benefits_of_collaboration.pdf ${foaid}-Benefits-of-Collaboration-${projectid}.pdf

bib:
	pdflatex narrative.tex               
	bibtex narrative
	pdflatex narrative.tex
	pdflatex narrative.tex

tidy:
	rm -vf *.aux *.log *.blg *.bbl

clean: tidy
	rm -vf ${narrative} ${abstract} ${capabilities} ${benefits_of_collaboration}
