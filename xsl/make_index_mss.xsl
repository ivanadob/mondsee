<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all" version="2.0">
    
    <xsl:import href="nav_bar.xsl"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Mondsee Scriptorium</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link rel="stylesheet" type="text/css" href="css/mondsee.css"/>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
                <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jq-3.3.1/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.css" />
                
                <script src="js/dt.js"></script>
                
            </head>
            
            <body>
                <xsl:call-template name="nav_bar"/>
                <div class="container">
                    <table class="table table-striped display" id="msdescTable" style="width:100%">
                        <thead>
                            <tr>
                                <th scope="col">Shelfmark</th>
                                <th scope="col" style="width:500px">Title</th>
                                <th scope="col">Date</th>
                                <th scope="col">Place</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="collection('../data/descriptions')//tei:TEI">
                                <xsl:variable name="full_path">
                                    <xsl:value-of select="document-uri(/)"/>
                                </xsl:variable>
                                <xsl:variable name="docId">
                                    <xsl:value-of select="tokenize($full_path, '/')[last()]"/>
                                </xsl:variable>
                                <tr>
                                    <td>                                        
                                        <a>
                                            <xsl:attribute name="href">                                                
                                                <xsl:value-of select="replace($docId, '.xml', '.html')"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="..//tei:fileDesc/tei:titleStmt/tei:title"/>
                                        </a>
                                    </td>
                                    <td>
                                        <xsl:value-of select="..//tei:msDesc/tei:head/tei:title"/>
                                        <xsl:if test="..//tei:msDesc/tei:head/tei:note/@type = 'summary'">
                                            <p>
                                                <xsl:apply-templates select="substring(string-join(..//tei:msDesc/tei:head/tei:note[@type = 'summary']/text()),1,50)"/>
                                                <span id="{$docId||'Dots'}">...</span>
                                                <span id="{$docId||'More'}" style="display:none">
                                                    <xsl:apply-templates select="substring(string-join(..//tei:msDesc/tei:head/tei:note[@type = 'summary']/text()),51)"/>
                                                </span>
                                            </p>
                                            <button onclick="onClick('{$docId}')" id="{$docId||'MyBtn'}" type="button"  class="btn btn-outline-dark">Read more</button>  
                                        </xsl:if>                                           
                                    </td>
                                    <td>
                                        <xsl:apply-templates select="..//tei:msDesc/tei:head/tei:origDate/@notBefore"/><xsl:text>-</xsl:text>
                                        <xsl:apply-templates select="..//tei:msDesc/tei:head/tei:origDate/@notAfter"/><xsl:text> (</xsl:text>
                                        <xsl:apply-templates select="..//tei:msDesc/tei:head/tei:origDate"/><xsl:text>)</xsl:text>
                                    </td>
                                    <td>
                                        <xsl:value-of select="..//tei:msDesc/tei:head/tei:origPlace"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
<!--                for button show more on mss summary-->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" />
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" />
                <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.js"></script>
                <script>
                    $(document).ready(function () {
                    createDataTable('msdescTable')
                    });
                </script>
                <script src="js/showMore.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'sup']">
        <sup><xsl:apply-templates/></sup>
    </xsl:template>
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>