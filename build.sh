#!/bin/bash

set -ex

flags="-halt-on-error --interaction=nonstopmode"
if [ -z $1 ]; then
    mainfile=main.tex
else
    mainfile=$1
fi
lualatex=lualatex
biber=biber

bibmain=$(echo $mainfile | sed -e 's/\.tex//')

# Clean up before anything
rm -f main.pdf

if [ "$1" == "-f" ]; then
    $lualatex $flags $mainfile
else
    # Full build
    $lualatex -draftmode $flags $mainfile
    $biber $bibmain
    $lualatex -draftmode $flags $mainfile
    $lualatex $flags $mainfile
fi
