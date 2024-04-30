#!/bin/bash

set -ex

mkdir -p out

flags='-halt-on-error --interaction=nonstopmode --output-directory=out'
mainfile='main.tex'

# Quick compile
pdflatex -draftmode $flags $mainfile
pdflatex $flags $mainfile

# Full compile (with bibiliopgraphy}
# pdflatex -draftmode $flags $mainfile
# biber --output-directory=out main
# pdflatex -draftmode $flags $mainfile
# pdflatex $flags $mainfile
