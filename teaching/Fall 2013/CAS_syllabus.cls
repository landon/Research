%%
%% This is file `CAS_syllabus.cls',
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{CAS_syllabus}
              [2003/09/23 v0.2
 NonStandard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\Large \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname~\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

%Set modified header spacing
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -0.5ex \@minus -1.2ex}%
                                   {0.5ex \@plus.0ex}%
                                   {\normalsize\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.1ex \@plus .2ex}%
                                     {\normalsize\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.1ex \@plus .2ex}%
                                     {\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\center \normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalsize\bfseries}}

\usepackage[protrusion=true,expansion=true]{microtype}
\usepackage{fancyhdr}
\usepackage{amssymb,amsfonts,amsmath,amsthm,eucal}
\usepackage[latin1]{inputenc}
\usepackage[scaled=0.92]{beramono}
\usepackage{units}
\usepackage{lmodern}

%--------------- set spacing  --------------------------------------------------
\usepackage{setspace}
\usepackage[linkbordercolor={0 0.8 0.2},pdfborder={0 0 0},urlcolor=blue)]{hyperref}

\usepackage[T1]{fontenc}
\usepackage{mathptmx}
\usepackage{graphicx}
\usepackage{url}
\usepackage{underscore}
\usepackage{enumerate}
\usepackage{paralist}
\usepackage{longtable,datetime}
%\usepackage[normalem]{ulem} % \uwave{}),\uuline{},\sout{},\xout{}

% FOR FONTS:
\newcommand{\TimesFont}[2]{\fontfamily{ptm}\fontsize{#1}{#2}\selectfont }
\newcommand{\HelveticaFont}[2]{\fontfamily{phv}\fontsize{#1}{#2}\selectfont }
\newcommand{\UtopiaFont}[2]{\fontfamily{put}\fontsize{#1}{#2}\selectfont }
\newcommand{\PalatinoFont}[2]{\fontfamily{ppl}\fontsize{#1}{#2}\selectfont }
\newcommand{\NcntrsbkFont}[2]{\fontfamily{pnc}\fontsize{#1}{#2}\selectfont }
\newcommand{\CourierFont}[2]{\fontfamily{pcr}\fontsize{#1}{#2}\selectfont }
\newcommand{\BookmanFont}[2]{\fontfamily{pbk}\fontsize{#1}{#2}\selectfont }
\newcommand{\CharterFont}[2]{\fontfamily{bch}\fontsize{#1}{#2}\selectfont }
\newcommand{\AvantgardeFont}[2]{\fontfamily{pag}\fontsize{#1}{#2}\selectfont }

% FOR COLOR:
\usepackage{color}
\usepackage[table]{xcolor}
%\input{stdcolors}
  \definecolor{darkred}{rgb}{0.7,0,0}

  \definecolor{darkbrown}{rgb}{0.4,0.1,0}
  \definecolor{darkgreen}{rgb}{0.1,0.4,0.2}
  \definecolor{darkblue}{rgb}{0.0,0.2,0.4}
  \definecolor{unhblue}{rgb}{0.05,0.2,0.6}
  \definecolor{pink}{rgb}{1,.3,.9}
  \definecolor{paleyellow1}{rgb}{1,1,0.85}
  \definecolor{paleyellow2}{rgb}{1,1,0.95}
  \definecolor{gold}{rgb}{1,.8,.1}
  \definecolor{palegreen1}{rgb}{0.9,1,0.9}
  \definecolor{palegreen2}{rgb}{0.88,0.97,0.88}
%  \definecolor{paleblue1}{rgb}{0.9,0.92,1.0}
  \definecolor{paleblue1}{rgb}{0.91,0.96,1.0}
  \definecolor{paleblue2}{rgb}{0.9,0.92,0.97}
  \definecolor{paleyellow}{rgb}{1.0,1,0.95}
  \definecolor{DeepPink}{rgb}{1,0.078,0.576}
 
  \definecolor{gray10}{rgb}{.1,.1,.1}
  \definecolor{gray20}{rgb}{.2,.2,.2}
  \definecolor{gray30}{rgb}{.3,.3,.3}
  \definecolor{gray40}{rgb}{.4,.4,.4}
  \definecolor{gray45}{rgb}{.45,.45,.45}
  \definecolor{gray50}{rgb}{.5,.5,.5}
  \definecolor{gray60}{rgb}{.6,.6,.6}
  \definecolor{gray70}{rgb}{.7,.7,.7}
  \definecolor{gray80}{rgb}{.8,.8,.8}
  \definecolor{gray90}{rgb}{.9,.9,.9}
  \definecolor{gray98}{rgb}{.98,.98,.98}
  \definecolor{gray99}{rgb}{.99,.99,.99}

\newcommand{\changed}[1]{\textbf{\color{DeepPink}{#1}}}
\newcommand{\unhcolor}{\color{unhblue}}


\newcommand{\linewide}{0.8pt}
\renewcommand{\arraystretch}{1.0}
\renewcommand{\arrayrulewidth}{\linewide}
\newcommand{\colorfirst}{white}
\newcommand{\colornext}{white}
\rowcolors{3}{\colorfirst}{\colornext}
%\setlength{\tabcolsep}{-4.3pt}

\newcommand{\ec}{\color{darkgreen}}
\newcommand{\el}{\color{darkblue}}
\newcommand{\hilite}{\color{darkred}}
\newcommand{\Ss}{\textbf{\S}\hspace*{-0.2em} }
\newcommand{\Sb}[1]{\textbf{\S}\textbf{#1}:\hspace*{0.05em}}
%\newcommand{\Se}{$\circ$\;}
\newcommand{\Se}{;\;}
\newcommand{\tel}[1]{\textbf{\el {#1}}}

\newcommand{\Title}[1]{\vspace*{1.0em} \section*{\centering \unhcolor \LARGE {#1}}}
\newcommand{\Topic}[1]{\section*{\centering \unhcolor \large {#1}}}
\newcommand{\Subtopic}[1]{\section*{\color{gray20} {#1}}}

%\newcommand{\tfont}[1]{\texttt{\small \color{darkbrown} \textbf{#1}}}
\newcommand{\tfont}[1]{\texttt{\small \color{darkgreen} \textbf{#1}}}
\newcommand{\tfontw}[1]{\texttt{\small \color{darkbrown} \textbf{#1}}}

\font\fsbfontb  = ptmr scaled 980

%..............................................................................
\newcommand{\CAShead}{
\begin{center}
{\CharterFont{12}{14}
\textbf{\unhcolor \large
The University of New Haven \\
The College of Arts and Sciences \\
Department of Mathematics
 }
}
\end{center}
\setlength{\unitlength}{1in}
\begin{picture}(0.0,0.0)(0.0,0.0)
\includegraphics[scale=0.28]{./CASseal}
\end{picture}
%\begin{picture}(8.0,0.0)(-5.6,0.2)
%\includegraphics[scale=0.28]{./CASseal}
%\end{picture}
\vspace*{-1.8em}
\syllabusfontn
}
%..............................................................................

\newcommand{\LCAShead}{
\begin{center}
\end{center}
\setlength{\unitlength}{1in}
\begin{picture}(0.0,0.0)(0.0,0.0)
\includegraphics[scale=0.24]{./CASseal}
\end{picture}
\vspace*{-1.8em}
}





%..............................................................................
%\newcommand{\Heading}[2]{
%\CAShead
%\thispagestyle{plain}
%\pagestyle{fancy}
%\renewcommand{\headrulewidth}{0.0pt}
%%\fancyhead[LE,RO]{\sc{#1}}
%%\fancyhead[RE,LO]{\sc{Department of Mathematics Syllabus \hfil
%%                           The University  of New Haven}}
%\lfoot{\fsbfontb {#1}}
%\rfoot{\fsbfontb {#2}}
%\cfoot{\fsbfontb Page \thepage\hspace*{1pt} of \pageref{LastPage}}
%}
%..............................................................................

%\urlstyle{rm}
\urlstyle{sf}
%\urlstyle{tt}
%\makeatletter
%\def\url@foostyle{%
%  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\ttfamily}}}
%\makeatother
%\urlstyle{foo}
%\urlstyle{same}
\def\UrlBreaks{\do\.\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%no @
 \do\)\do\,\do\?\do\'\do+\do\=\do\#}%
\def\UrlBigBreaks{\do\/\do@url@hyp}%add /
\def\UrlSpecials{\do\/{\Url@slash}\do\ {\Url@space}\do\%{\Url@percent}\do\^^M{\Url@space}%
   \Url@force@Tilde}%
%\def\Url@slash{\@ifnextchar/{\kern-.11em\mathchar47\kern-.3em}%
%   {\kern-.1em\mathchar47\kern-.08em\penalty\UrlBigBreakPenalty}}
\def\Url@slash{\@ifnextchar/{\kern-.11em\mathchar47\kern-.15em}%
   {\kern-.05em\mathchar47\kern-.08em\penalty\UrlBigBreakPenalty}}
%
\newcommand{\Urls}[1]{
\href{#1}{\color{blue} \hspace{-0.5em} \url{#1}}}

\newcommand{\syllabusfontn}{\HelveticaFont{10.6}{14.8}}
\newcommand{\fontl}{\HelveticaFont{11.0}{16.8}}
\newcommand{\syllabusfonts}{\HelveticaFont{9.2}{12.8}}
\newcommand{\syllabusfontf}{\HelveticaFont{8.2}{10.8}}
\newcommand{\syllabusfontstable}{\syllabusfonts}
%\renewcommand{\mathrm}{\HelveticaFont{9.2}{12.8}}

\define@key{headers}{instructor}{\def\Instructor{#1}}
\define@key{headers}{phone}{\def\Phone{#1}}
\define@key{headers}{course}{\def\Course{#1}}
\define@key{headers}{coursecrosslist}{\def\Coursecrosslist{#1}}
\define@key{headers}{coursename}{\def\Coursename{#1}}
\define@key{headers}{revision}{\def\Revision{#1}}
\define@key{headers}{semester}{\def\Semester{#1}}
\define@key{headers}{office}{\def\Office{#1}}
\define@key{headers}{meetingtimes}{\def\Meetingtimes{#1}}
\define@key{headers}{classroom}{\def\Classroom{#1}}
\define@key{headers}{email}{\def\Email{#1}}
\define@key{headers}{officehours}{\def\Officehours{#1}}
\define@key{headers}{credits}{\def\Credits{#1}}
\define@key{headers}{addanddrop}{\def\Addanddrop{#1}}
\define@key{headers}{addanddropurl}{\def\AddanddropURL{#1}}
\define@key{headers}{addanddroppolicyurl}{\def\AddanddroppolicyURL{#1}}
\define@key{headers}{attendanceurl}{\def\AttendanceURL{#1}}
\define@key{headers}{undergraduatecalendarurl}{\def\UndergraduatecalendarURL{#1}}
\define@key{headers}{gradepolicyurl}{\def\GradepolicyURL{#1}}
\define@key{headers}{importantdatesurl}{\def\ImportantdatesURL{#1}}
\define@key{headers}{finalexamurl}{\def\FinalexamURL{#1}}
\define@key{headers}{integrityurl}{\def\IntegrityURL{#1}}
\define@key{headers}{courseworkurl}{\def\CourseworkURL{#1}}
\define@key{headers}{accessurl}{\def\AccessURL{#1}}
\define@key{headers}{semesterclasses}{\def\Semesterclasses{#1}}
\define@key{headers}{startsemesterclasses}{\def\Startsemesterclasses{#1}}
\define@key{headers}{endsemesterclasses}{\def\Endsemesterclasses{#1}}
\define@key{headers}{lastdropdate}{\def\Lastdropdate{#1}}
\define@key{headers}{semesterholidays}{\def\Semesterholidays{#1}}
\define@key{headers}{semesterfinalexam}{\def\Semesterfinalexam{#1}}


%\newcommand{\Heading}[2][]{%
\newcommand{\Heading}[1][]{%
 \setkeys{headers}{#1}
\CAShead
\thispagestyle{plain}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
%\fancyhead[LE,RO]{\sc{#1}}
%\fancyhead[RE,LO]{\sc{Department of Mathematics Syllabus \hfil
%                           The University  of New Haven}}
\lfoot{\fsbfontb {\Course}}
\rfoot{\fsbfontb {\Meetingtimes}}
}

\newcommand{\HHeading}[1][]{%
 \setkeys{headers}{#1}
\LCAShead
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
%\fancyhead[LE,RO]{\sc{#1}}
%\fancyhead[RE,LO]{\sc{Department of Mathematics Syllabus \hfil
%                           The University  of New Haven}}
\lfoot{\fsbfontb {\Course}}
\rfoot{\fsbfontb {\Semester, \, \Meetingtimes}}
}

\newcommand{\VHeading}[1][]{%
 \setkeys{headers}{#1}
\LCAShead
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.0pt}
%\fancyhead[LE,RO]{\sc{#1}}
%\fancyhead[RE,LO]{\sc{Department of Mathematics Syllabus \hfil
%                           The University  of New Haven}}
\lfoot{\fsbfontb {\Course}}
\rfoot{\fsbfontb {\Semester, \, \Meetingtimes}}
\cfoot{\fsbfontb Page \thepage}
}


\newcommand{\Coursehead}[2][]{%
% \setkeys{headers}{key={#1}}
 \setkeys{headers}{#1}
\noindent
\begin{tabular}{@{}lr}
\hspace*{3.3in} & \hspace*{3.3in} \\[2em]
\textbf{\unhcolor Course}: \Course & \textbf{\unhcolor Instructor Contact Information} \\
\textbf{\unhcolor Title}: \Coursename & \Instructor  \\
\textbf{\unhcolor Semester}: \Semester & \Office \\
\textbf{\unhcolor Meeting Times}: \Meetingtimes & \Phone \\
\textbf{\unhcolor Classroom}: \Classroom &  \Email \\
\textbf{\unhcolor Credit Hours}: \Credits &  \textbf{\unhcolor Office Hours}: \Officehours
\end{tabular}
}

\newcommand{\Assignmenthead}[2][]{%
 \setkeys{headers}{#1}
{
\syllabusfonts
\vspace*{-5.9em}
\section*{
\renewcommand{\thefootnote}{}
\unhcolor \hfill Assignments for \Course, \Coursename
\footnotetext[0]{\syllabusfonts \Instructor, \Office,\, \Phone,\, \Email. Office hours: \Officehours.},
 }
\section*{\unhcolor \hfill \Semester,\, \Meetingtimes,\, \Classroom} 
\vspace*{1.2cm}
}
}


\define@key{schedule}{day01}{\def\Dayaa{#1}}
\define@key{schedule}{day02}{\def\Dayab{#1}}
\define@key{schedule}{day03}{\def\Dayac{#1}}
\define@key{schedule}{day04}{\def\Dayad{#1}}
\define@key{schedule}{day05}{\def\Dayae{#1}}
\define@key{schedule}{day06}{\def\Dayaf{#1}}
\define@key{schedule}{day07}{\def\Dayag{#1}}
\define@key{schedule}{day08}{\def\Dayah{#1}}
\define@key{schedule}{day09}{\def\Dayai{#1}}
\define@key{schedule}{day10}{\def\Dayaj{#1}}
\define@key{schedule}{day11}{\def\Dayak{#1}}
\define@key{schedule}{day12}{\def\Dayal{#1}}
\define@key{schedule}{day13}{\def\Dayam{#1}}
\define@key{schedule}{day14}{\def\Dayan{#1}}
\define@key{schedule}{day15}{\def\Dayao{#1}}
\define@key{schedule}{day16}{\def\Dayap{#1}}
\define@key{schedule}{day17}{\def\Dayaq{#1}}
\define@key{schedule}{day18}{\def\Dayar{#1}}
\define@key{schedule}{day19}{\def\Dayas{#1}}
\define@key{schedule}{day20}{\def\Dayat{#1}}
\define@key{schedule}{day21}{\def\Dayau{#1}}
\define@key{schedule}{day22}{\def\Dayav{#1}}
\define@key{schedule}{day23}{\def\Dayaw{#1}}
\define@key{schedule}{day24}{\def\Dayax{#1}}
\define@key{schedule}{day25}{\def\Dayay{#1}}
\define@key{schedule}{day26}{\def\Dayaz{#1}}
\define@key{schedule}{day27}{\def\Dayba{#1}}
\define@key{schedule}{day28}{\def\Daybb{#1}}
\define@key{schedule}{day29}{\def\Daybc{#1}}
\define@key{schedule}{day30}{\def\Daybd{#1}}
\define@key{schedule}{day31}{\def\Daybe{#1}}
\define@key{schedule}{day32}{\def\Daybf{#1}}
\define@key{schedule}{day33}{\def\Daybg{#1}}
\define@key{schedule}{day34}{\def\Daybh{#1}}
\define@key{schedule}{day35}{\def\Daybi{#1}}
\define@key{schedule}{day36}{\def\Daybj{#1}}
\define@key{schedule}{day37}{\def\Daybk{#1}}
\define@key{schedule}{day38}{\def\Daybl{#1}}
\define@key{schedule}{day39}{\def\Daybm{#1}}
\define@key{schedule}{day40}{\def\Daybn{#1}}
\define@key{schedule}{day41}{\def\Daybo{#1}}
\define@key{schedule}{day42}{\def\Daybp{#1}}
\define@key{schedule}{day43}{\def\Daybq{#1}}
\define@key{schedule}{day44}{\def\Daybr{#1}}
\define@key{schedule}{day45}{\def\Daybs{#1}}
\define@key{schedule}{day46}{\def\Daybt{#1}}
\define@key{schedule}{day47}{\def\Daybu{#1}}
\define@key{schedule}{day48}{\def\Daybv{#1}}
\define@key{schedule}{day49}{\def\Daybw{#1}}



\define@key{schedule}{sec1}{\def\Secaa{#1}}
\define@key{schedule}{sec2}{\def\Secab{#1}}
\define@key{schedule}{sec3}{\def\Secac{#1}}
\define@key{schedule}{sec4}{\def\Secad{#1}}
\define@key{schedule}{sec5}{\def\Secae{#1}}
\define@key{schedule}{sec6}{\def\Secaf{#1}}
\define@key{schedule}{sec7}{\def\Secag{#1}}
\define@key{schedule}{sec8}{\def\Secah{#1}}
\define@key{schedule}{sec9}{\def\Secai{#1}}
\define@key{schedule}{sec10}{\def\Secaj{#1}}
\define@key{schedule}{sec11}{\def\Secak{#1}}
\define@key{schedule}{sec12}{\def\Secal{#1}}
\define@key{schedule}{sec13}{\def\Secam{#1}}
\define@key{schedule}{sec14}{\def\Secan{#1}}
\define@key{schedule}{sec15}{\def\Secao{#1}}
\define@key{schedule}{sec16}{\def\Secap{#1}}
\define@key{schedule}{sec17}{\def\Secaq{#1}}
\define@key{schedule}{sec18}{\def\Secar{#1}}
\define@key{schedule}{sec19}{\def\Secas{#1}}
\define@key{schedule}{sec20}{\def\Secat{#1}}
\define@key{schedule}{sec21}{\def\Secau{#1}}
\define@key{schedule}{sec22}{\def\Secav{#1}}
\define@key{schedule}{sec23}{\def\Secaw{#1}}
\define@key{schedule}{sec24}{\def\Secax{#1}}
\define@key{schedule}{sec25}{\def\Secay{#1}}
\define@key{schedule}{sec26}{\def\Secaz{#1}}
\define@key{schedule}{sec27}{\def\Secba{#1}}
\define@key{schedule}{sec28}{\def\Secbb{#1}}
\define@key{schedule}{sec29}{\def\Secbc{#1}}
\define@key{schedule}{sec30}{\def\Secbd{#1}}
\define@key{schedule}{sec31}{\def\Secbe{#1}}
\define@key{schedule}{sec32}{\def\Secbf{#1}}
\define@key{schedule}{sec33}{\def\Secbg{#1}}
\define@key{schedule}{sec34}{\def\Secbh{#1}}
\define@key{schedule}{sec35}{\def\Secbi{#1}}
\define@key{schedule}{sec36}{\def\Secbj{#1}}
\define@key{schedule}{sec37}{\def\Secbk{#1}}
\define@key{schedule}{sec38}{\def\Secbl{#1}}
\define@key{schedule}{sec39}{\def\Secbm{#1}}
\define@key{schedule}{sec40}{\def\Secbn{#1}}
\define@key{schedule}{sec41}{\def\Secbo{#1}}
\define@key{schedule}{sec42}{\def\Secbp{#1}}
\define@key{schedule}{sec43}{\def\Secbq{#1}}
\define@key{schedule}{sec44}{\def\Secbr{#1}}
\define@key{schedule}{sec45}{\def\Secbs{#1}}
\define@key{schedule}{sec46}{\def\Secbt{#1}}
\define@key{schedule}{sec47}{\def\Secbu{#1}}
\define@key{schedule}{sec48}{\def\Secbv{#1}}
\define@key{schedule}{sec49}{\def\Secbw{#1}}


\define@key{schedule}{wrk1}{\def\Wrkaa{#1}}
\define@key{schedule}{wrk2}{\def\Wrkab{#1}}
\define@key{schedule}{wrk3}{\def\Wrkac{#1}}
\define@key{schedule}{wrk4}{\def\Wrkad{#1}}
\define@key{schedule}{wrk5}{\def\Wrkae{#1}}
\define@key{schedule}{wrk6}{\def\Wrkaf{#1}}
\define@key{schedule}{wrk7}{\def\Wrkag{#1}}
\define@key{schedule}{wrk8}{\def\Wrkah{#1}}
\define@key{schedule}{wrk9}{\def\Wrkai{#1}}
\define@key{schedule}{wrk10}{\def\Wrkaj{#1}}
\define@key{schedule}{wrk11}{\def\Wrkak{#1}}
\define@key{schedule}{wrk12}{\def\Wrkal{#1}}
\define@key{schedule}{wrk13}{\def\Wrkam{#1}}
\define@key{schedule}{wrk14}{\def\Wrkan{#1}}
\define@key{schedule}{wrk15}{\def\Wrkao{#1}}
\define@key{schedule}{wrk16}{\def\Wrkap{#1}}
\define@key{schedule}{wrk17}{\def\Wrkaq{#1}}
\define@key{schedule}{wrk18}{\def\Wrkar{#1}}
\define@key{schedule}{wrk19}{\def\Wrkas{#1}}
\define@key{schedule}{wrk20}{\def\Wrkat{#1}}
\define@key{schedule}{wrk21}{\def\Wrkau{#1}}
\define@key{schedule}{wrk22}{\def\Wrkav{#1}}
\define@key{schedule}{wrk23}{\def\Wrkaw{#1}}
\define@key{schedule}{wrk24}{\def\Wrkax{#1}}
\define@key{schedule}{wrk25}{\def\Wrkay{#1}}
\define@key{schedule}{wrk26}{\def\Wrkaz{#1}}
\define@key{schedule}{wrk27}{\def\Wrkba{#1}}
\define@key{schedule}{wrk28}{\def\Wrkbb{#1}}
\define@key{schedule}{wrk29}{\def\Wrkbc{#1}}
\define@key{schedule}{wrk30}{\def\Wrkbd{#1}}
\define@key{schedule}{wrk31}{\def\Wrkbe{#1}}
\define@key{schedule}{wrk32}{\def\Wrkbf{#1}}
\define@key{schedule}{wrk33}{\def\Wrkbg{#1}}
\define@key{schedule}{wrk34}{\def\Wrkbh{#1}}
\define@key{schedule}{wrk35}{\def\Wrkbi{#1}}
\define@key{schedule}{wrk36}{\def\Wrkbj{#1}}
\define@key{schedule}{wrk37}{\def\Wrkbk{#1}}
\define@key{schedule}{wrk38}{\def\Wrkbl{#1}}
\define@key{schedule}{wrk39}{\def\Wrkbm{#1}}
\define@key{schedule}{wrk40}{\def\Wrkbn{#1}}
\define@key{schedule}{wrk41}{\def\Wrkbo{#1}}
\define@key{schedule}{wrk42}{\def\Wrkbp{#1}}
\define@key{schedule}{wrk43}{\def\Wrkbq{#1}}
\define@key{schedule}{wrk44}{\def\Wrkbr{#1}}
\define@key{schedule}{wrk45}{\def\Wrkbs{#1}}
\define@key{schedule}{wrk46}{\def\Wrkbt{#1}}
\define@key{schedule}{wrk47}{\def\Wrkbu{#1}}
\define@key{schedule}{wrk48}{\def\Wrkbv{#1}}
\define@key{schedule}{wrk49}{\def\Wrkbw{#1}}

\newcommand{\tableheaderl}{
\begin{longtable}{p{0.4cm}|p{1.6cm}|p{4cm}|p{11.2cm}}
\textbf{day} & \hspace*{0.8em} \textbf{date} & \hspace*{2.0em}  \textbf{reading or task} &  \hspace*{5.0em} \textbf{assignment due} \\
}
\newcommand{\tableheaders}{
\begin{longtable}{p{0.4cm}|p{1.6cm}|p{4cm}|p{9.2cm}}
\textbf{day} & \hspace*{0.8em} \textbf{date} & \hspace*{2.0em}  \textbf{reading or task} &  \hspace*{5.0em} \textbf{assignment due} \\
}
\newcommand{\tableheaderh}{
\begin{longtable}{p{0.4cm}|p{1.6cm}|p{4cm}|p{16.0cm}}
\textbf{day} & \hspace*{0.8em} \textbf{date} & \hspace*{2.0em}  \textbf{reading or task} &  \hspace*{12.0em} \textbf{assignment due} \\
}


\newcommand{\tableheader}{\tableheaderl}


\newcommand{\Schedule}[2][]{%
 \setkeys{schedule}{#1}
\setlength\LTleft{0pt}
\renewcommand{\arraystretch}{1.28}
\renewcommand{\colorfirst}{paleblue1}
\rowcolors{3}{\colorfirst}{\colornext}
\syllabusfontstable
\tableheader
\hline
\endhead
$01$ &\tel{\Dayaa} & \Secaa & \Wrkaa \\
$02$ &\tel{\Dayab} & \Secab & \Wrkab \\
$03$ &\tel{\Dayac} & \Secac & \Wrkac \\
$04$ &\tel{\Dayad} & \Secad & \Wrkad \\
$05$ &\tel{\Dayae} & \Secae & \Wrkae \\
$06$ &\tel{\Dayaf} & \Secaf & \Wrkaf \\
$07$ &\tel{\Dayag} & \Secag & \Wrkag \\
$08$ &\tel{\Dayah} & \Secah & \Wrkah \\
$09$ &\tel{\Dayai} & \Secai & \Wrkai \\
$10$ &\tel{\Dayaj} & \Secaj & \Wrkaj \\
$11$ &\tel{\Dayak} & \Secak & \Wrkak \\
$12$ &\tel{\Dayal} & \Secal & \Wrkal \\
$13$ &\tel{\Dayam} & \Secam & \Wrkam \\
$14$ &\tel{\Dayan} & \Secan & \Wrkan \\
$15$ &\tel{\Dayao} & \Secao & \Wrkao \\
%
$16$ &\tel{\Dayap} & \Secap & \Wrkap \\
$17$ &\tel{\Dayaq} & \Secaq & \Wrkaq \\
$18$ &\tel{\Dayar} & \Secar & \Wrkar \\
$19$ &\tel{\Dayas} & \Secas & \Wrkas \\
$20$ &\tel{\Dayat} & \Secat & \Wrkat \\
$21$ &\tel{\Dayau} & \Secau & \Wrkau \\
$22$ &\tel{\Dayav} & \Secav & \Wrkav \\
$23$ &\tel{\Dayaw} & \Secaw & \Wrkaw \\
$24$ &\tel{\Dayax} & \Secax & \Wrkax \\
$25$ &\tel{\Dayay} & \Secay & \Wrkay \\
$26$ &\tel{\Dayaz} & \Secaz & \Wrkaz \\
$27$ &\tel{\Dayba} & \Secba & \Wrkba \\
$28$ &\tel{\Daybb} & \Secbb & \Wrkbb \\
$29$ &\tel{\Daybc} & \Secbc & \Wrkbc \\
$30$ &\tel{\Daybd} & \Secbd & \Wrkbd \\
$31$ &\tel{\Daybe} & \Secbe & \Wrkbe \\
$32$ &\tel{\Daybf} & \Secbf & \Wrkbf \\
$33$ &\tel{\Daybg} & \Secbg & \Wrkbg
\end{longtable}
}

\newcommand{\ScheduleMWF}[2][]{%
 \setkeys{schedule}{#1}
\setlength\LTleft{0pt}
\renewcommand{\arraystretch}{1.28}
\renewcommand{\colorfirst}{paleblue1}
\rowcolors{3}{\colorfirst}{\colornext}
\syllabusfontstable
\tableheader
\hline
\endhead
$01$ &\tel{\Dayaa} & \Secaa & \Wrkaa \\
$02$ &\tel{\Dayab} & \Secab & \Wrkab \\
$03$ &\tel{\Dayac} & \Secac & \Wrkac \\
$04$ &\tel{\Dayad} & \Secad & \Wrkad \\
$05$ &\tel{\Dayae} & \Secae & \Wrkae \\
$06$ &\tel{\Dayaf} & \Secaf & \Wrkaf \\
$07$ &\tel{\Dayag} & \Secag & \Wrkag \\
$08$ &\tel{\Dayah} & \Secah & \Wrkah \\
$09$ &\tel{\Dayai} & \Secai & \Wrkai \\
$10$ &\tel{\Dayaj} & \Secaj & \Wrkaj \\
$11$ &\tel{\Dayak} & \Secak & \Wrkak \\
$12$ &\tel{\Dayal} & \Secal & \Wrkal \\
$13$ &\tel{\Dayam} & \Secam & \Wrkam \\
$14$ &\tel{\Dayan} & \Secan & \Wrkan \\
$15$ &\tel{\Dayao} & \Secao & \Wrkao \\
%
$16$ &\tel{\Dayap} & \Secap & \Wrkap \\
$17$ &\tel{\Dayaq} & \Secaq & \Wrkaq \\
$18$ &\tel{\Dayar} & \Secar & \Wrkar \\
$19$ &\tel{\Dayas} & \Secas & \Wrkas \\
$20$ &\tel{\Dayat} & \Secat & \Wrkat \\
$21$ &\tel{\Dayau} & \Secau & \Wrkau \\
$22$ &\tel{\Dayav} & \Secav & \Wrkav \\
$23$ &\tel{\Dayaw} & \Secaw & \Wrkaw \\
$24$ &\tel{\Dayax} & \Secax & \Wrkax \\
$25$ &\tel{\Dayay} & \Secay & \Wrkay \\
$26$ &\tel{\Dayaz} & \Secaz & \Wrkaz \\
$27$ &\tel{\Dayba} & \Secba & \Wrkba \\
$28$ &\tel{\Daybb} & \Secbb & \Wrkbb \\
$29$ &\tel{\Daybc} & \Secbc & \Wrkbc \\
$30$ &\tel{\Daybd} & \Secbd & \Wrkbd \\
%
$31$ &\tel{\Daybe} & \Secbe & \Wrkbe \\
$32$ &\tel{\Daybf} & \Secbf & \Wrkbf \\
$33$ &\tel{\Daybg} & \Secbg & \Wrkbg \\
$34$ &\tel{\Daybh} & \Secbh & \Wrkbh \\
$35$ &\tel{\Daybi} & \Secbi & \Wrkbi \\
$36$ &\tel{\Daybj} & \Secbj & \Wrkbj \\
$37$ &\tel{\Daybk} & \Secbk & \Wrkbk \\
$38$ &\tel{\Daybl} & \Secbl & \Wrkbl \\
$39$ &\tel{\Daybm} & \Secbm & \Wrkbm \\
$40$ &\tel{\Daybn} & \Secbn & \Wrkbn \\
$41$ &\tel{\Daybo} & \Secbo & \Wrkbo \\
$42$ &\tel{\Daybp} & \Secbp & \Wrkbp \\
$43$ &\tel{\Daybq} & \Secbq & \Wrkbq \\
$44$ &\tel{\Daybr} & \Secbr & \Wrkbr \\
$45$ &\tel{\Daybs} & \Secbs & \Wrkbs \\
%
$46$ &\tel{\Daybt} & \Secbt & \Wrkbt \\
$47$ &\tel{\Daybu} & \Secbu & \Wrkbu \\
$48$ &\tel{\Daybv} & \Secbv & \Wrkbv \\
$49$ &\tel{\Daybw} & \Secbw & \Wrkbw 
\end{longtable}
}


\newcommand{\HSchedule}[2][]{%
 \setkeys{schedule}{#1}
\setlength\LTleft{0pt}
\renewcommand{\arraystretch}{1.5}
\renewcommand{\colorfirst}{paleblue1}
\rowcolors{3}{\colorfirst}{\colornext}
\syllabusfontl
\tableheaderh
\hline
\endhead
$01$ &\tel{\Dayaa} & \Secaa & \Wrkaa \\
$02$ &\tel{\Dayab} & \Secab & \Wrkab \\
$03$ &\tel{\Dayac} & \Secac & \Wrkac \\
$04$ &\tel{\Dayad} & \Secad & \Wrkad \\
$05$ &\tel{\Dayae} & \Secae & \Wrkae \\
$06$ &\tel{\Dayaf} & \Secaf & \Wrkaf \\
$07$ &\tel{\Dayag} & \Secag & \Wrkag \\
$08$ &\tel{\Dayah} & \Secah & \Wrkah \\
$09$ &\tel{\Dayai} & \Secai & \Wrkai \\
$10$ &\tel{\Dayaj} & \Secaj & \Wrkaj \\
$11$ &\tel{\Dayak} & \Secak & \Wrkak \\
$12$ &\tel{\Dayal} & \Secal & \Wrkal \\
$13$ &\tel{\Dayam} & \Secam & \Wrkam \\
$14$ &\tel{\Dayan} & \Secan & \Wrkan \\
$15$ &\tel{\Dayao} & \Secao & \Wrkao \\
%
$16$ &\tel{\Dayap} & \Secap & \Wrkap \\
$17$ &\tel{\Dayaq} & \Secaq & \Wrkaq \\
$18$ &\tel{\Dayar} & \Secar & \Wrkar \\
$19$ &\tel{\Dayas} & \Secas & \Wrkas \\
$20$ &\tel{\Dayat} & \Secat & \Wrkat \\
$21$ &\tel{\Dayau} & \Secau & \Wrkau \\
$22$ &\tel{\Dayav} & \Secav & \Wrkav \\
$23$ &\tel{\Dayaw} & \Secaw & \Wrkaw \\
$24$ &\tel{\Dayax} & \Secax & \Wrkax \\
$25$ &\tel{\Dayay} & \Secay & \Wrkay \\
$26$ &\tel{\Dayaz} & \Secaz & \Wrkaz \\
$27$ &\tel{\Dayba} & \Secba & \Wrkba \\
$28$ &\tel{\Daybb} & \Secbb & \Wrkbb \\
$29$ &\tel{\Daybc} & \Secbc & \Wrkbc \\
$30$ &\tel{\Daybd} & \Secbd & \Wrkbd \\
$31$ &\tel{\Daybe} & \Secbe & \Wrkbe \\
$32$ &\tel{\Daybf} & \Secbf & \Wrkbf \\
$33$ &\tel{\Daybg} & \Secbg & \Wrkbg
\end{longtable}
}


\newcommand{\HScheduleMWF}[2][]{%
 \setkeys{schedule}{#1}
\setlength\LTleft{0pt}
\renewcommand{\arraystretch}{1.28}
\renewcommand{\colorfirst}{paleblue1}
\rowcolors{3}{\colorfirst}{\colornext}
\syllabusfontstable
\tableheader
\hline
\endhead
$01$ &\tel{\Dayaa} & \Secaa & \Wrkaa \\
$02$ &\tel{\Dayab} & \Secab & \Wrkab \\
$03$ &\tel{\Dayac} & \Secac & \Wrkac \\
$04$ &\tel{\Dayad} & \Secad & \Wrkad \\
$05$ &\tel{\Dayae} & \Secae & \Wrkae \\
$06$ &\tel{\Dayaf} & \Secaf & \Wrkaf \\
$07$ &\tel{\Dayag} & \Secag & \Wrkag \\
$08$ &\tel{\Dayah} & \Secah & \Wrkah \\
$09$ &\tel{\Dayai} & \Secai & \Wrkai \\
$10$ &\tel{\Dayaj} & \Secaj & \Wrkaj \\
$11$ &\tel{\Dayak} & \Secak & \Wrkak \\
$12$ &\tel{\Dayal} & \Secal & \Wrkal \\
$13$ &\tel{\Dayam} & \Secam & \Wrkam \\
$14$ &\tel{\Dayan} & \Secan & \Wrkan \\
$15$ &\tel{\Dayao} & \Secao & \Wrkao \\
%
$16$ &\tel{\Dayap} & \Secap & \Wrkap \\
$17$ &\tel{\Dayaq} & \Secaq & \Wrkaq \\
$18$ &\tel{\Dayar} & \Secar & \Wrkar \\
$19$ &\tel{\Dayas} & \Secas & \Wrkas \\
$20$ &\tel{\Dayat} & \Secat & \Wrkat \\
$21$ &\tel{\Dayau} & \Secau & \Wrkau \\
$22$ &\tel{\Dayav} & \Secav & \Wrkav \\
$23$ &\tel{\Dayaw} & \Secaw & \Wrkaw \\
$24$ &\tel{\Dayax} & \Secax & \Wrkax \\
$25$ &\tel{\Dayay} & \Secay & \Wrkay \\
$26$ &\tel{\Dayaz} & \Secaz & \Wrkaz \\
$27$ &\tel{\Dayba} & \Secba & \Wrkba \\
$28$ &\tel{\Daybb} & \Secbb & \Wrkbb \\
$29$ &\tel{\Daybc} & \Secbc & \Wrkbc \\
$30$ &\tel{\Daybd} & \Secbd & \Wrkbd \\
%
$31$ &\tel{\Daybe} & \Secbe & \Wrkbe \\
$32$ &\tel{\Daybf} & \Secbf & \Wrkbf \\
$33$ &\tel{\Daybg} & \Secbg & \Wrkbg \\
$34$ &\tel{\Daybh} & \Secbh & \Wrkbh \\
$35$ &\tel{\Daybi} & \Secbi & \Wrkbi \\
$36$ &\tel{\Daybj} & \Secbj & \Wrkbj \\
$37$ &\tel{\Daybk} & \Secbk & \Wrkbk \\
$38$ &\tel{\Daybl} & \Secbl & \Wrkbl \\
$39$ &\tel{\Daybm} & \Secbm & \Wrkbm \\
$40$ &\tel{\Daybn} & \Secbn & \Wrkbn \\
$41$ &\tel{\Daybo} & \Secbo & \Wrkbo \\
$42$ &\tel{\Daybp} & \Secbp & \Wrkbp \\
$43$ &\tel{\Daybq} & \Secbq & \Wrkbq \\
$44$ &\tel{\Daybr} & \Secbr & \Wrkbr \\
$45$ &\tel{\Daybs} & \Secbs & \Wrkbs \\
%
$46$ &\tel{\Daybt} & \Secbt & \Wrkbt \\
$47$ &\tel{\Daybu} & \Secbu & \Wrkbu \\
$48$ &\tel{\Daybv} & \Secbv & \Wrkbv \\
$49$ &\tel{\Daybw} & \Secbw & \Wrkbw
\end{longtable}
}




\newcommand{\Quote}[1]{
\parbox[t]{16cm}{
\syllabusfonts
{#1}
}
}


\endinput
%%
%% End of file `CAS_syllabus.cls'.
