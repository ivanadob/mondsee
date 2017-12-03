<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
<!--    xsl stylesheet to transform xml tei5 MsDesc to LaTeX in a printed catalogue of mss or fragments outlook-->
    <xsl:output media-type="text/plain" method="text"></xsl:output>
    <xsl:template match="/">
        \documentclass{article}
        \usepackage[ngerman]{babel}
        \usepackage[utf8]{inputenc}
        \title{Die Fragmente aus Kloster Mondsee}
        \author{Ivana Dobcheva and Larissa Rassinger}
        \date{2017}
        
        \usepackage{natbib}
        \usepackage{graphicx}
        
        \begin{document}
        
        \maketitle
        \setcounter{secnumdepth}{0}
        
        \section{}
        \begin{flushright}
        Fragm. 1
        \end{flushright}
        \subsection{Graduale}
        \begin{tabbing}
        \hspace*{2cm}\=\hspace*{2cm}\=\hspace*{2cm}\= \kill
        Umfang \> Masse \> 12. Jh. \> Mondsee
        \end{tabbing}
        \subsection{}
        Material, Orig. size etc.
        \subsection{Inhalt}
        (1r) blabla
        \subsection{Entstehung}
        Mondsee
        \subsection{Provenienz}
        \subsection{Lit.}
        
        \end{document}        
    </xsl:template>
</xsl:stylesheet>