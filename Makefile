ALLFIGS    := $(shell ls fig/*.fig)
ALLPNGS    := $(patsubst fig/%,out/%,$(patsubst %.fig,%.png,$(ALLFIGS)))
TODAY      := $(shell git show -s --format=%cd --date=format:"%Y%m%d" HEAD)
MKFILEPATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

$(info $(ALLPNGS))

all: jswitch.pdf jswitch_beamer.pdf

clean:
	rm -rf out

out:
	mkdir out

jswitch.pdf: src/jswitch.tex out/gitdate.tex $(ALLPNGS) out/jtag_logic.png | out
	cd out; pdflatex ../src/jswitch.tex
	cd out; pdflatex ../src/jswitch.tex
	cp out/jswitch.pdf $(MKFILEPATH)/jswitch_doc_${TODAY}.pdf
	mv out/jswitch.pdf $(MKFILEPATH)/jswitch_doc_current.pdf

jswitch_beamer.pdf: src/jswitch_beamer.tex out/gitdate.tex $(ALLPNGS) out/jtag_logic.png | out
	cd out; pdflatex ../src/jswitch_beamer.tex; pdflatex ../src/jswitch_beamer.tex; pdflatex ../src/jswitch_beamer.tex
	cp out/jswitch_beamer.pdf $(MKFILEPATH)/jswitch_beamer_${TODAY}.pdf
	mv out/jswitch_beamer.pdf $(MKFILEPATH)/jswitch_beamer_current.pdf

.PHONY: out/gitdate.tex
out/gitdate.tex: out
	echo -e "\\\newcommand{\gitdate}{$(shell git show -s --format=%cd --date=format:"%d %B %Y" HEAD)}" > out/gitdate.tex

out/jtag_logic.png: png/jtag_logic.png | out
	cp $< $@

out/%.png: fig/%.fig | out
	fig2dev -L png -m 2.0 -S 2 $< $@

