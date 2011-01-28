%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clase para formatear las tesis, memorias o trabajos de 
% titulo de la Universidad de Chile
% Autor: Sebastian Kreft C.
% v1.0 15/03/2009
% http://www.dcc.uchile.cl/~skreft/tesis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificaciones por Felipe Lema
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uchile}[ 2009/03/15 Tesis Universidad de Chile ]


%% Cargamos los paquetes necesarios
%\ifx\pdftexversion\undefined
%  \RequirePackage[pdftex]{graphicx}
  % declare the path(s) where your graphic files are
  %\graphicspath{{./img/}}
  % and their extensions so you won't have to specify these with
  % every instance of \includegraphics
%  \DeclareGraphicsExtensions{.pdf,.jpeg,.png}
%\else
  % or other class option (dvipsone, dvipdf, if not using dvips). graphicx
  % will default to the driver specified in the system graphics.cfg if no
  % driver is specified.
%  \RequirePackage[dvips]{graphicx}
  % declare the path(s) where your graphic files are
  %\graphicspath{{./img/}}
  % and their extensions so you won't have to specify these with
  % every instance of \includegraphics
%  \DeclareGraphicsExtensions{.eps}
%\fi
%\ifx\pdftexversion\undefined
%DVI
%\else
%PDF
%\fi
\RequirePackage[pdftex]{graphicx} %necesario para incluir el escudo de la universidad
%\graphicspath{{./img/}}
\graphicspath{{../escritura/img/}}
%\graphicspath{{/home/felipe/u/memoria_repo_universidad/felema/memoria/69F/escritura/img}}
\DeclareGraphicsExtensions{.pdf,.png,.jpeg,.jpg}
\RequirePackage{multirow} %necesario para insertar bien el logo
%no se como hacer para que funcionen los margenes desde esta clase
%\RequirePackage{anysize}
%\papersize{21.5cm}{28.0cm}
%\marginsize{3.0cm}{2.0cm}{2.0cm}{2.0cm}
% Fijamos los margenes
%\usepackage[top=0cm, bottom=0cm, left=0cm, right=0cm]{geometry} 
%\setlength{\voffset}{0cm}	
%\setlength{\hoffset}{0cm}	
%\setlength{\oddsidemargin}{0.0cm}	
%\setlength{\evensidemargin}{0.0cm}	
%\setlength{\topmargin}{0.0cm}		
%\setlength{\textwidth}{14.0cm}		
%\setlength{\textheight}{21.5cm}		
%\setlength{\marginparsep}{0cm}

%agregar todos los tipos de papeles distintos a letterpaper
\DeclareOption{a4paper}{\ClassError { uchile } { Papel A4 no es valido para las tesis } { Indicar letterpaper en las opciones del docuemento o no asignar ningun papel  }}
\DeclareOption{legalpaper}{\ClassError { uchile } { Papel Legal no es valido para las tesis } { Indicar letterpaper en las opciones del docuemento o no asignar ningun papel  }}
\DeclareOption{color}{\gdef\@logofile{escudocolor}}
\DeclareOption{bw}{\gdef\@logofile{escudo}}
%\DeclareOption{decimalpoint}{}%Usa punto en vez de coma
\DeclareOption{singlespace}{\gdef\@space{1.0}}%Espacio Simple
\DeclareOption{doublespace}{\gdef\@space{2.0}}%Espacio Doble
\DeclareOption{defaultspace}{\gdef\@space{1.5}}%Espacio y Medio
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{color}
\ExecuteOptions{defaultspace}
\ProcessOptions\relax
%  Tesis se parace mucho a un report
\LoadClass{report}

%% Definimos nuevos comandos para definir la portada
\newcommand{\departamento}{\gdef\@departamento}
\newcommand{\facultad}{\gdef\@facultad}
\newcommand{\universidad}{\gdef\@universidad}
\newcommand{\trabajoygrado}{\gdef\@trabajoygrado}
\newcommand{\pais}{\gdef\@pais}
\newcommand{\ciudad}{\gdef\@ciudad}
\newcommand{\yearpub}{\gdef\@year}
\newcommand{\monthpub}{\gdef\@month}
\newcommand{\profguia}{\gdef\@profguia}
\newcommand{\profcoguia}{\gdef\@profcoguia}
\newcommand{\profint}{\gdef\@profint}
\newcommand{\profinta}{\gdef\@profinta}
\newcommand{\profintb}{\gdef\@profintb}
\newcommand{\proyecto}{\gdef\@proyecto}

%%%%%%%%%%%%%%%%%%%%%%
%Constants used in the class
%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\bibliographyname}{Referencias}
%%%%%%%%%%%%%%%%%%%%%%

%% Definimos el espacio a usar
\renewcommand{\baselinestretch}{\@space}

\renewcommand{\maketitle}{%
\thispagestyle{empty}
\renewcommand{\baselinestretch}{1}
\begin{tabular}{ll}
%fix the image size
\multirow{3}{*}{\includegraphics[height=84pt,width=42pt]{\@logofile}}
&\\
&\large{\MakeUppercase{\@universidad}}\\
&\large{\MakeUppercase{\@facultad}}\\
&\large{\MakeUppercase{\@departamento}}\\
&\\
\end{tabular}

%\includegraphics[height=84pt,width=42pt]{\@logofile}
%\includegraphics[height=84pt,width=42pt]{escudo.png}
\begin{center}
%{\large \MakeUppercase{\@universidad} \\
%\MakeUppercase{\@facultad}\\
%\MakeUppercase{\@departamento}\\}

%\hrulefill

\vskip 1.75cm%
{\large \MakeUppercase{\@title}}\\
\vskip 1.5cm%
{\large \MakeUppercase{\@trabajoygrado}}\\
\vskip 1.75cm%
{\large \MakeUppercase{\@author}}\\
%skreft@dcc.uchile.cl\\
%99175936\\
\vskip 2.0cm%
%\hrulefill
%\\
\MakeUppercase{Profesor gu\'ia:}\\
\MakeUppercase{\@profguia}\\

\vskip 0.75cm
\MakeUppercase{Miembros de la Comisi\'on:}\\
\MakeUppercase{\@profcoguia}\\
\MakeUppercase{\@profint}\\
\ifx \@profinta \undefined
{}
\else
\MakeUppercase{\@profinta}\\
\fi
\ifx \@profintb \undefined
{}
\else
\MakeUppercase{\@profintb}\\
\fi

\vskip 1.25cm%
\begin{small}
\MakeUppercase{\@ciudad{} de \@pais}\\
\MakeUppercase{\@month{} \@year}\\
\end{small}
\vskip 1.25cm%
%\line(1,0){350} \\
%ESTE TRABAJO HA SIDO FINANCIADO POR EL PROYECTO \MakeUppercase{\@proyecto}. \\
%\line(1,0){350} \\
\ifx \@proyecto \undefined
{}
\else
\begin{footnotesize}
\begin{tabular}{c}
	\hline
\\
%\MakeUppercase{\@proyecto}\\
\@proyecto\\
\\
	\hline
\end{tabular}
\end{footnotesize}
\fi
%\fbox{Este trabajo ha sido financiado por el proyecto \@proyecto .}

%\hrule

%\hbox to \hsize{\hfill
%    \vrule height 0.4pt width 0.8\hsize
%    \hfill}
%\hfill \hrule width 0.8\hsize
%\hfill
\end{center}
\newpage
}
%\renewcommand{\chapter}[1]{\chapter{\MakeUppercase{#1}}}
%\newcommand{\preamble}{\pagenumbering{Roman}}
%\newcommand{\text}{\pagenumbering{arabic}}


%% Le cambiamos el nombre a toc
\let\oldtableofcontents=\tableofcontents
\renewcommand{\tableofcontents}{
	\renewcommand{\contentsname}{\'Indice General}
	\oldtableofcontents
}
%% Cambiamos section cuando estamos en el prefacio
\let\oldsection=\section
\let\oldthesection=\thesection
\newenvironment{preface}{
        \pagenumbering{roman}
        \pagestyle{plain}
		\renewcommand{\section}[1]{%
			\cleardoublepage
			\phantomsection
    	    \addcontentsline{toc}{chapter}{##1}
			\chapter*{##1}
		}
}{
		\newpage
    %    \tableofcontents
    %    \iftablespage
    %            \listoftables
    %    \fi
    %    \iffigurespage
    %            \listoffigures
    %    \fi
    %    \cleardoublepage
        \pagenumbering{arabic}
        \pagestyle{headings}
		\let\section=\oldsection
}
\newenvironment{additional}{
		\renewcommand{\section}[1]{%
			\cleardoublepage
			\phantomsection
    	    \addcontentsline{toc}{chapter}{##1}
			\chapter*{##1}
		}
}{
		\newpage
		\let\section=\oldsection
}
%ver que pasa cuando no se entregan todos los paramteros%
\newcommand{\makeeval}{%
%\thispagestyle{empty}
\renewcommand{\baselinestretch}{1}
\begin{center}
{\large \MakeUppercase{\@universidad} \\
\MakeUppercase{\@facultad}\\
\MakeUppercase{\@escuela}\\}
\vskip 2em%
{\Large \MakeUppercase{\@title} }\\
\vskip 2em%
\MakeUppercase{\@author}\\
\end{center}
\vskip 2em%
\begin{tabular}{lccc}
COMISI\'ON & NOTA & CALIFICACIONES & FIRMA \\
EXAMINADORA & (n) & (letras) &  \\
PROFESOR GU\'IA& & & \\
\MakeUppercase{\@profguia} & .........&.............&.............\\
PROFESOR CO-GU\'IA & & & \\
%\MakeUppercase{\@profco} & .........&.............&.............\\
PROFESOR INTEGRANTE & & & \\
%\MakeUppercase{\@profint} & .........&.............&.............\\
\end{tabular}
\begin{center}
\@trabajoygrado\\
\vskip 2em%
\@ciudad, \@pais.\\
\@year
\end{center}
\newpage
}

%%definimos un ambiente para los apendices
%los que tienen 2 %% estan comentados
\renewenvironment{appendix}{
     \phantomsection
   	   \addcontentsline{toc}{chapter}{Ap\'endices}
	\chapter*{Ap\'endices}
		\setcounter{section}{0}
       % \pagenumbering{roman}
        %\pagestyle{plain}
		%\renewcommand{\section}[1]{%
    	%    \oldsection{##1}
		%}
	\renewcommand{\thesection}{
		\Alph{section}
	}
}{
	%	\newpage
    %    \tableofcontents
    %    \iftablespage
    %            \listoftables
    %    \fi
    %    \iffigurespage
    %            \listoffigures
    %    \fi
    %    \cleardoublepage
    %    \pagenumbering{arabic}
    %    \pagestyle{headings}
		\let\thesection=\oldthesection
}
\newcommand{\grafica}[4]{
\begin{figure}[!ht]
\begin{center}
\includegraphics[scale=#4]{#1}\\
\end{center}
\caption{{\small #2}}
\label{#3}
\end{figure}
}

%%%ver \sectionmark

%%%%%%%%%%%%%%%%%
%modifications to bibliography
%%%%%%%%%%%%%%%%%
%save the old bibliography
\let\oldbiblio=\bibliography
%redefine the bibliography in order to get the names we want and listed in the index
\renewcommand{\bibliography}[2]{
%add it to the index
\cleardoublepage
\phantomsection
\addcontentsline{toc}{chapter}{\bibliographyname}
%change the name to what we want
\renewcommand{\bibname}{\bibliographyname}
%call the old bibilo command
\oldbiblio{#1}{#2}
\newpage
}

\newcommand{\dedicatoria}[1]{
\newpage
%quitar el numero de pagina de la dedicatoria
\thispagestyle{empty}
\subsubsection*{}
\vskip 5cm
\begin{flushright}
\emph{#1}
\end{flushright}
}
%Todo macro
%\newcommand{\TODO}[1]{
%	\textbf{TODO:} #1\\
%}
\newcommand{\listoftodos}{\@starttoc{fix}}
\newcommand{\TODO}[1]{\textbf{TODO:} \textbf{\textit{#1}}\marginpar{$\bigcirc$}%
   \phantomsection\addcontentsline{fix}{todo}{#1}}
\newcommand{\FIXME}[1]{\textbf{FIXME:} \textbf{\textit{#1}}\marginpar{$\mathcal{F}$}%
   \phantomsection\addcontentsline{fix}{fixme}{#1}}
\newcommand{\l@todo}[2]{\par\noindent{}\textbf{TODO :} #1 ...............  #2}
\newcommand{\l@fixme}[2]{\par\noindent{}\textbf{FIXME:} #1 ...............  #2}
