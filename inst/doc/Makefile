TEXI2DVI = texi2dvi --pdf
RM = rm -rf

all: gumbel.pdf clean

gumbel.pdf : gumbel.tex
	$(TEXI2DVI) gumbel.tex

clean:
	$(RM) Rplots*.eps Rplots*.pdf Rplots*.jpg gumbel-*.eps gumbel-*.pdf gumbel-*.jpg *.aux *.log *.blg *.bbl *.brf *.out *.tex *.rel *.toc *~ auto
