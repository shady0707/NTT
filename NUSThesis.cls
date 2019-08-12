%vim: set ft=latex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NUSThesis}[2019/10/08  NUS Thesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass{book}

\RequirePackage[top=1.2in, bottom=1.2in,outer=1.5in, inner=1.5in, headheight=2cm, footskip=2cm, heightrounded]{geometry}
\RequirePackage[font=singlespacing]{caption}
\RequirePackage{setspace}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}

% The alwayssingle environment ensures that front matter is always
% single column even in a double-column document.

\newenvironment{alwayssingle}
  {\if@twocolumn \@restonecoltrue\onecolumn \else \@restonecolfalse\newpage \fi}
  {\if@restonecol \twocolumn \else \newpage \fi}
\newcommand{\intendclearpage}{
  \ifdefined\pagedoublesided\clearemptydoublepage\else\clearpage\fi}
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the front matter.

% The year the degree will be officially conferred
\def\degreeyear#1{\gdef\@degreeyear{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% All previous degrees: one per line in chronological order
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}

% The name of your supervisors
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
\def\anothercosupervisor#1{\gdef\@anothercosupervisor{#1}}

% The names of your thesis examiners, one per line
\def\examiners#1{\gdef\@examiners{#1}}

% The name of your degree's field (e.g. Psychology, Computer Science)
\def\field#1{\gdef\@field{#1}}

% The declaration date
\def\declaredate#1{\gdef\@declaredate{#1}}

% The declaration signature
\def\declaresign#1{\gdef\@declaresign{#1}}

\def\blocklt#1{\textbf{\MakeUppercase{#1}}}
\renewcommand\maketitle{{
  \makeatletter
    \setlength{\@tempdima}{28pt}\advance\@tempdima-\baselineskip
    \parskip=\@tempdima minus 4pt
  \makeatother
\begin{alwayssingle}
  \hrule height 0pt
  \vfill
  %\let\footnotesize\small
  \let\footnoterule\relax
  \thispagestyle{empty}
  \setcounter{page}{1}

  \begin{center}
    \blocklt{\@title}\par
    \vspace{14pt minus 4pt}
    by \par
    \blocklt{\@author}
    \ifdefined \@prevdegrees
      \par\vspace{-10pt}\textit{(\@prevdegrees)}
    \fi\par
    \vspace{28pt minus 8pt}
    \blocklt{A thesis submitted for the degree of} \par
    \blocklt{\@degree}\par
    in \par
    \blocklt{\@field}\par
    in the \par
    \blocklt{Graduate Division} \par
    of the \par
    \blocklt{National University of Singapore} \par
    \vspace{28pt minus 8pt}
    \blocklt{\@degreeyear} \par
    \vspace{14pt minus 4pt}
    \ifdefined \@cosupervisor
      Supervisors: \par\vspace{-10pt}
      {\@supervisor}, Main Supervisor \\
      {\@cosupervisor}, Co-Supervisor
      \ifdefined \@anothercosupervisor
        \\{\@anothercosupervisor}, Co-Supervisor
      \fi
    \else
      Supervisor: \par\vspace{-10pt}
      {\@supervisor}
    \fi\par
    \ifdefined \@examiners
      \vspace{5pt}
      Examiners: \par\vspace{-10pt}
      {\@examiners}\par
    \fi
  \end{center}
  \vfill
  \hrule height 0pt
\end{alwayssingle}
\setcounter{footnote}{0}
}}

\newcommand\makedeclaration{
\intendclearpage
    \thispagestyle{empty}
    \begin{alwayssingle}
        \begin{center}
            {\bfseries \Large Declaration}
        \end{center}
        {
            \large
            I hereby declare that this thesis is my original work and it has been written by me in its entirety.I have duly acknowledged all the sources of information which have been used in the thesis.

            This thesis has also not been submitted for any degree in any university previously.
        }

        \begin{center}
            \rule{3cm}{0.15mm}\\
            \@author\\
            \@date
        \end{center}
    \end{alwayssingle}
\intendclearpage
}

\newcommand{\abstractname}{Abstract}
\newenvironment{abstract}{
  \intendclearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\abstractname}
  %%\begin{alwayssingle}
      \begin{center}{
              {\large \bfseries \abstractname}\par
              \vspace{.5in}
              \@title\par
              \vspace{.1in}
              by\par
              \vspace{.1in}
              \@author\par
              \vspace{.1in}
              {\@degree} in \@field\par
              \vspace{.1in}
              National University of Singapore\par
          }
          \vspace{.1in}
      \end{center}
}
{
  %\end{alwayssingle}
}

\newcommand\acknowledgename{Acknowledgements}
\newenvironment{acknowledgments}
  {
      \intendclearpage
   \phantomsection\addcontentsline{toc}{chapter}{\acknowledgename}
   \begin{center}
   {\large \bfseries \acknowledgename}
   \end{center}
  }
  {}

\appto\frontmatter{\doublespacing}


% The Grad. Division requires that "Placement of page numbers must be
% at the center of bottom."

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\fancypagestyle{mainmatterstyle}{
    \fancyhf{}
    \fancyhead{}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[CE,CO]{\thepage}
    \renewcommand{\headrulewidth}{0.pt}
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}

\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \fancyhead{}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[CE,CO]{\thepage}
    \renewcommand{\headrulewidth}{0.pt}
}

\appto\frontmatter{\pagestyle{frontmatterstyle}}

%\pagestyle{simple}
%\makeevenhead{simple}{\leftmark}{}{}
%\makeoddhead{simple}{}{}{\rightmark}
%\makeevenfoot{simple}{}{\thepage}{}
%\makeoddfoot{simple}{}{\thepage}{}
%\aliaspagestyle{book}{simple}
%\aliaspagestyle{part}{simple}
%\aliaspagestyle{chapter}{simple}
%\aliaspagestyle{title}{simple}

% Re-defining \tableofcontents, \listoffigures and \listoftables to 
% avoid self-referencing. 

%\renewcommand{\tableofcontents}{
  %\intendclearpage
  %\phantomsection\pdfbookmark[chapter]{\contentsname}{toc}
  %\chapter*{\contentsname}\vspace{2em}\makeatletter\@starttoc{toc}\makeatother}

\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
\phantomsection
\addcontentsline{toc}{chapter}{Contents}
\oldtableofcontents
\clearpage
}


\renewcommand{\listoffigures}{
  \intendclearpage
  \phantomsection\addcontentsline{toc}{chapter}{List of Figures}
  \chapter*{List of Figures}\vspace{2em}\makeatletter\@starttoc{lof}\makeatother}

\renewcommand{\listoftables}{
  \intendclearpage
  \phantomsection\addcontentsline{toc}{chapter}{List of Tables}
  \chapter*{List of Tables}\vspace{2em}\makeatletter\@starttoc{lot}\makeatother}
