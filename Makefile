all: cv.tex
	mkdir -p out/fi
	pdflatex -interaction nonstopmode -halt-on-error -output-directory out/fi -jobname=cv cv.tex
	mkdir -p out/en
	pdflatex -interaction nonstopmode -halt-on-error -output-directory out/en -jobname=cven cv.tex

clean:
	rm -rf out
