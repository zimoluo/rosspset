\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rosspset}[2023/07/25 RossPSet]

\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}

\ProcessOptions\relax

\LoadClass{article}

\RequirePackage{amsmath}
\RequirePackage{enumitem}
\RequirePackage{amsthm}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{lipsum}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{tikz}
\RequirePackage{asymptote}
\RequirePackage{mathtools}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{xcolor}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{thmtools}
\RequirePackage[most]{tcolorbox}
\RequirePackage{hyperref}
\RequirePackage{nopageno}

\setlength{\parindent}{0pt}
\setstretch{1.0}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    citecolor=black,
    linktoc=all
}

\usetikzlibrary{arrows,scopes,positioning,cd,calc}

\definecolor{pgreen}{HTML}{047101}
\definecolor{pred}{HTML}{FF634D}
\definecolor{pblue}{HTML}{0376BB}
\definecolor{plightgreen}{HTML}{D0FFB8}
\definecolor{plightblue}{HTML}{B3E2FF}
\definecolor{plightred}{HTML}{FE968D}
\definecolor{pyellow}{HTML}{F7BA00}
\definecolor{psilver}{HTML}{D5D5D5}
\definecolor{plightgray}{HTML}{929292}
\definecolor{pgray}{HTML}{929292}
\definecolor{pblack}{HTML}{000000}
\definecolor{pwhite}{HTML}{FFFFFF}
\definecolor{porange}{HTML}{FF9400}
\definecolor{pmagenta}{HTML}{EE5FA7}
\definecolor{plightorange}{HTML}{F9CB9C}
\definecolor{pgold}{HTML}{EFB219}
\definecolor{plavender}{HTML}{F4BBFF}
\definecolor{psalmon}{HTML}{FA8072}
\definecolor{pdarkred}{HTML}{CC4125}
\definecolor{pshadegreen}{HTML}{8DAF8B}
\definecolor{pbluegreen}{HTML}{2FAE94}
\definecolor{pmidblue}{HTML}{6EB8E0}
\definecolor{pviolet}{HTML}{A868BD}
\definecolor{pvioletred}{HTML}{BD6284}
\definecolor{pyellowgreen}{HTML}{B7C635}
\definecolor{pdarkskin}{HTML}{C6A47C}
\definecolor{pdarkblue}{HTML}{0052C6}
\definecolor{pdustyellow}{HTML}{C69423}

\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\ord}{ord}
\DeclareMathOperator{\Ker}{ker}
\DeclareMathOperator{\kernel}{ker}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\Mor}{Mor}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\im}{im}

% Ross problems use mathbf instead of mathbb for some reason
\newcommand{\C}{\mathbf{C}}
\newcommand{\N}{\mathbf{N}}
\newcommand{\Q}{\mathbf{Q}}
\newcommand{\R}{\mathbf{R}}
\newcommand{\U}{\mathbf{U}}
\newcommand{\Z}{\mathbf{Z}}
\newcommand{\Zplus}{\mathbb{Z}^{+}}
\newcommand{\Line}{\mathcal{L}}

\newcommand{\disfrac}[2]{\displaystyle\frac{#1}{#2}}

\providecommand{\forcedisfrac}{
  \ifdefined\oldfrac\relax
    \renewcommand{\frac}[2]{\displaystyle\oldfrac{##1}{##2}}%
  \else
    \let\oldfrac\frac
    \renewcommand{\frac}[2]{\displaystyle\oldfrac{##1}{##2}}%
  \fi
}

\newcommand{\bracket}[1]{\left[#1\right]}
\newcommand{\curlybracket}[1]{\left\{#1\right\}}
\newcommand{\parenthesis}[1]{\left(#1\right)}
\newcommand{\paren}[1]{\parenthesis{#1}}
\newcommand{\vertlines}[1]{\left\lvert#1\right\rvert}
\newcommand{\legendre}[2]{\parenthesis{\frac{#1}{#2}}}

\newcommand{\vecdouble}[2]{\displaystyle\begin{bmatrix}#1 \\ #2 \end{bmatrix}}
\newcommand{\vecd}[2]{\vecdouble{#1}{#2}}
\newcommand{\vectriple}[3]{\displaystyle\begin{bmatrix}#1 \\ #2 \\ #3 \end{bmatrix}}
\newcommand{\vect}[3]{\vectriple{#1}{#2}{#3}}

\geometry{left = 1in, right = 1in, top = 0.6in, bottom = 0.6in, a4paper, portrait}

\newcommand{\psetnum}[1]{\gdef\@psetnum{#1}}

\newcommand{\organization}[1]{\gdef\@organization{#1}}
\renewcommand{\author}[1]{\organization{#1}}
    
\newcommand{\titlequote}[1]{\gdef\@titlequote{#1}}
\newcommand{\quotesource}[1]{\gdef\@quotesource{#1}}

\title{\@ifundefined{title}{}{\@title}}
\def\title#1{\gdef\@title{#1}\gdef\thistitle{#1}}

\renewcommand{\@maketitle}{
  \newpage
  \null
  \begin{center}
  \vspace{-1.25em}
    \ifx\@psetnum\undefined
      {\sffamily\bfseries{\@title} \par}
    \else
      {\sffamily\bfseries{Set {\#\@psetnum}} \par}
    \fi
    \ifx\@organization\undefined
      {Ross Mathematics, Number Theory}
    \else
      {\large\MakeUppercase{\@solver}}
    \fi\par
    \ifx\@titlequote\undefined
        {}
    \else
        {\itshape\@titlequote}
        \ifx\@quotesource\undefined
        {}
        \else
        {-- \@quotesource}
        \fi
    \fi
  \end{center}
  \par
}

\pagestyle{empty}
\fancyhf{} 
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt} 

\newcommand{\sectionheader}[1]{\par\noindent{\sffamily\textbf{#1}}\titlerule[0.025pc]\par}

\newcommand{\exploration}{\sectionheader{Exploration}}
\newcommand{\podasip}{\sectionheader{Podasip}}
\newcommand{\numerical}{\sectionheader{Numerical}}

\newcounter{problemnum}

\newenvironment{problem}{
  \vspace{-0.25em}
  \begin{enumerate}[label=\sffamily\textbf{\theproblemnum.}, left=0pt]
  \refstepcounter{problemnum}
  \item
}{
  \end{enumerate}
  \vspace{-0.25em}
}

\newenvironment{terminology}{
Here are some terminology questions to discuss with your family:
  \begin{itemize}[label=--]
}{
  \end{itemize}
}

\newenvironment{subproblem}{
  \begin{enumerate}[label=(\alph*)]
}{
  \end{enumerate}
}

\newcommand{\ensuredisplaymath}{
    \everymath{\displaystyle}
}

\newcommand{\hint}[1]{
    {\small [#1]}
}


\endinput
