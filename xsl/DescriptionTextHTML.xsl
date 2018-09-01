<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"  xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output media-type="text/html" method="html" encoding="UTF-8"></xsl:output>
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
                <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>
                    
                    <!-\- jQuery library -\->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                    
                    <!-\- Latest compiled JavaScript -\->
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
                <!--<style>
                    table {
                    border-collapse: collapse;
                    width: 50%;                  
                    }
                    
                    th, td {
                    text-align: left;
                    padding: 8px;
                    }
                    
                    tr:nth-child(even) {background-color: #f2f2f2;}
                </style>-->
                <style>
                    table {
                    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                    }
                    
                    td, th {
                    border: 1px solid #ddd;
                    padding: 8px;
                    }
                    
                    tr:nth-child(even){background-color: #f2f2f2;}
                    
                    tr:hover {background-color: #ddd;}
                    
                    th {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #4CAF50;
                    color: white;
                    }
                </style>
            </head>
            <body>
                <h1>Fragmente mit Beschreibungen (nur Text)</h1>
                <xsl:for-each select=".//tei:row">
                    <xsl:choose>
                        <xsl:when test=".//tei:cell[64]/text() and not(.//tei:cell[67]/text())">
                            <p><table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th width="50%"><xsl:value-of select="./tei:cell[1]"/></th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="./tei:cell[54]/text()">
                                                    <xsl:value-of select="./tei:cell[54]"/>
                                                </xsl:when>
                                                <xsl:when test="./tei:cell[50]/text()">
                                                    <xsl:value-of select="./tei:cell[50]"/>
                                                </xsl:when>
                                                <xsl:when test="./tei:cell[52]/text()">
                                                    <xsl:value-of select="./tei:cell[52]"/>
                                                </xsl:when>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                   <tr>
                                       <td><xsl:value-of select="./tei:cell[12]"/></td>
                                   </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[22]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[40]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[41]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[42]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[43]"/>; <xsl:value-of select="./tei:cell[44]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[48]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[51]"/> <xsl:value-of select="./tei:cell[53]"/> <xsl:value-of select="./tei:cell[54]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:apply-templates select="./tei:cell[56]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[57]"/></td>
                                    </tr>
                                    <tr>
                                        <td><xsl:value-of select="./tei:cell[61]"/>. <xsl:value-of select="./tei:cell[62]"/>. <xsl:value-of select="./tei:cell[63]"/></td>
                                    </tr>
                                </tbody>
                            </table></p>
                            <hr/>
                        </xsl:when>
                        
                    </xsl:choose>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'italic']">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'color(FFFF0000)']">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
</xsl:stylesheet>