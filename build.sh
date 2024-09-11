#!/bin/bash

set -ex

flags="-halt-on-error --interaction=nonstopmode"
mainfile="main.tex"
lualatex=c:/texlive/2023/bin/windows/lualatex.exe
biber=c:/texlive/2023/bin/windows/biber.exe

# Clean up before anything
rm -f main.pdf

if [ "$1" == "-f" ]; then
    $lualatex $flags $mainfile
else
    # Full build
    $lualatex -draftmode $flags $mainfile
    $biber main
    $lualatex -draftmode $flags $mainfile
    $lualatex $flags $mainfile
fi
