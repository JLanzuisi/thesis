\ProvidesExplClass{thesis}{29-07-2023}{}
    {Main class for my thesis}

\PassOptionsToClass
    {
        12pt,
        letterpaper,
        openany,
        oneside,
    }
    {book}

\LoadClass{book}

\RequirePackage { geometry }
\RequirePackage { setspace }
\RequirePackage { microtype }
\RequirePackage { enumitem }
\RequirePackage { polyglossia }
\RequirePackage { csquotes }
\RequirePackage { biblatex }
\RequirePackage { xcolor }
\RequirePackage { hyperref }
\RequirePackage { graphicx }
\RequirePackage { mathtools, amsthm }
\RequirePackage { dirtytalk }
\RequirePackage [ spanish ] { cleveref }
\RequirePackage { epigraph }

% Lang
\setdefaultlanguage{spanish}

% Cref
\crefname{section}{\S}{\S}

% Set page margins
\geometry
    {
        includehead,
        paper = letterpaper,
        left = 3cm,
        right = 2cm,
        bottom = 2cm,
        top = 2cm,
        marginparsep = 10pt,
        marginparwidth = 2cm,
    }

% Set fonts
\usepackage[default,varnothing]{fontsetup}
\newfontface\titlefont{CMUSerif-BoldNonextended}[Scale=MatchUppercase, Letters=Uppercase]

% Set basic spacing
\setlength { \parindent } { 8.46pt }
\setlength { \parskip } { 6pt }
\onehalfspacing

% Headers and footer
\pagestyle{headings}
\gdef\@oddhead{\hfil\thepage}

% Bibliography
\addbibresource{references.bib}

% Hyperref
\hypersetup
    {
        colorlinks = true,
        allcolors = black,
    }

% Theorems
\newtheoremstyle{defi}% hnamei
    {.5\baselineskip}% hSpace abovei
    {.5\baselineskip}% hSpace belowi
    {}% hBody fonti
    {}% hIndent amounti
    {\scshape\addfontfeatures{LetterSpace=5}}% hTheorem head fonti
    {.}% hPunctuation after theorem headi
    {.5em}% hSpace after theorem headi
    {}% hTheorem head spec (can be left empty, meaning ‘normal’)i
\theoremstyle{defi}
\newtheorem{defi}{Definición}[chapter]

% Sectioning commands
\usepackage[explicit]{titlesec}
\titleformat
    {\chapter}
    [display]
    {\titlefont}
    {
        \centering
        \fontsize{14}{14}\selectfont
        \UpperCase{Capítulo}~\thechapter\\[10pt]
        \fontsize{12}{12}\selectfont
        \UpperCase{#1}
    }
    {0ex}
    {\centering}
\titleformat{name=\chapter, numberless}
    [block]
    {\titlefont}
    {\fontsize{14}{14}\selectfont\UpperCase{#1}}
    {0ex}
    {\centering}
\titleformat
    {\section}
    {\titlefont}
    {\thesection\fontsize{12}{12}\selectfont\ #1}
    {0ex}
    {}
\titleformat{name=\section, numberless}
    [block]
    {\titlefont}
    {\fontsize{12}{12}\selectfont #1}
    {0ex}
    {}

% USB logo
\cs_set_eq:NN \latex_centering:D \centering

\cs_new:Npn \th_print_logo_head:n #1
    {
        \group_begin:
            \latex_centering:D
            \includegraphics[scale=.3]{resources/usblogo} \\
            { \titlefont \UpperCase{#1} }
            \tex_par:D
        \group_end:
    }

\NewDocumentCommand{ \UpperCase }{ m }
    {
        \group_begin:
        \addfontfeatures{LetterSpace=10}
        \text_uppercase:n { #1 }
        \group_end:
    }

\NewDocumentCommand{ \UppercaseBold }{ m }
    {
        { \titlefont\UpperCase{#1} }
    }

\NewDocumentCommand{ \PrintUsbLogo }{ m }
    {
        \th_print_logo_head:n { #1 }
    }

\NewDocumentCommand{ \ToC }{}
    {
        \chapter*{Índice~General}
        \@starttoc{toc}
    }

% Notes
\reversemarginpar
\NewDocumentCommand{ \note }{ m }
{
    \marginpar 
    { 
        \color{blue}
        \raggedleft
        \sffamily
        \scriptsize
        #1
        \PackageWarning{Notes}{Revisar~nota}
    }
}

% Wrapping
\newlength{\wrapwd}
\NewDocumentCommand { \wrapto } { o o m }
{
    \IfNoValueTF { #1 }
        { \setlength{\wrapwd}{.6\linewidth} }
        { \setlength{\wrapwd}{#1} }
    \IfNoValueTF { #2 }
        { \let\wrapal\raggedright }
        { \let\wrapal#2 }
    \begin{minipage}{\wrapwd}
        \wrapal
        #3
    \end{minipage}
}

% Conditionals
\newif { \ifcaratula }
\newif { \ifpaginatitulo }
\newif { \ifresumen }
\newif { \ifdedicatoria }
\newif { \ifagradecimientos }
\newif { \iftoc }
\newif { \ifsimbolos }
\newif { \ifabreviaturas }
\newif { \ifintro }
\newif { \ifbasicos }
\newif { \ifreferencias }

\RequirePackage{thesis}
