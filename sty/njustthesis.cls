%% This `njustthesis.cls' is the class file for NJUSTthesis template.
%%
%% GUN
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 0.1
%% of this license or (at your option) any later version.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sty/njustthesis}[2023/03/03 v0.1 NJUSTthesis template class]



%%  Declare Options
\newif\ifNJUST@typeinfo \NJUST@typeinfotrue       % declare two versions
\DeclareOption{print}{\NJUST@typeinfofalse}       % print
\DeclareOption{eprint}{\NJUST@typeinfotrue}       % draft
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}      % handle non-implemented options
\ProcessOptions\relax                             % terminates all options processing




%% loadclass infomation
\LoadClass[a4paper,zihao=-4,UTF8]{ctexbook}


%% package infomation
\RequirePackage{fancyhdr}      % page header/footer package
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm}      % math packages
\RequirePackage{graphicx,psfrag,flafter,subfigure}      % graphics packages




%% load class configuretion
\AtEndOfPackage{\makeatletter \InputIfFileExists{sty/njustthesis.cfg}{}{} \makeatother}




%% page layout
\oddsidemargin 0 true cm
\if@twoside
    \evensidemargin 0 true cm
\else
    \evensidemargin 0 true cm
\fi
\textheight 24 true cm
\textwidth 16 true cm
\topmargin -0.6 true cm
\headheight 15pt
\footskip 32pt




%% set page number style by fancyhdr:
%% The syntax is: \fancyhead[selectors]{output you want}
%% E Even page
%% O Odd page
%% L Left field
%% C Center field
%% R Right field
%% H Header
%% F Footer
%% so [CE,RO] will refer to the center of the even pages and to the right side of the odd pages.
\newcommand\pageDegree[1]{\def\NJUST@value@pageDegree{#1}}     % configure fancy style
\renewcommand\frontmatter{\pagenumbering{Roman}}      % change page number to Roman only for frontmatter 
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[LO]{\songti\zihao{-5}\NJUST@value@pageDegree}
    \fancyhead[RO]{\songti\zihao{-5}\NJUST@value@titlemark}
    \fancyhead[LE]{\songti\zihao{-5} \leftmark}
    \fancyhead[RE]{\songti\zihao{-5}\NJUST@value@pageDegree}
    \fancyfoot[RO,LE]{\zihao{-5} ~\thepage~}
}
\pagestyle{fancy}
\fancyhf{}
\fancyhead{}     % clear all fields
\fancyhead[LO]{\songti\zihao{-5}\NJUST@value@pageDegree}
\fancyhead[RO]{\songti\zihao{-5}\NJUST@value@titlemark}
\fancyhead[LE]{\songti\zihao{-5} \leftmark}%
\fancyhead[RE]{\songti\zihao{-5}\NJUST@value@pageDegree}
\fancyfoot[RO,LE]{\zihao{-5} ~\thepage~}




%% make cover
\newcommand\makecover{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}

        %% header
        \songti\zihao{5}
        \hspace{27.6pt}
        \NJUST@label@classification~
        \NJUSTunderline[100pt]{\NJUST@value@classification}
        \hfill
        \NJUST@label@confidential~
        \NJUSTunderline[100pt]{\NJUST@value@confidential}
        \hspace{27.6pt}
        \vskip 10pt
        \hspace{27.6pt}
        \NJUST@label@UDC~
        \NJUSTunderline[96pt]{\NJUST@value@UDC}
        \hfill
        \NJUSTunderline[0pt]{}
        \vskip 10pt

        %% logo
        \parbox[c][4cm][c]{\textwidth}{
            \centering
            \includegraphics[width=12.5cm]{fig/logo/njust.eps}
        }

        %% title & author
        \vskip 10pt
        \newcommand{\zihaopt}{\fontsize{32pt}{\baselineskip}\selectfont}
        {\kaibf\zihaopt\NJUST@label@thesis}
        \vskip \stretch{2}
        {\vskip 10pt
            \heibf\zihao{-1}\NJUSTunderline[400pt]{~\NJUST@value@titleUpp~}
            \vskip 10pt
            \NJUSTunderline[400pt]{~\NJUST@value@titleLow~}} \\
        \songti\zihao{-4}{\NJUST@label@titleLab}
        \vskip \stretch{2}
        {\kaibf\zihao{-2}\NJUSTunderline[180pt]{~\NJUST@value@author~}} \\
        \songti\zihao{-4}{\NJUST@label@authorLab}
        \vskip \stretch{2}
        \def\tabcolsep{1pt}
        \def\arraystretch{1.25}
        \begin{tabular}{cc}
            \songbf\zihao{4}\NJUST@label@advisor    & \NJUSTunderline[299pt]{{\kaibf\zihao{3}\NJUST@value@advisor} \hspace{4pt} {\kaibf\zihao{4}\NJUST@value@advisortitle}}     \\
            \songbf\zihao{4}\NJUST@label@coadvisor  & \NJUSTunderline[299pt]{{\kaibf\zihao{3}\NJUST@value@coadvisor} \hspace{4pt} {\kaibf\zihao{4}\NJUST@value@coadvisortitle}} \\
            \songbf\zihao{4}\NJUST@label@degree     & \NJUSTunderline[299pt]{\kaibf\zihao{3}\NJUST@value@degree}                                                                \\
            \songbf\zihao{4}\NJUST@label@major      & \NJUSTunderline[299pt]{\kaibf\zihao{3}\NJUST@value@major}                                                                 \\
            \songbf\zihao{4}\NJUST@label@interest   & \NJUSTunderline[299pt]{\kaibf\zihao{3}\NJUST@value@interest}                                                              \\
            \songbf\zihao{4}\NJUST@label@submitdate & \NJUSTunderline[299pt]{\kaibf\zihao{3}\NJUST@value@submitdate}
        \end{tabular}
    \end{center}

    %% footnote
    \vspace{2em}
    {\songti\zihao{5}\NJUST@value@UDCfootnote}

    %% basic font for all the context
    \songti
}




%% make backbone
\newcommand\makebackbone{
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \begin{center}
            \kaibf\zihao{-4}{\NJUST@value@titleBackbone}
            \vskip  \stretch{8}
            \vfill
            \kaibf\zihao{-4}{\NJUST@value@schoolBackbone}
        \end{center}
        \ifNJUST@typeinfo
            \vspace*{\stretch{1}}
            \begin{footnotesize}
                \noindent
            \end{footnotesize}
        \fi
        \cleardoublepage
    \fi
}




%% make Chinese incover
\newcommand\makeincover{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}

        %% incoverthesis
        \weibei\zihao{-2}\NJUST@value@incoverthesis
        \\[2cm] %[2cm]

        %% title
        \heibf\zihao{2}\NJUST@value@title
        \\[3cm]

        %% info
        \begin{tabular}{rl}
            \kaibf\zihao{-2}\NJUST@label@incoverauthor    & \kaibf\zihao{-2}\NJUST@value@author
            \\[25pt]
            \kaibf\zihao{-2}\NJUST@label@incoveradvisor   & {\kaibf\zihao{-2}\NJUST@value@advisor\hspace{4pt}}{\kaibf\zihao{3}\NJUST@value@advisortitle}
            \\
            \kaibf\zihao{-2}\NJUST@label@incovercoadvisor & {\kaibf\zihao{-2}\NJUST@value@coadvisor\hspace{4pt}}{\kaibf\zihao{3}\NJUST@value@coadvisortitle}
        \end{tabular}

        %% school & date
        \vskip \stretch{2}
        \songbf\zihao{-2}\NJUST@value@school
        \vskip 8pt
        \songbf\zihao{-2}\NJUST@value@incoverdate
    \end{center}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}




%% make English incover
\newcommand\makeenglishincover{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \vspace*{-18pt}

        %% degree
        \rmn\zihao{-2} \NJUST@label@englishdegree\NJUST@value@englishdegree
        \vskip 60pt

        %% title
        \rmbf\zihao{2} \NJUST@value@englishtitle
        \vskip 30pt

        %% author
        \rmit\zihao{-2}\NJUST@label@englishauthor
        \\
        \rmbfit\zihao{-2}\NJUST@value@englishauthor
        \vskip 60pt

        %% supervisor
        \begin{tabular}{rl}
            \rmit\zihao{-2} \NJUST@label@englishadvisor                 & \rmbfit\zihao{-2} \NJUST@value@englishadvisor   \\
            \rmit\zihao{-2} \NJUST@label@englishcoadvisor \hspace{45pt} & \rmbfit\zihao{-2} \NJUST@value@englishcoadvisor
        \end{tabular}
        \vskip \stretch{2}

        %% institute & date
        \rmn\zihao{-2} \NJUST@value@englishinstitute
        \vskip 12pt
        \rmn\zihao{-2} \NJUST@value@englishdate
    \end{center}

    %% degree
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}




%% make statement
\newcommand\makestatement{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \vspace*{12pt}
        \parbox{\textwidth}{\centering\bf\songbf\zihao{3}\NJUST@label@statement}
        \vskip 1.6cm %13pt
        \parbox{\textwidth}{\songti\zihao{4}\renewcommand{\baselinestretch}{1.6}\hspace{2em}\zihao{4}\NJUST@value@statement}
        \vskip 1.8cm
        \parbox{\textwidth}{\noindent{}\zihao{4}\NJUST@label@authorsign\hspace{3.5cm}\NJUST@label@signdate}
        \vskip 4.45cm

        \parbox{\textwidth}{\centering\bf\songbf\zihao{3}\NJUST@label@accredit}
        \vskip 1.6cm
        \parbox{\textwidth}{\songti\zihao{4}\renewcommand{\baselinestretch}{1.6}\hspace{2em}\zihao{4}\NJUST@value@accredit}
        \vskip 1.8cm
        \parbox{\textwidth}{\noindent{}\zihao{4}\NJUST@label@authorsign\hspace{3.5cm}\NJUST@label@signdate}
    \end{center}

    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}



%%  make abstract
%% abstract
\newenvironment{abstract}{
\ctexset{chapter={format += {\centering\zihao{3}}}}
{\Nchapter{\NJUST@label@abstract}}
}{}
%% kewords
\newcommand\keywords[1]{\vspace{2ex}\noindent{\songbf\zihao{4} \NJUST@label@keywords} #1}

%% Eng abstract
\newenvironment{englishabstract}{
\ctexset{chapter={format += {\centering\zihao{3}}}}
{\Nchapter{\NJUST@label@englishabstract}}
}{}
%% Eng keywords
\newcommand\englishkeywords[1]{\vspace{2ex}\noindent{\rmbf\zihao{4} \NJUST@label@englishkeywords} #1}




%% make table of contents
\renewcommand*\l@chapter[2]{
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}
        \vskip 0.3em \@plus\p@          % control space between section items
        \setlength\@tempdima{1.5em}
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode \songbf\zihao{4}
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        #1\nobreak
        \leaders\hbox{$\m@th\mkern 2mu\bm{\bm\cdot}\mkern 5mu$}     % control dots density within each item
        \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \penalty\@highpenalty
        \endgroup
    \fi
}
\renewcommand\tableofcontents{
\if@twocolumn
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse
\fi
{\ctexset{chapter={format += {\centering\zihao{3}}}} \chapter *{\NJUST@contentsname}}
\@mkboth{\MakeUppercase\NJUST@contentsname}{\MakeUppercase\NJUST@contentsname}
\@starttoc{toc}
\if@restonecol\twocolumn\fi
}
\addtocontents{toc}{\let\string\quad\relax}




%% make list of figures
\renewcommand*\listoffigures{
{\ctexset{chapter={format += {\centering\zihao{3}}}} \chapter*{\NJUST@listfigurename}}
\@mkboth{\MakeUppercase\NJUST@listfigurename}
{\MakeUppercase\NJUST@listfigurename}
\@starttoc{lof}     % list of figures
}




%% make list of tables
\renewcommand*\listoftables{
{\ctexset{chapter={format += {\centering\zihao{3}}}} \chapter*{\NJUST@listtablename}}
\@mkboth{\MakeUppercase\NJUST@listtablename}
{\MakeUppercase\NJUST@listtablename}
\@starttoc{lot}     % list of tables
}




%% make figure and table
\newcommand*\listoffiguresandtables{
{\ctexset{chapter={format += {\centering\zihao{3}}}} \chapter*{\NJUST@listfiguresandtablesname}}
\@mkboth{\MakeUppercase\NJUST@listfiguresandtablesname}
{\MakeUppercase\NJUST@listfiguresandtablesname}
{
    \let\oldnumberline\numberline
    \renewcommand{\numberline}{\figurename~\oldnumberline}
    \@starttoc{lof}    % list of figures
}
\bigskip           % space
{
    \let\oldnumberline\numberline
    \renewcommand{\numberline}{\tablename~\oldnumberline}
    \@starttoc{lot}    % list of tables
}
}




%% make abbreviations
\newenvironment{abbr}{
\ctexset{chapter={format += {\centering\zihao{3}}}}
{\Nchapter{\NJUST@label@abbr}}
}{}




%% make symbols
\newenvironment{symbols}{
\ctexset{chapter={format += {\centering\zihao{3}}}}
{\Nchapter{\NJUST@label@symbols}}
}{}




%% make bibliography
\newenvironment{newbibliography}{
\ctexset{chapter={format += {\centering\zihao{3}}}}
\printbibliography
}




%% make publications
\newenvironment{publications}[1]{
\ctexset{chapter={format += {\centering\zihao{3}}}}
{\Nchapter{\NJUST@label@publications}}
\@mkboth{\MakeUppercase\NJUST@label@publications}
{\MakeUppercase\NJUST@label@publications}%
\list{\@biblabel{\@arabic\c@enumiv}}%
{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \setlength{\itemsep}{5pt}
    \setlength{\parsep}{0pt}
    \setlength{\parskip}{0pt}
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
\sloppy
\clubpenalty4000
\@clubpenalty \clubpenalty
\widowpenalty4000%
\sfcode`\.\@m
}
{\def\@noitemerr{\@latex@warning{Empty `publications' environment}}\endlist}




%% make thanks
\renewenvironment{thanks}{
\ctexset{chapter={format += {\centering\zihao{3}}}}
{\Nchapter{\NJUST@label@thanks}}
}{}




%% public vars for thesis
\newcounter{nlgcounter}
\newenvironment{nlglist}{
    \begin{list}{(\arabic{nlgcounter})}{
            \usecounter{nlgcounter}
            \setlength{\leftmargin}{0cm}
            \setlength{\parsep}{\parskip}
            \setlength{\topsep}{1ex}
            \setlength{\itemsep}{0.4ex plus 0.5ex}
            \setlength{\labelsep}{0.3em}
            \setlength{\itemindent}{46pt}
            \setlength{\listparindent}{27pt}
        }}
        {\end{list}}
\renewcommand{\labelenumi}{(\theenumi)}




\endinput
%% end of file `njustThesis.cls'.
