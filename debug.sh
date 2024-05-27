#!/bin/bash

set -ex

flags='-halt-on-error --interaction=nonstopmode'
mainfile='main.tex'

# Dump the preamble to fmt
gen_fmt() {
    if [ ! -f preamble.fmt ]; then
        echo Generating fmt file.
        pdflatex -ini '&pdflatex' '\def\initex{1}\input{preamble.tex}'
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
    biber main
    pdflatex --fmt=preamble -draftmode $flags $mainfile
    pdflatex --fmt=preamble $flags $mainfile
}

clean
full_comp
quick_comp
