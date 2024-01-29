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
\RequirePackage [ spanish ] { babel }
\RequirePackage { csquotes }
\RequirePackage { biblatex }
\RequirePackage { xcolor }
\RequirePackage { hyperref }
\RequirePackage { graphicx }
\RequirePackage { mathtools, amsthm }
\RequirePackage { dirtytalk }
\RequirePackage [ spanish ] { cleveref }
\RequirePackage { epigraph }
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
\usepackage{libertinus}
\usepackage[libertine, subscriptcorrection]{newtxmath}
\usepackage[cal=boondoxo, frak=euler]{mathalfa}
\usepackage[T1]{fontenc}

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
    {\scshape}% hTheorem head fonti
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
    {\bfseries}
    {
        \centering
        \fontsize{14}{14}\selectfont
        \textls{\MakeUppercase{Capítulo}}~\thechapter\\[10pt]
        \fontsize{12}{12}\selectfont
        \textls{\MakeUppercase{#1}}
    }
    {0ex}
    {\centering}
\titleformat{name=\chapter, numberless}
    [block]
    {\bfseries}
    {\fontsize{14}{14}\selectfont\textls{\MakeUppercase{#1}}}
    {0ex}
    {\centering}
\titleformat
    {\section}
    {\bfseries}
    {\thesection\fontsize{12}{12}\selectfont\ #1}
    {0ex}
    {}
\titleformat{name=\section, numberless}
    [block]
    {\bfseries}
    {\fontsize{12}{12}\selectfont #1}
    {0ex}
    {}

% USB logo
\cs_set_eq:NN \latex_bfseries:D \bfseries

\cs_new:Npn \th_uppercase_bold:n #1
    {
        \group_begin:
            \latex_bfseries:D
            \text_uppercase:n { #1 }
        \group_end:
    }

\cs_generate_variant:Nn \th_uppercase_bold:n { x }

\cs_set_eq:NN \latex_centering:D \centering

\cs_new:Npn \th_print_logo_head:n #1
    {
        \group_begin:
            \latex_centering:D
            \includegraphics[scale=.3]{usblogo} \\
            \th_uppercase_bold:n { \textls { #1 } }
            \tex_par:D
        \group_end:
    }

\NewDocumentCommand{ \UppercaseBold }{ m }
    {
        \th_uppercase_bold:x { #1 }
    }

\NewDocumentCommand{ \UpperCase }{ m }
    {
        \text_uppercase:n { #1 }
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
