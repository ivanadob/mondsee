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
        \usepackage{hyperref}
        
        \begin{document}
        
        \maketitle
        \setcounter{secnumdepth}{0}
        <xsl:for-each select=".//tei:TEI">
            \begin{flushright}
            \section{<xsl:value-of select=".//tei:msIdentifier/tei:idno"/>}
            <xsl:choose>
                <xsl:when test=".//tei:altIdentifier/tei:idno/text()">
                    <xsl:text> olim: </xsl:text><xsl:value-of select=".//tei:altIdentifier/tei:idno"></xsl:value-of>
                </xsl:when>
            </xsl:choose>
<!--            this brings the Makulaturtyp in brackets-->
            <xsl:choose>
                <xsl:when test="contains(.//tei:provenance/tei:p[3] , 'In situ')">
                    <xsl:text> (</xsl:text><xsl:value-of select="substring-after(.//tei:provenance/tei:p[2], ': ')"></xsl:value-of><xsl:text>)</xsl:text>
                </xsl:when>
            </xsl:choose>
            \end{flushright}
            \subsection{<xsl:value-of select=".//tei:head/tei:title"/>}
            \begin{tabbing}
            \hspace*{2cm}\= \kill
            <xsl:value-of select=".//tei:head/tei:origDate"/> \> <xsl:value-of select=".//tei:head/tei:origPlace"/>
            \end{tabbing}
            
            <xsl:value-of select=".//tei:support/tei:material"/>, <xsl:value-of select=".//tei:condition"/>
           
            
            \subsection{Inhalt}
            <xsl:apply-templates select=".//tei:msItem/tei:note[@type='description']"></xsl:apply-templates>
            
            <xsl:if test=".//tei:musicNotation/text()">
                Musiknotation: <xsl:value-of select=".//tei:musicNotation"/>
            </xsl:if>
            
            \subsection{Ursprünglichen HS}
            Schrift: <xsl:value-of select=".//tei:handNote"></xsl:value-of>;
            Blatt: <xsl:apply-templates select=".//tei:extent/tei:dimentions[@type='leaf_orig']"></xsl:apply-templates>;
            Schriftraum: <xsl:apply-templates select=".//tei:extent/tei:dimentions[@type='written_orig']"></xsl:apply-templates>;
            <xsl:value-of select=".//tei:layoutDesc/tei:layout[2]"/><xsl:value-of select=".//tei:layoutDesc/tei:layout[3]"/>
            <xsl:choose>
                <xsl:when test=".//tei:layout[3][@columns='2']">
                    Spaltebreite: <xsl:value-of select=".//tei:layout[1]"/>
                </xsl:when>
            </xsl:choose>
            
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