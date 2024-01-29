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
    lualatex -halt-on-error --interaction=nonstopmode --output-directory=out "$1"
}
biber_comp() {
    biber --input-directory=.. --output-directory=out main
}

comp_file "$1" && biber_comp && comp_file "$1" && comp_file "$1"
