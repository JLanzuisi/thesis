#!/bin/sh

echo main.tex | entr pdflatex -halt-on-error --output-directory=out main.tex
