<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
<!--    xsl stylesheet to transform xml tei5 MsDesc to LaTeX in a printed catalogue of mss or fragments outlook-->
    <xsl:output media-type="text/plain" method="text"/>
    <xsl:template match="/">
        \documentclass{article}
        \usepackage[ngerman]{babel}
        \usepackage[utf8]{inputenc}
        \title{}
        \author[]{}
        \usepackage{natbib}
        \usepackage{graphicx}
        
        \begin{document}
        
        \maketitle
        \setcounter{secnumdepth}{0}
        <xsl:for-each select=".//tei:TEI">
            \section{}
            \begin{flushright}
            <xsl:value-of select=".//tei:msIdentifier/tei:idno"/>
            <xsl:choose>
                <xsl:when test=".//tei:altIdentifier/tei:idno/text()">
                    <xsl:text> olim: </xsl:text><xsl:value-of select=".//tei:altIdentifier/tei:idno"></xsl:value-of>
                </xsl:when>
            </xsl:choose>
            \end{flushright}
            \subsection{<xsl:value-of select=".//tei:head/tei:title"/>}
            \begin{tabbing}
            \hspace*{3cm}\=\hspace*{2cm}\=\hspace*{2cm}\=\hspace*{2cm}\= \kill
            <xsl:value-of select=".//tei:support/tei:dim"/> \> <xsl:value-of select=".//dimentions"/> \> <xsl:value-of select=".//tei:head/tei:origDate"/> \> <xsl:value-of select=".//tei:head/tei:origPlace"/>
            \end{tabbing}
                        
            \subsection{Inhalt}
            <xsl:value-of select=".//tei:msItem/tei:note[@type='description']"></xsl:value-of>
            
            <xsl:if test=".//tei:musicNotation/text()">
                Musiknotation: <xsl:value-of select=".//tei:musicNotation"/>
            </xsl:if>
            
            \subsection{Entstehung}
            <xsl:value-of select=".//tei:history/tei:origin"/>
            \subsection{Provenienz} 
            <xsl:value-of select=".//tei:history/tei:provenance"/>
            <xsl:if test=".//tei:listBibl/tei:bibl/text()">
                \subsection{Lit.} <xsl:value-of select=".//tei:listBibl/tei:bibl"/>
            </xsl:if>
           
            \end{document}
        </xsl:for-each>
        
        
        
        
    </xsl:template>
</xsl:stylesheet>