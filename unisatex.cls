\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unisatex}[2026/06/26 v0.1 UniSATeX conference template based on IEEEtran]

% Institutional wrapper over IEEEtran.
% Keep IEEEtran.cls unchanged and place UniSATeX customizations here.
\newif\ifunisatexarial
\newif\ifunisatextimes

\DeclareOption{arial}{\unisatexarialtrue\unisatextimesfalse}
\DeclareOption{times}{\unisatexarialfalse\unisatextimestrue}
\DeclareOption{timesnewroman}{\unisatexarialfalse\unisatextimestrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{IEEEtran}}
\ExecuteOptions{conference,times}
\ProcessOptions\relax
\LoadClass{IEEEtran}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[brazilian,english]{babel}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{cite}
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage[scale=0.92]{tgheros}
\RequirePackage{xcolor}
\RequirePackage{url}

\ifunisatexarial
  \renewcommand{\rmdefault}{qhv}
  \renewcommand{\sfdefault}{qhv}
  \renewcommand{\familydefault}{\sfdefault}
  \AtBeginDocument{\fontdimen2\font=0.30em\relax}
\else
  \renewcommand{\rmdefault}{ptm}
  \renewcommand{\sfdefault}{qhv}
  \renewcommand{\familydefault}{\rmdefault}
\fi
\normalfont\selectfont

\definecolor{unisatexblue}{RGB}{0,79,159}
\definecolor{unisatexgray}{RGB}{80,80,80}

\renewcommand{\IEEEkeywordsname}{Palavras-chave}
\renewcommand{\abstractname}{Resumo}
\AtBeginDocument{\selectlanguage{brazilian}}

\makeatletter

\newcommand{\unisatexoverridecommandlockouts}{\IEEEoverridecommandlockouts}
\newcommand{\unisatexauthorblockN}[1]{\IEEEauthorblockN{#1}}
\newcommand{\unisatexauthorblockA}[1]{\IEEEauthorblockA{#1}}
\newcommand{\unisatexinstitution}[1]{\def\@unisatexinstitution{#1}}
\newcommand{\unisatexcourse}[1]{\def\@unisatexcourse{#1}}
\newcommand{\unisatexdepartment}[1]{\def\@unisatexdepartment{#1}}
\newcommand{\unisatexlocation}[1]{\def\@unisatexlocation{#1}}
\newcommand{\unisatexevent}[1]{\def\@unisatexevent{#1}}

\def\@unisatexinstitution{Centro Universitário UniSATC}
\def\@unisatexcourse{}
\def\@unisatexdepartment{}
\def\@unisatexlocation{Criciúma, Brasil}
\def\@unisatexevent{}

\newcommand{\unisatexauthor}[2]{
  \IEEEauthorblockN{#1}
  \IEEEauthorblockA{
    \ifx\@unisatexdepartment\@empty\else\textit{\@unisatexdepartment}\\\fi
    \ifx\@unisatexcourse\@empty\else\textit{\@unisatexcourse}\\\fi
    \textit{\@unisatexinstitution}\\
    \@unisatexlocation\\
    #2
  }
}

\newcommand{\unisatexsubtitle}[1]{\\{\footnotesize #1}}

\def\ps@IEEEtitlepagestyle{
  \def\@oddhead{\hfil\textcolor{unisatexblue}{\@unisatexinstitution}\hfil}
  \def\@evenhead{\@oddhead}
  \def\@oddfoot{\hfil\thepage\hfil}
  \def\@evenfoot{\@oddfoot}
}

\newenvironment{keywords}{\begin{IEEEkeywords}}{\end{IEEEkeywords}}
\makeatother

\def\BibTeX{{\rm B\kern-.05em{\sc i\kern-.025em b}\kern-.08em
    T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}

\endinput