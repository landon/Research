\newcommand \journalacronym{dmgt}
\newcommand \JOURNALACRONYM{DMGT }
\newcommand \volumetitle{Graph Theory}
\newcommand \fullvolumetitle{Discussiones Mathematicae Graph Theory}


%\def \fileversion{v 1.00}
%\def \filedate{2010/06/11}

%updated 2010-11-08
\def \fileversion{v 1.01}
\def \filedate{2010/11/08}

\def \docdate{\filedate}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\journalacronym}[\filedate \space \fileversion \space \JOURNALACRONYM Paper class]


\newif\if@thmsec
\@thmsecfalse
\newif\if@dntnbr
\@dntnbrfalse
\newif\if@note
\@notefalse
\newif\if@prblcol
\@prblcolfalse

\newif\if@nolinenbrs
\@nolinenbrsfalse


\DeclareOption{thmsec}{\@thmsectrue}
\DeclareOption{dntnbr}{\@dntnbrtrue}
\DeclareOption{note}{\@notetrue}
\DeclareOption{prblcol}{\@prblcoltrue}
\DeclareOption{nolinenbrs}{\@nolinenbrstrue}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\DeclareOption*{\ClassWarningNoLine{\journalacronym}{Unknown option `\CurrentOption'}}
\ProcessOptions

\LoadClass[leqno,twoside,11pt]{article}

\pagestyle{myheadings}

\setlength{\textheight}{19.8cm}
\setlength{\textwidth}{13.5cm}
\setlength{\oddsidemargin}{1.2cm}
\setlength{\evensidemargin}{1.2cm}
\setlength{\topmargin}{1.65cm} 

\def\startpage{1}
\def\volnbr{xx}
\def\volyear{xxxx}


\usepackage{section}
\usepackage{amsthm}
\usepackage[overload]{textcase}
\usepackage{setspace}
\usepackage{amssymb}
\usepackage{lineno}
\usepackage{ifthen}

\secpreskp2.0\baselineskip plus .05\baselineskip minus.05\baselineskip
\secpreskp-\secpreskp
\subpreskp1.0\baselineskip plus .05\baselineskip minus.05\baselineskip

\def\section{\@startsection{section}{\@ne}{\secindent}{\secpreskp}{\secpstskp}{\sc\centering}}
\def\subsection{\@startsection{subsection}{\tw@}{\subindent}{\subpreskp}{\subpstskp}{\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\subindent}{\subpreskp}{\subpstskp}{\bf}}
%\def\paragraph{\@startsection{paragraph}{4}{\subindent}{\subpreskp}{\parpstskp}{\small\hdfnt}}
%\def\subparagraph{\@startsection{subparagraph}{5}{\parindent}{\subpreskp}{\parpstskp}{\smallsize}} 


\def\hddot{.} % after inline headings, theorems etc
\def\cpdot{.} % in figure/table captions - also apears in list of figures
\def\nmdot{.} % after section numbers etc

\def\fnum@figure{\small{\figurename~\thefigure\cpdot}}
\def\fnum@table{\small{\tablename~\thetable\cpdot}}


% regular proof end
\def\proofendx{\hfill\rule{2mm}{2mm}}

% nested proof end
\def\proofendy{\whiteged}

%\newtheoremstyle{stylename}% name of the style to be used
%  {spaceabove}% measure of space to leave above the theorem. E.g.: 3pt
%  {spacebelow}% measure of space to leave below the theorem. E.g.: 3pt
%  {bodyfont}% name of font to use in the body of the theorem
%  {indent}% measure of space to indent
%  {headfont}% name of head font
%  {headpunctuation}% punctuation between head and body
%  {headspace}% space after theorem head; " " = normal interword space
%  {headspec}% Manually specify head


%% komendy z amsthm odpowiadaj¹ce za wygl¹d nag³ówka twierdzenia
\def\thmhead@plain#1#2#3{%
  \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }\@upn{#2}}%
  \thmnote{ {\the\thm@notefont{#3}}}}
\let\thmhead\thmhead@plain
\def\swappedhead#1#2#3{%
  \thmnumber{#2}%
  \thmname{\@ifnotempty{#2}{~}#1}%
  \thmnote{ {\the\thm@notefont{#3}}}}
\let\swappedhead@plain=\swappedhead



%\newcommand{\whiteged}{\hfill$\square$}
\newcommand{\whiteged}{\hfill\framebox[2.1mm][2mm]{}}
%% komenda z amsthm odpowiadaj¹ca za œrodowisko proof
%% przedefiniowana tak, aby zawsze tekst by³ wyœwietlany
%% podgrubionym italikiem
\renewenvironment{proof}[1][\proofname]{\par
  \ifnum \theproofcount>0 \pushQED{\proofendy} \else \pushQED{\proofendx} \fi%
  \refstepcounter{proofcount}
  %
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \itshape
    {\bf\em #1\@addpunct{.}}]\ignorespaces
}{%
  \addtocounter{proofcount}{-1}
  \popQED\endtrivlist\@endpefalse
}

\theoremstyle{plain}

\if@thmsec
  	\newtheorem{theorem}{Theorem}[section]
\else
   \newtheorem{theorem}{Theorem}
\fi


\newtheorem{claim}[theorem]{Claim}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{prop}[theorem]{Proposition}
\newtheorem{obs}[theorem]{Observation}
\newtheorem{cor}[theorem]{Corollary}
\newtheorem{con}[theorem]{Conjecture}


\theoremstyle{definition}

\if@dntnbr
  \newtheorem{dnt}[theorem]{Definition}
\else
  \newtheorem*{dnt}{Definition}
\fi


%\theoremstyle{remark}
\newtheorem{exm}[theorem]{Example}
\newtheorem{rem}[theorem]{Remark}
\newtheorem{note}[theorem]{Note}
\newtheorem{prb}[theorem]{Problem}

\def\title#1{%
  \def\@@papertitle{#1}
  \def\@papertitle{\uppercase{#1}}
  \@ifnextchar [{\@xtitle}{\@@xtitle}
}

\def\@xtitle[#1]{%
   \def\@sectitle{\sc #1}
}

\def\@@xtitle{%
   \def\@sectitle{\sc \@@papertitle}   
}

\def\keywords#1{\def\@keywords{#1}}
\def\classnbr#1{\def\@classnbr{#1}}


\def\@keywords{no keywords}
\def\@classnbr{no numbers}


\newcounter{author}  %%  tworzy licznik o nazwie 'theauthor'
\newcounter{inside}  %%  tworzy wewnetrzny licznik do innych wyliczen
\newcounter{proofcount} %% liczymy poziom zabg³êbieia dowodów

%% dodaje nowego autora definiujac:
%%    - authornameI
%%    - shortnameI
%%    - authorfromI
%% gdzie I jest kolejnym numerem

\def\newauthor#1#2#3{%
  \refstepcounter{author}
  \@namedef{authorname\theauthor}{#1}
  \@namedef{shortname\theauthor}{#2}
  \@namedef{authorfrom\theauthor}{#3}
  \@ifnextchar [{\@addemail}{\@@addemail}
}

\def\@addemail[#1]{%
  \@namedef{emailok\theauthor}{1}
  \@namedef{email\theauthor}{#1}
}

\def\@@addemail{%
  \@namedef{emailok\theauthor}{0}
  \@namedef{email\theauthor}{}
}

%% dodanie tuty³u pracy
\def\papertitle#1{%
  \def\@@papertitle{#1}
  \def\@papertitle{\uppercase{#1}}
  \@ifnextchar [{\@xtitle}{\@@xtitle}
}

\def\@xtitle[#1]{%
   \def\@sectitle{\sc #1}
}

\def\@@xtitle{%
   \def\@sectitle{\sc \@@papertitle}   
}


%%
%% wyswietla dane o autorach w odpowiedniej formie
%%

\def\authors{%
 \ifnum \theauthor < 1
    \typeout{Authors undefined}
 \else
   \setcounter{inside}{1}
   \par
   \@whilenum \theinside < \theauthor \do{%
     \normalsize
     {\noindent\sc
       \begin{spacing}{1.7}
         \@nameuse{authorname\theinside}
       \end{spacing}
     }  
     \par
%     \smallskip        
     {\noindent \small\it \@nameuse{authorfrom\theinside}}\\
     \ifnum \@nameuse{emailok\theinside} > 0
        \smallskip
        \noindent 
        \small         
        {\bf e-mail:} \hspace{-3mm}
        {\rm
           \begin{tabular}[t]{l}
             \@nameuse{email\theinside}
           \end{tabular}   
        }  
     \fi
     \refstepcounter{inside}
   }
   \ifnum \theauthor>1     
     \noindent
     \bigskip
     \normalsize
     \par 
     {\sc and} \\
     \smallskip
   \else
     \bigskip
   \fi
   \normalsize
   {\noindent\sc
     \begin{spacing}{1.7}
       \@nameuse{authorname\theinside}
     \end{spacing}
   }
   \par
   \small
   {\noindent \small\it \@nameuse{authorfrom\theinside}}\\
   \par
   \ifnum \@nameuse{emailok\theinside} > 0
      \smallskip
      \noindent 
      \small 
      {\bf e-mail:} \hspace{-3mm}
      {\rm
         \begin{tabular}[t]{l}
           \@nameuse{email\theinside}
         \end{tabular}   
      }  
   \fi
 \fi
 \normalsize \rm
}


%% nazwiska umieszczane w naglowku strony
%% UWAGA: jest to komenda "krucha" i przy jej uzyciu zaleca sie
%% stosowanie komendy \protect, np. w komendzie \markboth
\def\authornames{%
 \ifnum \theauthor < 1
    \typeout{Authors undefined}
 \else
   \setcounter{inside}{1}
     \@whilenum \theinside < \theauthor \do{%
      \@nameuse{shortname\theinside}\refstepcounter{inside}\ifnum\theinside<\theauthor{, }\fi
     }
     \ifnum \theauthor>1{and} \fi
     \@nameuse{shortname\theinside}
 \fi
 \normalsize \rm
}


\def\endabstract{%
\par
\smallskip
\noindent
{\bf Keywords:\ }\@keywords. \
\par
\smallskip
\noindent
{\bf 2010 Mathematics Subject Classification:\ }\@classnbr.
\if@twocolumn\else\endquotation\fi\medskip}


\AtBeginDocument{%
\if@nolinenbrs \else \linenumbers \fi
\thispagestyle{empty}
\pagestyle{myheadings}
\setcounter{page}{\startpage}
\vspace*{-1.8cm}
\if@prblcol
\begin{sc}
\noindent Problems Column
\end{sc}
\vspace*{0.8cm}
\par
\fi
\begin{sl}
\noindent Discussiones Mathematicae \\
\noindent \volumetitle{} \volnbr{} {\rm (}\volyear{}\/{\rm )} \thepage--\pageref{@lastpage}
\end{sl}
\begin{center}
\if@note{
\vspace*{0.2cm}
\begin{sc}
\noindent Note
\end{sc}
\vspace*{0.6cm}
\par
}
\else
\vspace*{1.7cm}
\fi
{\large\bf\@papertitle}
\medskip
\authors
\medskip
\end{center}
\markboth{\sc \protect\authornames}{\sc {\@sectitle}}
\setlength{\parindent}{20pt}
}

\AtEndDocument{%
  \label{@lastpage}
%% mo¿emy dodawaæ automatem pust¹ stronê, je¿eli ostatnia jest nieparzysta
\ifthenelse{\isodd\thepage}{%
  \message{Warning: trailing empty page added to end on an even numbered page}%
  \newpage
  \thispagestyle{empty}
  \ 
  }{}
}


\newcommand{\setarticle}[3]{
\def\startpage{#1}
\def\volnbr{#2}
\def\volyear{#3}
}


\def\trimx#1{\ignorespaces#1\unskip} 

%\bibitemart{#1=name}{#2=authors}{#3=title}{#4=czasopismo}{#5=wolumen}{#6=rok}{#7=strony}
\newcommand{\bibitemart}[7]{\bibitem{#1} \trimx{#2}, {\it \trimx{#3}}\/, \trimx{#4} {\bf \trimx{#5}} (\trimx{#6}) \trimx{#7}.}
%\bibitembook{#1=name}{#2=authors}{#3=title}{#4=publisher}{#5=year}
\newcommand{\bibitembook}[5]{\bibitem{#1} \trimx{#2}, \trimx{#3} (\trimx{#4}, \trimx{#5}).}
%\bibitemproc{#1=name}{#2=authors}{#3=title}{#4=procname}{#5=editors}{#6=publisher}{#7=rok}{#8=strony}
\newcommand{\bibitemproc}[8]{\bibitem{#1} \trimx{#2}, {\it \trimx{#3}}\/, in: \trimx{#4}, ed(s), \trimx{#5} (\trimx{#6}, \trimx{#7}) \trimx{#8}.}


%% przeniesione od pani Izy
\def\thebibliography#1{\begin{center}
{{\sc References}\vspace{-.3em}\vspace{0pt}}
\end{center}
\list{[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin
\labelwidth
\advance\leftmargin\labelsep
\usecounter{enumi}}
\def\newblock{\hskip .11em plus .33em minus .07em}
\sloppy\clubpenalty4000\widowpenalty4000
\sfcode`\.=1000\relax}

%%%%%%%%%%%%%%%%%%%%
%% todo ??????
%%%%%%%%%%%%%%%%%%%%


\footskip=30pt \vspace{5cm}
\renewcommand{\thefootnote}{\arabic{footnote}}