%vim: set ft=latex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NUSThesis}[2019/10/08  NUS Thesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass{report}

\RequirePackage[top=1.2in, bottom=1.2in,outer=1.5in, inner=1.5in, headheight=2cm, footskip=2cm, heightrounded]{geometry}
\RequirePackage[font=singlespacing]{caption}
\RequirePackage{setspace}
\doublespacing
