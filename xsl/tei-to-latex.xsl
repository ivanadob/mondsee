<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
<!--    xsl stylesheet to transform xml tei5 MsDesc to LaTeX in a printed catalogue of mss or fragments outlook-->
    <xsl:output method="xml" encoding="UTF-8"/>
<!--    <xsl:output encoding="UTF-8"></xsl:output>-->
    <xsl:template match="/">
        \documentclass{article}
        \usepackage[ngerman]{babel}
        \usepackage[utf8]{inputenc}
        \usepackage{tabularx}
        \usepackage{natbib}
        \usepackage{graphicx}
        \usepackage{hyperref}
        \parskip=12pt
        
        \begin{document}
        
        
        \setcounter{secnumdepth}{0}
        <xsl:for-each select=".//tei:TEI">
            \begin{flushleft}
            \section{<xsl:value-of select=".//tei:msIdentifier/tei:idno"/> 
<!-- #########    this brings the olim Signatur (of the fragment or the hostvolume) if there was one -->
            <xsl:choose>
                <xsl:when test=".//tei:altIdentifier[@type='former']/tei:idno/text()">
                    <xsl:text> olim: </xsl:text><xsl:value-of select=".//tei:altIdentifier[@type='former']/tei:idno"></xsl:value-of>
                </xsl:when>
            </xsl:choose>
<!--  ########    this brings the Makulaturtyp in brackets-->
             <xsl:choose>
                 <xsl:when test=".//tei:altIdentifier[@type='partial']/tei:idno/text()">
                     <xsl:text> (</xsl:text><xsl:value-of select=".//tei:altIdentifier[@type='partial']/tei:idno"></xsl:value-of>)
                </xsl:when>
            </xsl:choose>}
            \end{flushleft}
<!-- #######    brings the title, composed of author and title -->
            \subsection{<xsl:value-of select=".//tei:head/tei:title"/>}
             <xsl:value-of select=".//tei:support/tei:material"/>, <xsl:value-of select=".//tei:condition/tei:p[1]"/> 
            \newline
            <xsl:value-of select=".//tei:head/tei:origDate"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:head/tei:origPlace"/>
            
<!-- #######    brings section with info on the Makulatur-->
           \noindent
           \begin{tabularx}{\textwidth}{@{}l@{\quad}X@{}}
            \textbf{M:} &amp;
            Heutige Maße der Makulatur: <xsl:value-of select=".//tei:condition/tei:p[2]"/> \end{tabularx}
           
<!-- ########   brings section with info on the original size of the fragmented leaf-->
            \noindent
            \begin{tabularx}{\textwidth}{@{}l@{\quad}X@{}}
            \textbf{B:} &amp;
            Blattgröße der ursprünglichen Handschrift: <xsl:choose>
                <xsl:when test=".//tei:extent/tei:dimensions[@type='leaf_orig']/tei:width/text()">
                    <xsl:value-of select=".//tei:extent/tei:dimensions[@type='leaf_orig']/tei:width"/><xsl:text> X </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>? X </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test=".//tei:extent/tei:dimensions[@type='leaf_orig']/tei:height/text()">
                    <xsl:value-of select=".//tei:extent/tei:dimensions[@type='leaf_orig']/tei:height"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>?</xsl:text>
                </xsl:otherwise>
            </xsl:choose> mm
            \end{tabularx}            
<!-- #########     Schriftraum-->
            \noindent
            \begin{tabularx}{\textwidth}{@{}l@{\quad}X@{}}
            \textbf{S:} &amp;
            Schriftraum: <xsl:choose>
                <xsl:when test=".//tei:extent/tei:dimensions[@type='written_orig']/tei:width/text()">
                    <xsl:value-of select=".//tei:extent/tei:dimensions[@type='written_orig']/tei:width"/><xsl:text> X </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> ? X </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test=".//tei:extent/tei:dimensions[@type='written_orig']/tei:height/text()">
                    <xsl:value-of select=".//tei:extent/tei:dimensions[@type='written_orig']/tei:height"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>?</xsl:text>
                </xsl:otherwise>
            </xsl:choose> mm. <!--Spalte, Zeile und Hohe der einzelzeile-->
            <xsl:value-of select="normalize-space(string-join(.//tei:layout/text(), ' '))"/> Schrift: <xsl:value-of select=".//tei:handNote"/> 
            <xsl:value-of select=".//tei:musicNotation"/>
            <xsl:if test=".//tei:decoNote[1]/text()">
                <xsl:value-of select=".//tei:decoNote[1]"/><xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select=".//tei:history/tei:origin/tei:p[1]"/> \end{tabularx}              
            <xsl:if test=".//tei:decoNote[2]/text()">
                \noindent
                \begin{tabularx}{\textwidth}{@{}l@{\quad}X@{}}
                \textbf{A:} &amp; 
                <xsl:value-of select=".//tei:decoNote[2]"/> \end{tabularx}
            </xsl:if>
                                  
            \noindent
            \begin{tabularx}{\textwidth}{@{}l@{\quad}X@{}}
            \textbf{G:} &amp;
            <xsl:apply-templates select="normalize-space(string-join(.//tei:history/tei:provenance, ' '))"/>
            \end{tabularx}
            
            <xsl:if test=".//tei:history/tei:origin/tei:p[2]/text()">  
                \noindent
                \begin{tabularx}{\textwidth}{@{}l@{\quad}X@{}}
                \textbf{Z:} &amp;
                <xsl:value-of select=".//tei:origin/tei:p[2]"/>
                \end{tabularx}
            </xsl:if>
            
            \noindent
            \begin{tabularx}{\textwidth}{@{}l@{\quad}X@{}}
            \textbf{I:} &amp;
            <xsl:choose>
                <xsl:when test=".//tei:msItem/tei:author/text()">
                    <xsl:apply-templates select=".//tei:msItem/tei:author"/>: <xsl:apply-templates select=".//tei:msItem/tei:title"/>
                </xsl:when>
                <xsl:otherwise><xsl:apply-templates select=".//tei:msItem/tei:title"/></xsl:otherwise>
            </xsl:choose>
            \newline
            <xsl:apply-templates select=".//tei:msItem/tei:note[@type='description']"/>
            <xsl:if test=".//tei:msItem/tei:note/tei:bibl/text()">
                \newline
                Ed.: <xsl:value-of select=".//tei:msItem/tei:note/tei:bibl"/>
            </xsl:if>
            \end{tabularx}
            
            <xsl:if test=".//tei:listBibl/tei:bibl/text()">
                \noindent
                \begin{tabularx}{\textwidth}{@{}l@{\quad}X@{}}
                \textbf{L:} &amp;
                <xsl:apply-templates select=".//tei:listBibl/tei:bibl"/>
                \end{tabularx}
            </xsl:if>
                      
        </xsl:for-each>
        \end{document}
    </xsl:template>
    
    <xsl:template match="tei:quote">
        <xsl:value-of select="normalize-space(concat('\textit{', ., '}'))"/>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='rubric']">
        <xsl:value-of select="concat('\frqq ', ., '\flqq ')"/>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <xsl:value-of select="concat('\href{', @target, '}{', ./text(), '}')"/>
    </xsl:template>
</xsl:stylesheet>