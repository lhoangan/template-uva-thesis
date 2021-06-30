% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[11pt, footinclude=true, headinclude=true]{book}


%% -- USER-VISIBLE MACROS --

% \onedot{e.g}
% Add a period to the end of an abbreviation unless there's one
% already, then \x%space.
\RequirePackage{xspace}
\DeclareRobustCommand\onedot{\futurelet\@let@token\bmv@onedotaux}
\def\bmv@onedotaux{\ifx\@let@token.\else.\null\fi\xspace}

% Options
%
\RequirePackage{etoolbox}

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
%\RequirePackage[width=5.75in, letter]{geometry}
%\RequirePackage[top=1in,bottom=1in, a4paper]{geometry}
%\usepackage[paperwidth=16cm,
%            paperheight=24cm,
%            margin=2cm]{geometry}
\RequirePackage[
            % a4paper,
            paperwidth=176mm,  % full page width (content + 2 real margins + 2 horizontal bleeding margins)
            paperheight=246mm, % full page height (content + 2 real margins + 2 vertical bleeding margins )
            layoutwidth=170mm, % content width
            layoutheight=240mm,% content height
            layouthoffset=3mm, % single horizontal bleeding 
            layoutvoffset=3mm, % single vertical bleeding margin
            margin=20mm,
            showcrop
            %includemp, % include margin notes
            %marginparwidth=4cm,
            %marginparsep=0.4cm
            ]{geometry}
% LHA: Crop marks wont show up with bleed of 3mm because
% the default gap is 3mm itself.
% We reduce default gap down to 0mm 
\def\cropmarkgap{0}% mm
\def\Gm@cropmark(#1,#2,#3,#4){% #1 = x direction, #2 = y direction, #3 & #4 no longet used
  \begin{picture}(0,0)
    \setlength\unitlength{1truemm}%
    \linethickness{0.25pt}%
    \put(\the\numexpr #1*\cropmarkgap\relax,0){\line(#1,0){\the\numexpr 20-\cropmarkgap}}%
    \put(0,\the\numexpr #2*\cropmarkgap\relax){\line(0,#2){\the\numexpr 20-\cropmarkgap}}%
  \end{picture}}%

% LHA: if not using geometry's showcrop, we can use a dedicated package for showing crop marks
% To use the crop package: paperheight and width in geometry
% has to be set to the cropped size, ie. without bleed
% and width/heigh in crop is the physical paper
%\usepackage[
%   noinfo,
%   cam,
%   cross,           % crosses as marks
%   width=176mm,     % the width of the galley
%   height=246mm,    % the height of the galley
%   center           % actual page is centered on the galley
%]{crop}
\usepackage{ragged2e}
\justifying
%\RaggedRight
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

% Fonts
%\usepackage[lf]{ebgaramond}
%\usepackage[cmintegrals,cmbraces]{newtxmath}
%\usepackage{ebgaramond-maths}
%LHA: https://tex.stackexchange.com/questions/235400/how-to-use-boldface-when-using-the-package-ebgaramond-maths

\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\usepackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{mathspec}
%\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
% The use of Latin Garamond comes with the costs of ugly \tilde or \hat above italic letter.
% The use of Greek Garamond comes with the costs of weird \theta
% The use of Digits Garamond comes with the confusion of 1 and I
%\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
\setmathsfont(Digits,Latin,Greek)[
Path=fonts/garamond/,
Extension=.otf,
UprightFont=EBGaramond-Regular,
BoldFont=EBGaramond-Bold,
ItalicFont=EBGaramond-Italic,
BoldItalicFont=EBGaramond-BoldItalic,
Numbers={Proportional}]{EB Garamond}
\setmathrm{EB Garamond}
%\AtBeginEnvironment{tabular}{\setmainfont[Numbers={OldStyle,Monospaced}]{Minion Pro}}
\AtBeginEnvironment{tabular}{
\setmainfont{EBGaramond-Regular}[
  Path=fonts/garamond/,
  BoldFont = EBGaramond-Bold,
  ItalicFont = EBGaramond-Italic,
  BoldItalicFont = EBGaramond-BoldItalic]\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
% LHA: the new garamond font is here https://github.com/octaviopardo/EBGaramond12/
% instructions: https://tex.stackexchange.com/a/439297/116614
\setmainfont{EBGaramond-Regular}[
  Numbers=OldStyle, % make fancy (updown) numbers
  Path=fonts/garamond/,
  BoldFont = EBGaramond-Bold,
  ItalicFont = EBGaramond-Italic,
  BoldItalicFont = EBGaramond-BoldItalic]
%\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{SourceCodePro-Regular.otf}
\RequirePackage[labelfont={bf,rm,footnotesize,singlespacing},
                textfont={rm,footnotesize,singlespacing},
                justification={justified,RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}


% Chapterthumb: chapter number on page margin
\RequirePackage[contents={},opacity=1,scale=1,color=black]{background}
\RequirePackage{tikzpagenodes}
\RequirePackage{totcount}
\usetikzlibrary{calc}
\newif\ifMaterial

\newlength\LabelWidth
\setlength\LabelWidth{1.5cm}
\newlength\LabelHeight
\setlength\LabelHeight{15pt}
\newlength\LabelShift
\setlength\LabelShift{25pt} % the space a chapterthumb in the next chapter is shifted down
% (in principle should be the same as LabelHeight, but not really in reality)

\AtBeginDocument{%
\regtotcounter{chapter}
\setlength\LabelWidth{\dimexpr\textheight/\totvalue{chapter}\relax}
\ifdim\LabelWidth>1.5cm\relax
  \global\setlength\LabelWidth{1.5cm}
\fi
}

\newcommand\AddLabels{%
\Materialtrue%
\AddEverypageHook{%
\ifMaterial%
\ifodd\value{page} %
 \backgroundsetup{
  angle=00,
  position={current page.east|-current page text area.north  east},
  hshift=-0.9cm,%11pt,
  vshift=-\thechapter*\LabelShift,
  contents={%
  \tikz\node[fill=gray!30,anchor=west,text width=1.8cm,
    align=center,text height=\LabelHeight,text depth=10pt,font=\Large]{\thechapter\hspace{3mm}\hphantom{}};
  }%
 }
 \else
 \backgroundsetup{
  angle=00,
  position={current page.west|-current page text area.north west},
  hshift=0.9cm,%-11pt,
  vshift=-\thechapter*\LabelShift,
  contents={%
  \tikz\node[fill=gray!30,anchor=west,text width=1.8cm,
    align=center,text height=\LabelHeight,text depth=10pt,font=\Large] {\hspace*{3mm}\thechapter};
  }%
 }
 \fi
 \BgMaterial%
\else\relax\fi}%
}

\newcommand\RemoveLabels{\Materialfalse}

% Front matter.
\setcounter{tocdepth}{1}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
% \usepackage[square,comma,numbers,sort&compress,doi=false,isbn=false,url=false]{natbib}
\RequirePackage[comma,numbers]{natbib} % supper
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\phdfrom#1{\gdef\@phdfrom{#1}}
\def\defendVenue#1{\gdef\@defendVenue{#1}}
\def\defendDOW#1{\gdef\@defendDOW{#1}}
\def\defendDay#1{\gdef\@defendDay{#1}}
\def\defendMonth#1{\gdef\@defendMonth{#1}}
\def\defendYear#1{\gdef\@defendYear{#1}}
\def\defendTime#1{\gdef\@defendTime{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\advisorSchool#1{\gdef\@advisorSchool{#1}}
\def\coadvisor#1{\gdef\@coadvisor{#1}}
\def\coadvisorSchool#1{\gdef\@coadvisorSchool{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\coadvisorTwoSchool#1{\gdef\@coadvisorTwoSchool{#1}}
\def\committeeOne#1{\gdef\@committeeOne{#1}}
\def\committeeOneSchool#1{\gdef\@committeeOneSchool{#1}}
\def\committeeTwo#1{\gdef\@committeeTwo{#1}}
\def\committeeTwoSchool#1{\gdef\@committeeTwoSchool{#1}}
\def\committeeThree#1{\gdef\@committeeThree{#1}}
\def\committeeThreeSchool#1{\gdef\@committeeThreeSchool{#1}}
\def\committeeFour#1{\gdef\@committeeFour{#1}}
\def\committeeFourSchool#1{\gdef\@committeeFourSchool{#1}}
\def\committeeFive#1{\gdef\@committeeFive{#1}}
\def\committeeFiveSchool#1{\gdef\@committeeFiveSchool{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
% School name and location

%% =========================================
%% School color found from university's graphic identity site:

%% COLOR SET #1: BEKERLY COLOR
%% The lower command will take effect
%\definecolor{SchoolColor}{HTML}{FDB515}     %berkeley gold   
%\definecolor{SchoolColor}{HTML}{003262} %    berkeley blue 
%\definecolor{SchoolColor}{rgb}{0, 0.19608, 0.3843} %berkeley blue 
%\definecolor{chaptergrey}{rgb}{0, 0.19608, 0.3843} % chapter numbers             
%
%% =======================================
%% COLOR SET #2: PRINCETON COLOR
%\definecolor{SchoolColor}{rgb}{0.9608, 0.5020, 0.1451}
%\definecolor{chaptergrey}{rgb}{0.9608, 0.5020, 0.1451} 
%
%% ==================
%% COLOR SET #3: NYU COLOR
%\definecolor{SchoolColor}{rgb}{0.3412, 0.0235, 0.5490} % purple 
%\definecolor{chaptergrey}{rgb}{0.2600, 0.0200, 0.4600} % dialed back a little   
%\definecolor{midgrey}{rgb}{0.4, 0.4, 0.4}

%\renewcommand*{\chapnumfont}{%
%  \usefont{T1}{\@defaultcnfont}{b}{n}\fontsize{90}{117}\selectfont% Default: 100/130
%  \color{chaptergrey}%
%}
%\let\size@chapter\Large

\hypersetup{
    colorlinks,
    citecolor=SchoolColor,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
    pagebackref=true,
    linktocpage=true,
    bookmarksnumbered=true,
    pageanchor=true,
    hypertexnames=false,
    naturalnames=true,
    plainpages=false,
    breaklinks=true,
    %hidelinks
}

% Formatting guidelines found in:
% http://www.gsas.harvard.edu/publications/form_of_the_phd_dissertation.php
\renewcommand{\frontmatter}{
	\pagenumbering{roman}
	\input{frontmatter/personalize}
	\thesistitle
	\copyrightpage
	\maketitle
	\dedicationpage
	\abstractpage
	\contentspage
	\quotepage
	\pagenumbering{arabic}
}
\newcommand{\thesistitle}{
	\thispagestyle{empty}
	\vspace*{\fill}
	%\vspace{75pt}
	\begin{center}
	\Huge \textcolor{SchoolColor}{\thetitle} \normalsize \\
	\vspace{350pt}
	\Large\textsc{\theauthor}\\
    \rm
	\end{center}
	\vspace*{\fill}
	\rm
}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\vspace*{\fill}
	%\vspace{75pt}
	\begin{center}
	\Huge \textcolor{SchoolColor}{\thetitle} \normalsize \\
	\vspace{30pt}
	\Large ACADEMISCH PROEFSCHRIFT \\
	\vspace{25pt}
	\normalsize
	%\setstretch{1.75} % linespacing
	\onehalfspacing
    ter verkrijging van de graad van doctor \\
    aan de Universiteit van Amsterdam \\
    op gezag van de Rector Magnificus \\
    prof. dr. ir. K.I.J. Maex \\
    ten overstaan van een door het College voor Promoties ingestelde commissie, \\
    in het openbaar te verdedigen in de \@defendVenue \\
    op \@defendDOW
    dag \@defendDay\ \@defendMonth\ \@defendYear ,
    te \@defendTime\ uur \\
    \vspace{15pt}
    door \\
    \vspace{15pt}
    {\Large \textsc{\theauthor}}\\
    \vspace{15pt}
    geboren te \@phdfrom
    \rm
	\end{center}
	\vspace*{\fill}
	\newpage
	\thispagestyle{empty}
	\textit{Promotiecommissie}
	\vspace{10pt}
	
	\begin{tabular}{lll}
	Promotor:     &  \@advisor & \@advisorSchool 
	\vspace{10pt} \\
	Co-promotor:  & \@coadvisor & \@coadvisorSchool
	\vspace{10pt} \\
	Overige leden: & \@committeeOne & \@committeeOneSchool \\
	& \@committeeTwo & \@committeeTwoSchool \\
	& \@committeeThree & \@committeeThreeSchool \\
	& \@committeeFour & \@committeeFourSchool \\
	& \@committeeFive & \@committeeFiveSchool \\
	\end{tabular} \\
	
	Faculteit der Natuurwetenschappen, Wiskunde en Informatica
	
	\vspace*{\fill}
	
	\input{frontmatter/funding}

	\rm
}


\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
    \input{frontmatter/copyright}
	\newpage
	\rm
}

\newcommand{\quotepage}{
    \cleardoublepage
    \phantomsection
	\newpage \thispagestyle{empty} \vspace*{\fill}
	\begin{center}
	    \noindent \input{frontmatter/quote}
	\end{center}
	\vspace*{\fill} \newpage \rm
    \cleardoublepage
}

\newcommand{\abstractpage}{
    %\pdfbookmark{Abstract}{Abstract} % content in toc is auto added to bookmark
    \addcontentsline{toc}{chapter}{Abstract}
	\newpage
	%\pagenumbering{roman}
	%\setcounter{page}{3}
	\pagestyle{fancy}
	\renewcommand{\headrulewidth}{0.0pt}
	\vspace*{35pt}
	\begin{center}
    	%\Large \textcolor{SchoolColor}{\fontdimen2\font=0.10em \@title} \normalsize \\
    	\Large \textcolor{SchoolColor}{\@title} \normalsize \\
    	\vspace*{20pt}
    	\scshape Abstract \\ \rm
	\end{center}
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/abstract}
    \end{spacing}
	\vspace*{\fill}
	%\newpage \lhead{} \rhead{}
	%\cfoot{\thepage}
}

\newcommand{\contentspage}{
    \pdfbookmark{\contentsname}{Contents}
    \tableofcontents
}

\newcommand{\dedicationpage}{
    \cleardoublepage
    \phantomsection
	\newpage \thispagestyle{empty} \vspace*{\fill}
	\begin{center}
	    \noindent \input{frontmatter/dedication}
	\end{center}
	\vspace*{\fill} \rm
	\newpage \lhead{} \rhead{}
	\thispagestyle{empty} % to remove page number
	\cfoot{\thepage}
    %\cleardoublepage
}

\newcommand{\acknowledgments}{
    \addcontentsline{toc}{chapter}{Acknowledgements}
    %\pdfbookmark{Acknowledgements}{Acknowledgements}
	\noindent
    \begin{spacing}{\dnormalspacing}
    	\input{frontmatter/thanks}
    \end{spacing}
	\vspace*{\fill} \newpage
	\setcounter{page}{1}
}


\renewcommand{\backmatter}{
    \begin{spacing}{\dcompressedspacing}
        \bibliography{my_bibs}
        \addcontentsline{toc}{chapter}{Bibliography}
        \pdfbookmark{Bibliography}{Bibliography}
        \bibliographystyle{ieeetr}
    \end{spacing}
    
    \begin{appendices}
        \include{chapters/appendixA}
    \end{appendices}
    
	\acknowledgments
}
