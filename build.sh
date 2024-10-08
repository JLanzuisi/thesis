#!/bin/bash

set -ex

while [[ $# -gt 0 ]]; do
    case $1 in
        -f)
            fast=1
            shift # past argument
            ;;
        -m)
            mainfile="$2"
            shift # past argument
            shift # past value
            ;;
        *)
            echo "Unknown option $1"
            exit 1
            ;;
    esac
done

if [ -z $mainfile ]; then
    mainfile=main.tex
fi
lualatex=lualatex
biber=biber
flags="-halt-on-error --interaction=nonstopmode"

bibmain=$(echo $mainfile | sed -e 's/\.tex//')

# Clean up before anything
rm -f main.pdf

if [ -z $fast ]; then
    # Full build
    $lualatex -draftmode $flags $mainfile
    $biber $bibmain
    $lualatex -draftmode $flags $mainfile
    $lualatex $flags $mainfile
else
    $lualatex $flags $mainfile
fi
