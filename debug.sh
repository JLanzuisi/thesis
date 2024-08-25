#!/bin/bash

set -ex

flags="-halt-on-error --interaction=nonstopmode"
mainfile="main.tex"

# Clean up before anything
# git clean -fx
rm -f main.pdf

# Get the compilation started
lualatex -draftmode $flags $mainfile
biber main
lualatex -draftmode $flags $mainfile
lualatex $flags $mainfile

# Keep updating the pdf on file changes
fd '.*\.tex' | entr lualatex $flags $mainfile
