all: cv.tex
	mkdir -p out
	pdflatex -output-directory out cv.tex

clean:
	rm -rf out
