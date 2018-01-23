foaid=2018-CFA
projectid=15645
submit_dir=submission

narrative=${submit_dir}/${foaid}-Technical-Narrative-${projectid}.pdf
abstract=${submit_dir}/${foaid}-Technical-Abstract-${projectid}.pdf
capabilities=${submit_dir}/${foaid}-Capabilities-${projectid}.pdf
benefits_of_collaboration=${submit_dir}/${foaid}-Benefits-of-Collaboration-${projectid}.pdf

all: ${narrative} ${abstract} ${benefits_of_collaboration} ${capabilities}

${submit_dir}:
	mkdir ${submit_dir}

${abstract}: include/defs.tex abstract.tex
	pdflatex abstract.tex
	pdflatex abstract.tex
	mv abstract.pdf $@

${capabilities}: include/defs.tex capabilities.tex
	pdflatex capabilities.tex
	pdflatex capabilities.tex
	mv capabilities.pdf $@

${narrative}: include/acronyms.tex include/defs.tex narrative.tex \
	narrative/1_objective.tex \
	narrative/2_scope.tex \
    narrative/3_logical_path.tex\
	narrative/3_1_fcci.tex \
	narrative/3_2_robustness.tex \
    narrative/4.tex \
    narrative/5.tex \
	narrative.bib
	pdflatex narrative.tex
	pdflatex narrative.tex
	pdflatex narrative.tex
	mv narrative.pdf $@

${benefits_of_collaboration}: include/defs.tex benefits_of_collaboration.tex 
	pdflatex benefits_of_collaboration.tex
	pdflatex benefits_of_collaboration.tex
	mv benefits_of_collaboration.pdf $@

bib:
	pdflatex narrative.tex               
	bibtex narrative
	pdflatex narrative.tex
	pdflatex narrative.tex

tidy:
	rm -vf *.aux *.log *.blg *.bbl

clean: tidy
	rm -vf ${narrative} ${abstract} ${capabilities} ${benefits_of_collaboration}
