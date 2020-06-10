#!/bin/bash

TODAY=$(git show -s --format=%cd --date=format:"%Y%m%d" HEAD)

cd out
echo "\newcommand{\gitdate}{"$(git show -s --format=%cd --date=format:"%d %B %Y" HEAD)"}" > gitdate.tex

pdflatex ../src/jswitch.tex
pdflatex ../src/jswitch.tex

cp jswitch.pdf ../jswitch_doc_${TODAY}.pdf
mv jswitch.pdf ../jswitch_doc_current.pdf
