#!/bin/bash

for arg in "$@"; do
    case $arg in
        -draft)
            draft='yes'
        ;;
    esac
done

TEXINPUTS='.:..//:'
OPENTYPEFONTS='../fonts//:'
export TEXINPUTS OPENTYPEFONTS

comp_file() {
    lualatex -halt-on-error --output-directory=out "$1"
}
biber_comp() {
    biber --input-directory=.. --output-directory=out main
}

if [[ -z "$draft" ]]; then
    comp_file main.tex && biber_comp && comp_file main.tex && comp_file main.tex
else
    comp_file '\PassOptionsToClass{book}{draft} \input{main.tex}'
fi
