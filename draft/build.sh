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

latex_comp_main="lualatex -halt-on-error main.tex"
biber_comp_main="biber --input-directory=.. main"

if [[ -z "$draft" ]]; then
    $latex_comp_main && $biber_comp_main && $latex_comp_main && $latex_comp_main
else
    lualatex -halt-on-error '\PassOptionsToClass{article}{draft} \input{main.tex}'
fi
