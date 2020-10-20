\ProvidesClass{luger-cv}[2017/11/02 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{ifthen}
\RequirePackage{graphicx}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage[dvipsnames]{xcolor}

\definecolor{numcolor}{rgb}{0.5,0.5,0.5}
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{linkblue}{rgb}{0.37, 0.62, 0.63} %{RGB}{10,82,131}
\definecolor{lightgray}{HTML}{777777}
\definecolor{notlink}{rgb}{0.33, 0.41, 0.47} %cadet

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%
% MISC   %
%%%%%%%%%%

% Text formatting.
\newcommand{\foreign}[1]{\textit{#1}}
\newcommand{\etal}{\foreign{et~al.}}
\newcommand{\project}[1]{\textsl{#1}}
\definecolor{grey}{rgb}{0.5,0.5,0.5}
\newcommand{\deemph}[1]{\textcolor{grey}{\footnotesize{#1}}}

% literature links--use doi if you can
\newcommand{\doi}[2]{\emph{\addfontfeature{Color=grey}\href{http://dx.doi.org/#1}{{#2}}}}
\newcommand{\link}[2]{\emph{\addfontfeature{Color=notlink}\href{#1}{{#2}}}}
\newcommand{\ads}[2]{{\addfontfeature{Color=grey}\href{http://adsabs.harvard.edu/abs/#1}}{{#2}}}
\newcommand{\arxiv}[2]{\emph{\addfontfeature{Color=grey}\href{http://arxiv.org/abs/#1}{{#2}}}}
\newcommand{\isbn}[1]{{\footnotesize(\textsc{isbn:}{#1})}}

% Journal names.
\newcommand{\aj}{AJ}
\newcommand{\apj}{ApJ}
\newcommand{\pasp}{PASP}
\newcommand{\mnras}{MNRAS}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}

%\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
%\defaultfontfeatures{Mapping=tex-text}
%\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}

\newfontfamily\headingfont[Path=fonts/]{Lato-Bold.ttf}
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path=fonts/]{Lato-Light.ttf}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\newcommand{\header}{%
  {
  \vspace*{-1.02in}
  \vspace*{-.4in}
  \hspace*{-2.415in}
  \centering
  \includegraphics[width=\paperwidth]{header.pdf}
  \vspace*{-0.2in}
  }
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wide section environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{changemargin}[2]{%
\begin{list}{}{%
\setlength{\topsep}{0pt}%
\setlength{\leftmargin}{#1}%
\setlength{\rightmargin}{#2}%
\setlength{\listparindent}{\parindent}%
\setlength{\itemindent}{\parindent}%
\setlength{\parsep}{\parskip}%
}%
\item[]}{\end{list}}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\textbf{\footnotesize\addfontfeature{Color=lightgray} #3}}\\%
    #4\vspace{\parsep}%
  }\\}
  
\newcommand{\asideentry}[3]{%
  #1&\parbox[t]{3cm}{%
    \textbf{#1}%
    \hfill%
    {\footnotesize #2}\\%
    #3\vspace{\parsep}%
  }\\}

% Set up the custom unordered list.
\newcommand{\cvlist}{%
    \rightmargin=0in
    \leftmargin=0.15in
    \topsep=0em
    \partopsep=0pt
    \itemsep=0ex
    \parsep=0pt
    \itemindent=0\leftmargin
    \listparindent=0\leftmargin
    \settowidth{\labelsep}{~}
}

\newcommand{\asidelist}{%
    \rightmargin=0in
    \leftmargin=0.12in
    \labelwidth=0.5in
    \topsep=0em
    \partopsep=0pt
    \itemsep=0ex
    \parsep=0pt
    \itemindent=0in
    \labelsep=1in
    \listparindent=0in
    \settowidth{\labelsep}{~}
}

\newcommand{\pubslist}{%
    \rightmargin=0in
    \leftmargin=0.15in
    \topsep=0ex
    \partopsep=0pt
    \itemsep=1.25ex
    \parsep=0pt
    \itemindent=-1.0\leftmargin
    \listparindent=0.0\leftmargin
    \settowidth{\labelsep}{~}
}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newcommand{\aside}[3]{
    \begin{textblock}{3.6}(-4.5, #2)
        \begin{flushleft}
            \section{#1}
                #3
        \end{flushleft}
    \end{textblock}
}

\newcommand{\floattext}[4]{
    \begin{textblock}{3.6}(#2, #3)
        \begin{flushright}
            \section{#1}
                #4
        \end{flushright}
    \end{textblock}
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
%\RequirePackage[left = 6.1cm, top = 2cm, right = 2.5cm, nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=True,
    linkcolor=red,
    citecolor=red,
    filecolor=red,
    urlcolor=linkblue}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
