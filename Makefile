all: cv.tex
	mkdir -p out
	pdflatex -interaction nonstopmode -halt-on-error -output-directory out cv.tex

clean:
	rm -rf out
