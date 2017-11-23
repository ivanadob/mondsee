<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"  xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="1.0">
    <xsl:output media-type="text/html" method="html"></xsl:output>
    <xsl:template match="/">
        <html>
            <head>        
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
                <h1>
                    Number of entries:
                    <strong><xsl:value-of select="count(.//tei:row[.//tei:cell[65]/text() and .//tei:cell[3]/text()]) "/></strong>
                </h1>
              <xsl:for-each select=".//tei:row">
                    <xsl:choose>
                        <xsl:when test=".//tei:cell[65]/text() and .//tei:cell[3]/text()">
                            <p><table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th width="50%"><xsl:value-of select="./tei:cell[1]"/></th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    <td>Fragment title</td>
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
                                    <td>Fragment Subtitle</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Material</td>
                                    <td><xsl:value-of select="./tei:cell[10]"/></td>
                                </tr>
                                <tr>
                                    <td>Place of Origin</td>
                                    <td><xsl:value-of select="./tei:cell[47]"/></td>
                                </tr>
                                <tr>
                                    <td>Date</td>
                                    <td><xsl:value-of select="./tei:cell[46]"/></td>
                                </tr>
                                <tr>
                                    <td>Document type</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Library</td>
                                    <td><xsl:value-of select="substring-before(./tei:cell[1], ':')"/></td>
                                </tr>
                                <tr>
                                    <td>Shelfmark</td>
                                    <td><xsl:value-of select="substring-after(./tei:cell[1], ': ')"/></td>
                                </tr>
                                <tr>
                                    <td>Page/Folio Reference</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Number of Fragment Items</td>
                                    <td><xsl:choose>
                                        <xsl:when test="(./tei:cell[2]/text()) = 'a'">
                                            <xsl:value-of select="./tei:cell[12]"/>
                                        </xsl:when>
                                        <xsl:when test="(./tei:cell[2]/text()) = 'i'">
                                            <i>Summarize: </i>
                                            <xsl:value-of select="./tei:cell[23]"/>
                                            <xsl:value-of select="./tei:cell[12]"/>
                                            <xsl:value-of select="./tei:cell[42]"/>
                                        </xsl:when>
                                    </xsl:choose></td>
                                </tr>
                                <tr>
                                    <td>Current Dimensions (in mm)</td>
                                    <td><xsl:value-of select="./tei:cell[13]"/></td>
                                </tr>
                                <tr>
                                    <td>Online Since</td>
                                    <td><i>Choose date</i></td>
                                </tr>
                                <tr>
                                    <td>Preview Page</td>
                                    <td><i>Choose an image after uploading the images</i></td>
                                </tr>
                                <tr>
                                    <td>Image Rights</td>
                                    <td>CC BY-NC</td>
                                </tr>
                                <tr>
                                    <td>Facet Language</td>
                                    <td><xsl:value-of select="./tei:cell[55]"/></td>
                                </tr>
                                <tr>
                                    <td>Facet Century</td>
                                    <td><xsl:value-of select="./tei:cell[45]"/></td>
                                </tr>
                                <tr>
                                    <td>Facet Liturgica</td>
                                    <td><xsl:value-of select="./tei:cell[54]"/></td>
                                </tr>
                                <tr>
                                    <td>Facet Script</td>
                                    <td><xsl:value-of select="./tei:cell[43]"/></td>
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
</xsl:stylesheet>