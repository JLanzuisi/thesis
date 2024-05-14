#!/bin/bash

set -ex

mkdir -p out

flags='-halt-on-error --interaction=nonstopmode --output-directory=out'
mainfile='main.tex'

# Dump the preamble to fmt
gen_fmt() {
    if [ ! -f preamble.fmt ]; then
        echo Generating fmt file.
        pdflatex -ini '&pdflatex' preamble.tex
    fi
}

# Clean up
clean() {
    rm -rf out/* preamble.fmt
}

# Quick compile
quick_comp() {
    gen_fmt
    fd '.*\.tex' | entr pdflatex --fmt=preamble $flags $mainfile
}

# Full compile (with bibiliopgraphy}
full_comp() {
    gen_fmt
    pdflatex --fmt=preamble -draftmode $flags $mainfile
    biber --output-directory=out main
    pdflatex --fmt=preamble -draftmode $flags $mainfile
    pdflatex --fmt=preamble $flags $mainfile
}

clean
full_comp
quick_comp
