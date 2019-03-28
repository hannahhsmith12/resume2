\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass[12pt]{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{midgray}{HTML}{606060}
\definecolor{darkestgray}{HTML}{080808}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

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
  \colorlet{header}{darkestgray}
\fi
\colorlet{textcolor}{darkestgray}
\colorlet{asidecolor}{darkestgray}
\colorlet{asideheadingcolor}{midgray}
\colorlet{headingcolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

% \newfontfamily\bodyfont[]{Helvetica Neue}
% \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
% \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}

% \defaultfontfeatures{Mapping=tex-text}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}

\newfontfamily\bodyfont[]{Source Sans Pro}
\newfontfamily\asidefont[Color=asidecolor]{Source Sans Pro ExtraLight}
\newfontfamily\thinfont[]{Source Sans Pro Light}
\newfontfamily\headingfont[]{Source Sans Pro}
\newfontfamily\asideheadingfont[Color=asideheadingcolor]{Source Sans Pro Black}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Source Sans Pro Light}

%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand*{\firstname}[1]{\gdef\@firstname{#1}%
}
\newcommand*{\@firstname}{First}
\newcommand*{\lastname}[1]{\gdef\@lastname{#1}%
}
\newcommand*{\@lastname}{\texttt{\string\lastname} currently
not set. Please fix this.}
\newcommand*{\jobdescription}[1]{\gdef\@jobdescription{#1}%
}
\newcommand*{\@jobdescription}{job description}
\newcommand*{\contactemail}[1]{\gdef\@contactemail{#1}%
}
\newcommand*{\@contactemail}{\texttt{\string\contactemail} currently
not set. Please fix this.}
\newcommand*{\contactaddressone}[1]{\gdef\@contactaddressone{#1}%
}
\newcommand*{\@contactaddressone}{\texttt{\string\contactaddressone} currently
not set. Please fix this.}
\newcommand*{\contactaddresstwo}[1]{\gdef\@contactaddresstwo{#1}%
}
\newcommand*{\@contactaddresstwo}{}
\newcommand*{\contactaddressthree}[1]{\gdef\@contactaddressthree{#1}%
}
\newcommand*{\@contactaddressthree}{}
\newcommand*{\contactphone}[1]{\gdef\@contactphone{#1}%
}
\newcommand*{\@contactphone}{\texttt{\string\contactphone} currently
not set. Please fix this.}
% \newcommand*{\github}[1]{\gdef\@github{#1}%
% }
% \newcommand*{\@github}{\texttt{\string\github} currently
% not set. Please fix this.}

\newcommand{\contactheader}{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, anchor=north, minimum width=\paperwidth, minimum height=3.5cm] (box) at (current page.north){};
    \node [anchor=center, below = 0.4in] (name) at (box.north) {%
      \fontsize{28pt}{50pt}\color{header}%
      {\thinfont \textsc{\@firstname}}\hspace{0.5em}{\thinfont  \textsc{\@lastname}}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont \@jobdescription%
    };
    \node [anchor=south west, align=left, inner ysep=0.5cm, xshift=0.95in] (email-phone) at (box.south west){%
      \color{header}%
      \thinfont \@contactphone\\%
      \color{header}%
      \thinfont \@contactemail\\%
      % \color{header}%
      % \thinfont \@github\\%
    };
    \node [anchor=south east, align=right, inner ysep=0.5cm, xshift=-0.95in] (address) at (box.south east){%
      \color{header}%
      \thinfont \@contactaddressone\\%
      \color{header}%
      \thinfont \@contactaddresstwo\\%
      \color{header}%
      \thinfont \@contactaddressthree%
    };
  \end{tikzpicture}
  \vspace{2cm}
  %\vspace{-2\parskip}
}

\def\sep{\quad|\quad}

\newcommand{\linecontactheader}{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center, below = 0.6in] (name) at (box.north) {%
      \fontsize{28pt}{50pt}\color{header}%
      {\bodyfont \textsc{\@firstname}}\hspace{0.5em}{\thinfont  \textsc{\@lastname}}
    };
    \node [anchor=north] (title) at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont \@jobdescription%
    };
    \node [anchor=north] at (title.south) {%
      \hspace{-1.1cm}\small%\center\noindent%
      \@contactemail \sep%
      \@contactaddressone, \@contactaddresstwo \sep%
      \@contactphone%
    };
  \end{tikzpicture}
  \vspace{2cm}
  %\vspace{-2\parskip}
}

% \newcommand{\bigheader}{%
%   \begin{tikzpicture}[remember picture,overlay]
%     \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
%     \node [anchor=center] (name) at (box) {%
%       \fontsize{40pt}{72pt}\color{header}%
%       {\bodyfont \textsc{\@firstname}}\hspace{0.5em}{\thinfont  \textsc{\@lastname}}
%     };
%     \node [anchor=north] at (name.south) {%
%       \fontsize{14pt}{24pt}\color{header}%
%       \thinfont \@jobdescription%
%     };
%   \end{tikzpicture}
%   \vspace{2.5cm}
%   \vspace{-2\parskip}
% }


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\def\beforesectionskip{0pt}
\def\aftersectionskip{0em}%-0.5\parskip}

\newcounter{colorCounter}
\def\sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headingcolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\beforesectionskip}%\parskip}
  {%
    \LARGE\headingfont\color{headingcolor}%
    \textsc{#1}%
  }
  \par\vspace{\aftersectionskip}%\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headingcolor} #1}
  \par\vspace{.5\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headingcolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{array}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  %\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  %\end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headingcolor}}
\newcommand{\entry}[3]{%
  \parbox[t]{\textwidth}{%
    \textbf{#1}%
    \hfill%
    {\footnotesize\addfontfeature{Color=gray} #2}\\%
    \vspace{-\baselineskip}\begin{itemize}
    #3\end{itemize}\vspace{0.2em}%
  }\\}
\newcommand{\lineentry}[3]{%
  \parbox[t]{\textwidth}{%
    \textbf{#1}#3%
    \hfill%
    {\footnotesize\addfontfeature{Color=gray} #2}%
  }}
\newcommand{\subentry}[3]{%

\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}m{5mm}l}
  \hspace{5mm}&\parbox[t]{\textwidth}{%
    \textbf{#1}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #2}\\%
    #3\vspace{\parsep}%
  }
  \end{tabular*}}


%%%%%%%%%%%%%%a
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{0.96cm}
\newenvironment{aside}{%
  \asidefont
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\asideheadingfont ##1}
  }
  \begin{textblock}{3.6}(1.1, 4.33)
  \vspace{\beforesectionskip}
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

% %%%%%%%%%%%%%%%%
% % Bibliography %
% %%%%%%%%%%%%%%%%

% \RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

% \DeclareFieldFormat[article]{title}{#1\par}
% \DeclareFieldFormat[book]{title}{#1\par}
% \DeclareFieldFormat[inproceedings]{title}{#1\par}
% \DeclareFieldFormat[misc]{title}{#1\par}
% \DeclareFieldFormat[report]{title}{#1\par}

% \DeclareBibliographyDriver{article}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \usebibmacro{journal+issuetitle}%
%     \setunit{\space}%
%     \printfield{pages}%
%     \newunit%
%     \printlist{publisher}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{book}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printlist{publisher}%
%     \setunit*{\addcomma\space}%
%     \printfield{note}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }


% \DeclareBibliographyDriver{inproceedings}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}%
%     \printfield{booktitle}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{misc}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{booktitle}%
%     \setunit*{\addcomma\space}%
%     \printfield{note}%
%     \setunit*{\addcomma\space}%
%     \printfield{year}%
%     \setunit{\addcomma\space}%
%     \printlist{location}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareBibliographyDriver{report}{%
%   \printfield{title}%
%   \newblock%
%   \printnames{author}%
%   \par%
%   \newblock%
%   {%
%     \footnotesize\addfontfeature{Color=lightgray}\itshape%
%     \printfield{type}%
%     \setunit{\space}%
%     \printfield{number}%
%     \setunit{\addcomma\space}%
%     \printfield{year}%
%     \newunit%
%   }
%   \par\vspace{0.3\baselineskip}
% }

% \DeclareNameFormat{author}{%
%   \small\addfontfeature{Color=lightgray}%
%   \ifblank{#3}{}{#3\space}#1%
%   \ifthenelse{\value{listcount}<\value{liststop}}
%     {\addcomma\space}
%     {}%
% }

% \defbibheading{bibheading}[\bibname]{%
%    \subsubsection*{#1}
%    \markboth{#1}{#1}
% }

% \newcommand{\printbibsection}[2]{
%   \begin{refsection}
%     \nocite{*}
%     \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=bibheading]
%   \end{refsection}
% }

% \DeclareSortingScheme{chronological}{
%   \sort[direction=descending]{\field{year}}
%   \sort[direction=descending]{\field{month}}
% }



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=1in,top=0.6in,right=1in,bottom=0.75in,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=false,
    linkcolor=red,
    citecolor=red,
    filecolor=red,
    urlcolor = red}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother

\renewcommand\labelitemi{--}

\usepackage{enumitem}
\setlist[itemize]{leftmargin=5mm}
