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
                <h1>Fragmente mit Beschreibung</h1>
                <ol>
                <xsl:for-each select=".//tei:row">
                      <xsl:choose>
                          <xsl:when test=".//tei:cell[65]/text() and .//tei:cell[3]/text()"> <!--and not(.//tei:cell[7]/tei:ptr)-->
                              <li><table class="table table-hover">
                                  <thead>
                                      <tr>
                                          <th width="50%"><xsl:value-of select="./tei:cell[1]"/></th>
                                          
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <tr>
                                          <td>Fragmentarium entry</td>
                                          <td>
                                              <xsl:choose>
                                                  <xsl:when test="./tei:cell[7]/tei:ptr">
                                                      <xsl:value-of select="./tei:cell[7]/tei:ptr/@target"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      NOT YET
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </td>
                                      </tr>
                                      <tr>
                                      <td>Fragment title</td>
                                      <td>
                                          <xsl:choose>
                                              <xsl:when test="./tei:cell[52]/text()">
                                                  <xsl:value-of select="./tei:cell[52]"/><xsl:text>: </xsl:text><xsl:value-of select="./tei:cell[53]"/>
                                              </xsl:when>
                                              <xsl:when test="./tei:cell[54]/text()">
                                                  <xsl:value-of select="./tei:cell[54]"/>
                                              </xsl:when>
                                              <xsl:when test="./tei:cell[55]/text()">
                                                  <xsl:value-of select="./tei:cell[55]"/>
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
                                      <td><xsl:value-of select="./tei:cell[11]"/></td>
                                  </tr>
                                  <tr>
                                      <td>Place of Origin</td>
                                      <td><xsl:value-of select="./tei:cell[48]"/></td>
                                  </tr>
                                  <tr>
                                      <td>Date</td>
                                      <td><xsl:value-of select="./tei:cell[47]"/></td>
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
                                      <td>Page/Folio Reference &amp; Number of Fragment Items</td>
                                      <td><xsl:choose>
                                          <xsl:when test="(./tei:cell[2]/text()) = 'a'">
                                              <xsl:value-of select="./tei:cell[12]"/>
                                          </xsl:when>
                                          <xsl:when test="(./tei:cell[2]/text()) = 'i'">
                                              <i>Summarize: </i>
                                              <xsl:value-of select="./tei:cell[24]"/><xsl:text> </xsl:text> 
                                              <xsl:value-of select="./tei:cell[13]"/><xsl:text> </xsl:text>
                                              <xsl:value-of select="./tei:cell[43]"/> 
                                          </xsl:when>
                                      </xsl:choose></td>
                                  </tr>
                                  <tr>
                                      <td>Current Dimensions (in mm)</td>
                                      <td><xsl:value-of select="./tei:cell[14]"/></td>
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
                                          <td>Remarks</td>
                                          <td>
                                              <xsl:choose>
                                                  <xsl:when test="./tei:cell[10]/text()">
                                                      From the original manuscript survived the following fragments: <xsl:value-of select="./tei:cell[10]"/>.
                                                  </xsl:when>
                                              </xsl:choose>
                                          </td>
                                      </tr>
                                  <tr>
                                      <td>Facet Language</td>
                                      <td><xsl:value-of select="./tei:cell[56]"/></td>
                                  </tr>
                                  <tr>
                                      <td>Facet Century</td>
                                      <td><xsl:value-of select="./tei:cell[46]"/></td>
                                  </tr>
                                  <tr>
                                      <td>Facet Liturgica</td>
                                      <td><xsl:value-of select="./tei:cell[55]"/></td>
                                  </tr>
                                  <tr>
                                      <td>Facet Script</td>
                                      <td><xsl:value-of select="./tei:cell[44]"/></td>
                                  </tr>
                                      <tr>
                                          <td>Place</td>
                                          <td><xsl:value-of select="./tei:cell[48]"/></td>
                                      </tr>
                                      <tr>
                                          <td></td>
                                          <td><i>upload images; make sequence; choose preview page</i></td>
                                      </tr>
                                      <tr>
                                          <td><b>Description</b></td>
                                          <td></td>
                                      </tr>
                                      <tr>
                                          <td>Bibliographical reference</td>
                                          <td><xsl:value-of select="./tei:cell[65]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Language</td>
                                          <td>German</td>
                                      </tr>
                                      <tr>
                                          <td>Material</td>
                                          <td><xsl:value-of select="./tei:cell[11]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Date of origin</td>
                                          <td><xsl:value-of select="./tei:cell[46]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Script</td>
                                          <td><xsl:value-of select="./tei:cell[44]"/><xsl:text> </xsl:text><xsl:value-of select="./tei:cell[45]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Dimensions (Page Height):</td>
                                          <td><xsl:value-of select="./tei:cell[25]"/>-<xsl:value-of select="./tei:cell[26]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Dimensions (Page Width):  </td>
                                          <td><xsl:value-of select="./tei:cell[27]"/>-<xsl:value-of select="./tei:cell[28]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Height of written area</td>
                                          <td><xsl:value-of select="./tei:cell[29]"/>-<xsl:value-of select="./tei:cell[30]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Width of Written Area</td>
                                          <td><xsl:value-of select="./tei:cell[31]"/>-<xsl:value-of select="./tei:cell[32]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Number of Lines</td>
                                          <td><xsl:value-of select="./tei:cell[33]"/>-<xsl:value-of select="./tei:cell[34]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Number of Columns</td>
                                          <td><xsl:value-of select="./tei:cell[35]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Width of Columns</td>
                                          <td><xsl:value-of select="./tei:cell[36]"/>-<xsl:value-of select="./tei:cell[37]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Line Height</td>
                                          <td><xsl:value-of select="./tei:cell[38]"/>-<xsl:value-of select="./tei:cell[39]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Ruling</td>
                                          <td><xsl:value-of select="./tei:cell[40]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Numbering (pages, folios, etc.)</td>
                                          <td><xsl:value-of select="./tei:cell[41]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Collation</td>
                                          <td><xsl:value-of select="./tei:cell[42]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Current condition Dimensions</td>
                                          <td><xsl:value-of select="./tei:cell[14]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Remarks About the Current Condition</td>
                                          <td>Art der Verwendung im Trägerband: <xsl:value-of select="./tei:cell[24]"/><xsl:text>. </xsl:text> <xsl:value-of select="./tei:cell[43]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Decoration Description</td>
                                          <td><xsl:value-of select="./tei:cell[50]"/><xsl:text> </xsl:text><xsl:value-of select="./tei:cell[51]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Content Person</td>
                                          <td><xsl:value-of select="./tei:cell[52]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Text Language</td>
                                          <td><xsl:value-of select="./tei:cell[56]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Title</td>
                                          <td><xsl:value-of select="./tei:cell[55]"/><xsl:value-of select="./tei:cell[54]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Content description</td>
                                          <td><xsl:value-of select="./tei:cell[57]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Glosses</td>
                                          <td><xsl:value-of select="./tei:cell[58]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Musical notations</td>
                                          <td><xsl:value-of select="./tei:cell[59]"/><xsl:text> </xsl:text><xsl:value-of select="./tei:cell[60]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Edition</td>
                                          <td><xsl:value-of select="./tei:cell[61]"/></td>
                                      </tr>
                                      <tr>
                                          <td>History origin</td>
                                          <td><xsl:value-of select="./tei:cell[62]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Provenance</td>
                                          <td><xsl:value-of select="./tei:cell[63]"/><xsl:text> </xsl:text><xsl:value-of select="./tei:cell[64]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Host volume Titel</td>
                                          <td><xsl:value-of select="./tei:cell[15]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Date of origin</td>
                                          <td><xsl:value-of select="./tei:cell[18]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Place</td>
                                          <td><xsl:value-of select="./tei:cell[19]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Shelfmark</td>
                                          <td><xsl:value-of select="./tei:cell[20]"/></td>
                                      </tr>
                                      <tr>
                                          <td>Remarks</td>
                                          <td>
                                          <xsl:choose>
                                              <xsl:when test="./tei:cell[22]/text()">
                                                  Provenienz: <xsl:value-of select="./tei:cell[22]"/>
                                              </xsl:when>
                                          </xsl:choose>
                                          <xsl:choose>
                                              <xsl:when test="./tei:cell[23]/text()">
                                                  Einband: <xsl:value-of select="./tei:cell[23]"/>
                                              </xsl:when>
                                          </xsl:choose>
                                          <xsl:choose>
                                              <xsl:when test="./tei:cell[21]/text()">
                                                  Erschließungsdaten zum Trägerband: http://data.onb.ac.at/rec/<xsl:value-of select="./tei:cell[21]"/>
                                              </xsl:when>
                                          </xsl:choose>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>Bibliography</td>
                                          <td><xsl:value-of select="./tei:cell[7]"/></td>
                                      </tr>
                                  </tbody>
                              </table></li>
                              <hr/>
                          </xsl:when>                        
                      </xsl:choose>
                  </xsl:for-each>                
                </ol>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>