#!/bin/bash

set -ex

for arg in "$@"; do
    case $arg in
        -full)
            full='yes'
        ;;
    esac
done

TEXINPUTS='.:..//:'
export TEXINPUTS

comp_file() {
    pdflatex -halt-on-error  --interaction=nonstop --output-directory=out "$1"
}
biber_comp() {
    biber --input-directory=.. --output-directory=out main
}

if [[ -z "$draft" ]]; then
    comp_file "$1"
else
    comp_file "$1" && biber_comp && comp_file "$1" && comp_file "$1"
fi
