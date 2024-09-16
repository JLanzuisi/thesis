# thesis
Files related to my undergraduate thesis in mathematics

## Compilation

The `main.tex` uses the `luatex` engine with the `LaTeX` format,
so the following compiles the document:
```
lualatex main.tex
```
given all used packages are installed and the TeX distribution is relatively
up to date.

Of course, LaTeX being how it is, this is not a full compilation,
but it is good enough to make simple edits.

To get the final document, a couple more calls to `pdflatex`
are needed, as well as a call to `biber` for bibliographies.
And this whole endevour as a correct order in which to call the
binaries (isn't LaTeX lovely?).
This is somewhat automated in `build.sh`, so take a look at the script.
