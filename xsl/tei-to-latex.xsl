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
            \section{<xsl:value-of select=".//tei:msIdentifier/tei:idno"/> 
           
            <xsl:choose>
                <xsl:when test=".//tei:altIdentifier[@type='former']/tei:idno/text()">
                    <xsl:text> olim: </xsl:text><xsl:value-of select=".//tei:altIdentifier/tei:idno"></xsl:value-of>
                </xsl:when>
            </xsl:choose>
<!--            this brings the Makulaturtyp in brackets-->
             <xsl:choose>
                 <xsl:when test=".//tei:altIdentifier[@type='partial']/tei:idno/text()">
                     <xsl:text> (</xsl:text><xsl:value-of select=".//tei:altIdentifier[@type='partial']/tei:idno"></xsl:value-of>)
                </xsl:when>
            </xsl:choose>}
            \end{flushright}
            \subsection{<xsl:value-of select=".//tei:head/tei:title"/>}
            \begin{tabbing}
            \hspace*{4cm}\= \kill
            <xsl:value-of select=".//tei:head/tei:origDate"/> \> <xsl:value-of select=".//tei:head/tei:origPlace"/>
            \end{tabbing}
            <xsl:value-of select=".//tei:support/tei:material"/>, <xsl:value-of select=".//tei:condition/tei:p[1]"/>                       
            \subsection{Ursprünglichen Handschrift}
<!--            Blatt-->
            <xsl:choose>
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
            </xsl:choose>
<!--            Schriftraum-->
            <xsl:choose>
                <xsl:when test=".//tei:extent/tei:dimensions[@type='written_orig']/tei:width/text()">
                    <xsl:text> [</xsl:text><xsl:value-of select=".//tei:extent/tei:dimensions[@type='written_orig']/tei:width"/><xsl:text> X </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> [? X </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test=".//tei:extent/tei:dimensions[@type='written_orig']/tei:height/text()">
                    <xsl:value-of select=".//tei:extent/tei:dimensions[@type='written_orig']/tei:height"/><xsl:text>]</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>?]</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
 <!--Spalte, Zeile und Hohe der einzelzeile-->
            <xsl:value-of select="normalize-space(string-join(.//tei:layoutDesc/text(), ' '))"/>           
                        
            \subsection{Zustand}
            <xsl:value-of select=".//tei:condition/tei:p[2]"/>
            
            \subsection{Schrift}
            <xsl:value-of select=".//tei:handNote"/>
            
            <xsl:if test=".//tei:decoNote/text()">
                \subsection{Ausstatung} <xsl:value-of select=".//tei:decoNote"/>
            </xsl:if>
            <xsl:if test=".//tei:musicNotation/text()">
                \subsection{Musiknotation} <xsl:value-of select=".//tei:musicNotation"/>
            </xsl:if>
            \subsection{Entstehung}
            <xsl:value-of select=".//tei:history/tei:origin/tei:p[1]"/>
            
            \subsection{Provenienz} 
            <xsl:apply-templates select="normalize-space(string-join(.//tei:history/tei:provenance, ' '))"/>
            
            <xsl:if test=".//tei:history/tei:origin/tei:p[2]/text()">            
            \subsection{Dazugehörige Fragmente}<xsl:value-of select=".//tei:origin/tei:p[2]"/>
            </xsl:if>
            
            \subsection{Inhalt}
            <xsl:choose>
                <xsl:when test=".//tei:msItem/tei:author/text()">
                    <xsl:apply-templates select=".//tei:msItem/tei:author"/>: <xsl:apply-templates select=".//tei:msItem/tei:title"/>
                </xsl:when>
                <xsl:otherwise><xsl:apply-templates select=".//tei:msItem/tei:title"/></xsl:otherwise>
            </xsl:choose>
            \newline
            <xsl:apply-templates select=".//tei:msItem/tei:note[@type='description']"/>
            
            <xsl:if test=".//tei:listBibl/tei:bibl/text()">
            \subsection{Lit.} <xsl:value-of select=".//tei:listBibl/tei:bibl"/>
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