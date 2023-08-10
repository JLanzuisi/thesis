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
\RequirePackage { unicode-math }
\RequirePackage { microtype }
\RequirePackage { enumitem }
\RequirePackage { polyglossia }
\RequirePackage { csquotes }
\RequirePackage { biblatex }
\RequirePackage { xcolor }
\RequirePackage { hyperref }
\RequirePackage { graphicx }

% Set page margins
\geometry
    {
        includehead,
        paper = letterpaper,
        left = 3cm,
        right = 2cm,
        bottom = 2cm,
        top = 2cm,
    }

% Set fonts
\setmainfont
    [
        Extension = .otf,
        UprightFont = *-Regular,
        ItalicFont = *-Italic,
        BoldFont = *-Bold,
        BoldItalicFont = *-BoldItalic,
    ]
    {
        OldStandard
    }
\setmathfont
    [
        Extension = .otf,
    ]
    {
        NewCMMath-Book
    }

% Set basic spacing
\setlength { \parindent } { 8.46pt }
\setlength { \parskip } { 6pt }
\onehalfspacing

% Headers and footer
\pagestyle{headings}
\gdef\@oddhead{\hfil\thepage}

% Language
\setdefaultlanguage{spanish}

% Bibliography
\addbibresource{references.bib}

% Hyperref
\definecolor{linkcolor}{HTML}{990012}
\hypersetup
    {
        colorlinks = true,
        allcolors = linkcolor,
    }

% Theorems
\newcounter{teolabelcount}
\newcounter{proplabelcount}
\newcounter{deflabelcount}
\int_zero_new:N \g_th_teo_int
\int_zero_new:N \g_th_prop_int
\int_zero_new:N \g_th_def_int

\cs_new:Npn \th_print_label:n #1 #2
    {
        \int_gincr:N #2
        #1~\int_to_arabic:n { #2 }.~
    }

\cs_new:Npn \th_indent_begin:
    {
            \list {}
            {
                \setlength { \leftmargin } { 1cm }
            }
            \item
    }

\cs_new:Npn \th_indent_end:
    {
        \endlist
    }

\NewDocumentEnvironment { teo } { o }
    {
        \refstepcounter{teolabelcount}
        \IfNoValueF { #1 } { \label { #1 } }
        \th_indent_begin:
        \th_print_label:n { Teorema } { \g_base_teo_int }
    }
    {
        \th_indent_end:
    }

\NewDocumentEnvironment { prop } { o }
    {
        \refstepcounter{proplabelcount}
        \IfNoValueF { #1 } { \label { #1 } }
        \th_indent_begin:
        \th_print_label:n { Proposición } { \g_base_prop_int }
    }
    {
        \th_indent_end:
    }

\NewDocumentEnvironment { defi } { o }
    {
        \refstepcounter{deflabelcount}
        \IfNoValueF { #1 } { \label { #1 } }
        \th_indent_begin:
        \th_print_label:n { Definición } { \g_base_def_int }
    }
    {
        \th_indent_end:
    }

% Sectioning commands
\NewDocumentCommand { \Section } {}
{
    \@startsection
    { section }
    { 1 }
    { 0mm }
    { 1\baselineskip }
    { 1\baselineskip }
    {
        \normalfont\normalsize
        \addfontfeatures{LetterSpace=8}
        \bfseries\MakeUppercase
    }
}

\cs_set_eq:NN \latex_bfseries:D \bfseries
\cs_set_eq:NN \fontspec_addfontfeatures:D \addfontfeatures

\cs_new:Npn \th_uppercase_bold:n #1
    {
        \group_begin:
            \latex_bfseries:D
            \fontspec_addfontfeatures:D { LetterSpace = 6 }
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
            \th_uppercase_bold:n { #1 }
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

\RequirePackage{thesis}
