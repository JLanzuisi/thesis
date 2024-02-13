#!/bin/bash

set -ex

for arg in "$@"; do
    case $arg in
        -full)
            full='yes'
        ;;
    esac
done

if [[ -f main.tex ]]; then
    mainfile='main.tex'
else
    echo "No main.tex file."
    exit 1
fi

comp_file() {
    lualatex -halt-on-error --interaction=nonstopmode --output-directory=out "$mainfile"
}
biber_comp() {
    biber --output-directory=out main
}

comp_file && biber_comp && comp_file && comp_file
