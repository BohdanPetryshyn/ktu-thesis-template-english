\LoadClass[12pt,a4paper]{article}
\RequirePackage[includefoot, left=3cm,right=1.8cm,top=1.8cm,bottom=1.8cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{scrextend}
\RequirePackage{fontspec}
\RequirePackage{sectsty}
\RequirePackage{titlesec}
\RequirePackage{secdot}
% Discourage hyphen usage
\RequirePackage[none]{hyphenat}
\RequirePackage{tocloft}
% add list of figures and list of tables to ToC
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{caption}
\RequirePackage[lithuanian]{babel}
\RequirePackage{chngcntr}

\setmainfont{Times New Roman} % the document must use times new roman font

\definecolor{brown}{HTML}{D4AF37}
\definecolor{gray}{HTML}{808080}

\renewcommand\LARGE{\@setfontsize\LARGE{18}{18}}

\newcommand*\supervisor[1]{\gdef\@supervisor{#1}}
\newcommand*\@supervisor{\@latex@error{\noexpand\supervisor is not provided.}}
\newcommand*\authortext[1]{\gdef\@authortext{#1}}
\newcommand*\@authortext{Project author}
\newcommand*\supervisortext[1]{\gdef\@supervisortext{#1}}
\newcommand*\@supervisortext{Supervisor}
\newcommand*\reviewer[1]{\gdef\@reviewer{#1}}
\newcommand*\@reviewer{\@latex@error{\noexpand\reviewer is not provided.}}
\newcommand*\reviewertext[1]{\gdef\@reviewertext{#1}}
\newcommand*\@reviewertext{Reviewer}
\newcommand*\authorgenitive[1]{\gdef\@authorgenitive{#1}}
\newcommand*\@authorgenitive{\@latex@error{\noexpand\authorgenitive is not provided.}}

% Lithuanian captions
\addto\captionslithuanian{%
  \renewcommand{\figurename}{Fig.}%
  \renewcommand{\tablename}{Table.}
  \renewcommand{\contentsname}{Table of contents}%
  \renewcommand{\listfigurename}{\texorpdfstring{\hfil}{\space}\fontsize{12}{15}{\selectfont{List of figures}}}%
  \renewcommand{\listtablename}{\texorpdfstring{\hfil}{\space}\fontsize{12}{15}{\selectfont{List of tables}}}
}

% Try to avoid overfull.
\emergencystretch 3em%
\linespread{1.15}
\setlength{\parindent}{0cm}
% Fix spacing for sections by adding parfill option
\RequirePackage[parfill]{parskip}
\setlength{\parskip}{3.5mm}

% --- SECTIONS ---
\allsectionsfont{\fontsize{12}{15}\selectfont}
\sectiondot{subsection}
\sectiondot{subsubsection}
\newcommand{\centersection}[1]{
  \section*{\hfil#1}
  \addcontentsline{toc}{section}{#1}%
  }

\titlespacing{\section}{0pt}{3.5mm}{3.5mm}
\titlespacing{\subsection}{0pt}{2mm}{2mm}
\titlespacing{\subsubsection}{0pt}{2mm}{2mm}

% --- TABLES ---
% use tabularx for easy formatting of full page width tables
\RequirePackage{tabularx}
% allow table headers and set their style to footnotesize (10px) bold
\RequirePackage{makecell}
\renewcommand\theadfont{\footnotesize\bfseries}
% add spacing to table cell content, this should be 1.1 mm, but arraystretch accepts a coefficient rather than mm
\let\oldtabular\tabularx
\renewcommand{\tabularx}{\footnotesize\oldtabular}
\renewcommand{\arraystretch}{1.1}
% format table captions to effectively be "\textbf{1 lentelė.} Konkurentų apžvalga" in small size
\DeclareCaptionLabelFormat{ktucaptionlabel}{#1 #2}
\captionsetup[table]{labelformat=ktucaptionlabel,name=Table,labelsep=period,labelfont={bf,small},singlelinecheck=false,textfont=small,skip=1.1mm}
% List of tables configuration
\renewcommand{\cfttabaftersnum}{.}
\renewcommand{\cfttabpresnum}{Table.~}
% Looks like this value has to be fixed. Looks decent up to 99 tables.
% If anyone knows how to make this dynamic, make a PR
\setlength{\cfttabnumwidth}{4em}
% Remove indentation from LoT
\setlength{\cfttabindent}{0pt}

% add section number to table caption number
% \counterwithin{table}{section}  
\renewcommand{\thetable}{\arabic{table}}

% --- ToC ---
\renewcommand{\cfttoctitlefont}{\hfil\bfseries\selectfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
% no vertical spacing between numberless sections
\setlength\cftparskip{0pt}
\setlength\cftbeforesecskip{0pt}
% dot frequency
\renewcommand\cftdotsep{2}
% no indentations for subsections and sections
\setlength{\cftsecindent}{0pt}
\setlength{\cftsubsecindent}{0pt}
\setlength{\cftsubsubsecindent}{0pt}
% add dots after ToC section numbers
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}

% --- FIGURES ---
\renewcommand{\thefigure}{\arabic{figure}}

% Center figures
\g@addto@macro\@floatboxreset\centering

% List of figures configuration
\renewcommand{\cftfigaftersnum}{.}
\renewcommand{\cftfigpresnum}{Fig.~}
% Looks like this value has to be fixed. Looks decent up to 99 images.
% If anyone knows how to make this dynamic, make a PR
\setlength{\cftfignumwidth}{3em}
% Remove indentation from LoF
\setlength{\cftfigindent}{0pt}
% setup figure captions
\captionsetup[figure]{labelformat=ktucaptionlabel, labelsep=period, font=small, labelfont=bf, skip=0pt, justification=centering}

% add section number to figure caption number
% \counterwithin{figure}{section}  


% --- BIBLIOGRAPHY ---
\RequirePackage[
  backend=biber,
  style=iso-numeric,
  maxbibnames=4,
]{biblatex}
\DeclareNameAlias{author}{sortname}
\RequirePackage{csquotes}
\DeclareQuoteAlias{czech}{lithuanian}

% --- PAGE NUMBERS ---
\RequirePackage{fancyhdr}
\fancyhead{}
\lfoot{} \cfoot{} \rfoot{\thepage}
\pagestyle{fancy}
% apply right-aligned page number to ToC, LoF, LoT
\fancypagestyle{plain}{\pagestyle{fancy}}
% remove fancyhdr headrule
\renewcommand{\headrulewidth}{0pt}
% don't indent footnotes
\RequirePackage[bottom,hang,flushmargin]{footmisc}

% Require enumitem for item list configuration
\RequirePackage{enumitem}
\setlist[itemize]{noitemsep, topsep=0pt}
\setlist[enumerate]{noitemsep, topsep=0pt}

% update style for enumerate - it should have no extra indent
\setlist[enumerate,1]{align=left}
% force each section to start on a new page
\newcommand{\sectionbreak}{\clearpage}

% --- Content ---

\renewcommand\maketitle{
  % First title page
  \thispagestyle{empty}  % hide page number
  {\parskip=0mm
    \begin{center}
      \vspace*{6.8mm}

      \includegraphics{logo}

      \vspace{10.6mm}
      \textbf{Kaunas University of Technology}

      \vspace{2.1mm}
      Faculty of Informatics
      \vspace{33.5mm}

      {\LARGE \textbf{\@title}}

      \vspace{2.1mm}
      {\large Master’s Final Degree Project}
      \vspace{33.1mm}

      \noindent{\textcolor{brown}{\rule{9cm}{0.5pt}}}
      \vspace{9mm}

      \parbox[s]{9cm}{\centering \textbf{\@author}}
      \vspace{2.1mm}

      \@authortext
      \vspace{6.5mm}

      \parbox[s]{9cm}{\centering \textbf{\@supervisor}}
      \vspace{2.1mm}

      \@supervisortext
      \vspace{6.5mm}

      \noindent{\textcolor{brown}{\rule{9cm}{0.5pt}}}

      \vfill

      \textbf{Kaunas, \the\year}
      \vspace{7mm}
    \end{center}
  }
  \clearpage
  % second page
  \thispagestyle{empty}
  {\parskip=0mm
    \begin{center}
      \vspace*{6.8mm}

      \includegraphics{logo}

      \vspace{10.6mm}
      \textbf{Kaunas University of Technology}
      \vspace{2.1mm}

      Faculty of Informatics
      \vspace{33mm}

      {\LARGE \textbf{\@title}}
      \vspace{2.1mm}

      {\large Master’s Final Degree Project}
      \vspace{2.1mm}

      {\large Artificial Intelligence in Computer Science (6211BX007)}
      \vspace{18mm}

    \end{center}
    \begin{addmargin}[8cm]{0cm}
      \noindent{\textcolor{brown}{\rule{9cm}{0.5pt}}}
      \vspace{6mm}

      \noindent{\parbox[s]{7cm}{\textbf{\@author}}}
      \vspace{2.1mm}

      \noindent{\@authortext}
      \vspace{8.6mm}

      \noindent{\parbox[s]{7cm}{\textbf{\@supervisor}}}
      \vspace{2.1mm}

      \noindent{\@supervisortext}
      \vspace{8.6mm}

      \noindent{\parbox[s]{7cm}{\textbf{\@reviewer}}}
      \vspace{2.1mm}

      \noindent{\@reviewertext}
      \vspace{6mm}

      \noindent{\textcolor{brown}{\rule{9cm}{0.5pt}}}

    \end{addmargin}
    \begin{center}
      \vfill
      \textbf{Kaunas, \the\year}
      \vspace{7mm}
    \end{center}
  }
  \clearpage
  \thispagestyle{empty}
  {\parskip=2.1mm
    \begin{center}
      \vspace*{6.8mm}

      \includegraphics{logo}

      \vspace{8.4mm}
      \textbf{Kaunas University of Technology}

      Faculty of Informatics

      \@author
      \vspace{24.6mm}

      {\LARGE \textbf{\@title}}

      {\large{Declaration of Academic Integrity}}
      \vspace{11.9mm}
    \end{center}
  }

  I confirm that the final project of mine, Author’s name and surname, on the topic „Title of the Final Degree Project“ is written completely by myself; all the provided data and research results are correct and have been obtained honestly. None of the parts of this thesis have been plagiarised from any printed, Internet-based or otherwise recorded sources. All direct and indirect quotations from external resources are indicated in the list of references. No monetary funds (unless required by Law) have been paid to anyone for any contribution to this project.

  I fully and completely understand that any discovery of any manifestations/case/facts of dishonesty inevitably results in me incurring a penalty according to the procedure(s) effective at Kaunas University of Technology.

  \vspace{7mm}

  \begin{addmargin}[56.6mm]{0cm}
    \begin{tabular}{p{70.7mm}@{\hskip 7.1mm}p{35.7mm}}
      \hrulefill & \hrulefill \\
      \multicolumn{1}{c}{\textcolor{gray}{{\normalsize (name and surname filled in by hand)}}} &
      \multicolumn{1}{c}{\textcolor{gray}{{\normalsize (signature)}}}
    \end{tabular}
  \end{addmargin}
  \clearpage
}
