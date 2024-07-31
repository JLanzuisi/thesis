#!/bin/bash

set -ex

flags="-halt-on-error --interaction=nonstopmode"
mainfile="main.tex"

# Clean up before anything
# git clean -fx
rm -f main.pdf

# Dump the preamble to fmt
echo Generating fmt file.
pdflatex $flags -ini '&pdflatex' '\def\initex{1}\input{preamble.tex}'

# Get the compilation started
pdflatex --fmt=preamble -draftmode $flags $mainfile
biber main
pdflatex --fmt=preamble -draftmode $flags $mainfile
pdflatex --fmt=preamble $flags $mainfile

# Keep updating the pdf on file changes
fd '.*\.tex' | entr pdflatex --fmt=preamble $flags $mainfile
