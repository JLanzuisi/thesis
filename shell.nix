{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/4c8cf44c5b9481a4f093f1df3b8b7ba997a7c760.tar.gz") {} }:

let
    tex = pkgs.texlive.combine { 
        inherit (pkgs.texlive) scheme-small
        lualatex-math enumitem csquotes biblatex
        lipsum pgf standalone;
    };
in
    pkgs.mkShell { 
        LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
        buildInputs = [
            tex
            pkgs.biber
            pkgs.entr
        ];
    }
