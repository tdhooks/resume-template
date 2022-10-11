SRCDIR = ./src
SRCFILES = $(wildcard $(SRCDIR)/*)

OUTNAME = resume
OUTDIR = ./build
OUTFILE = $(OUTDIR)/$(OUTNAME).pdf

.PHONY: default
default: $(OUTFILE)

$(OUTFILE): $(SRCFILES)
	docker build \
	--target resume \
	--output $(OUTDIR) \
	--build-arg OUTNAME=$(OUTNAME) \
	.

.PHONY: view
view: $(OUTFILE)
	xdg-open $(OUTFILE)

.PHONY: clean
clean: $(OUTDIR)
	rm -rf $(OUTDIR)
