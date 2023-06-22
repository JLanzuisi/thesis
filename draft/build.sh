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

latex_comp_main="tl23 lualatex -halt-on-error main.tex"
biber_comp_main="tl23 biber --input-directory=.. main"

if [[ -z "$draft" ]]; then
    $latex_comp_main && $biber_comp_main && $latex_comp_main && $latex_comp_main
else
    tl23 lualatex -halt-on-error '\PassOptionsToClass{article}{draft} \input{main.tex}'
fi
