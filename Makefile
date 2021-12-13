SRCDIR = src/
BUILDDIR = build/

SRCMAIN = $(SRCDIR)main.tex

## Output file name (.pdf automatically included) ##
OUTNAME = resume

resume: $(BUILDDIR)
	pdflatex -output-directory=$(BUILDDIR) -jobname=$(OUTNAME) $(SRCMAIN)

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

## Ubuntu specific/Requires evince ##
view: resume
	evince build/resume.pdf

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)
