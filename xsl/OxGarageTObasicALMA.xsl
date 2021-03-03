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
                <h1>Fragmente ohne ALMA Daten</h1>
                <ol>
                <xsl:for-each select=".//tei:row">
                      
                              <li><table class="table table-hover">
                                  <thead>
                                      <tr>
                                          <th width="50%"><xsl:value-of select="./tei:cell[1]"/></th>                                          
                                      </tr>
                                  </thead>
                                  <tbody>
                                      <tr>
                                          <td>008 Art des Datum q</td>
                                          <td><xsl:value-of select="./tei:cell[11]"/></td>
                                      </tr>
                                      <tr>
                                          <td>041: $$a lat oder $$a ger</td>
                                          <td><xsl:value-of select="./tei:cell[17]"/></td>
                                      </tr>
                                      <tr>
                                          <td>100 Autor / 700 weitere Autore</td>
                                          <td>
                                                  <xsl:value-of select="./tei:cell[14]"/>
                                             
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>110 2</td>
                                          <td>$$a Benediktinerkloster St. Michael (Mondsee) $$4 oth $$e [Vorbesitzer]</td>
                                      </tr>   
                                      <tr>
                                          <td>245 1 0 §§a</td>
                                          <td>
                                              <xsl:choose>
                                                  <xsl:when test="./tei:cell[14]/text()">
                                                      <xsl:value-of select="./tei:cell[14]"/><xsl:text>: </xsl:text><xsl:value-of select="./tei:cell[54]"/>
                                                  </xsl:when>
                                                  <xsl:when test="./tei:cell[15]/text()">
                                                      <xsl:value-of select="./tei:cell[15]"/>
                                                  </xsl:when>
                                                  <xsl:when test="./tei:cell[16]/text()">
                                                      <xsl:value-of select="./tei:cell[16]"/>
                                                  </xsl:when>
                                              </xsl:choose><xsl:text> (Fragment)</xsl:text>
                                              </td>
                                      </tr>
                                      <tr>
                                          <td>264 _ 0 (erste Stelle nach 264 leer) $$c</td>
                                          <td><xsl:value-of select="./tei:cell[11]"/></td>
                                      </tr>
                                      <tr>
                                          <td>300</td>
                                          <td>$$a Handschrift; <xsl:value-of select="./tei:cell[7]"/> (<xsl:value-of select="./tei:cell[9]"/>) $$c <xsl:value-of select="./tei:cell[8]"/>
                                              <xsl:value-of select="./tei:cell[13]"/>
                                          </td>
                                      </tr>                                    
                                      <tr>
                                          <td>340</td>
                                          <td>$$a <xsl:value-of select="./tei:cell[5]"/></td>
                                      </tr>
                                      <tr>
                                          <td>500</td>
                                          <td><xsl:text>Titel fingiert.</xsl:text>
                                          <xsl:choose>
                                              <xsl:when test="./tei:cell[3]/tei:ptr">
                                              <xsl:text>. – Ausführlichere Beschreibung auf Fragmentarium</xsl:text>
                                              </xsl:when>
                                          </xsl:choose>
                                          <xsl:choose>
                                              <xsl:when test="./tei:cell[4]/text()">
                                                  <xsl:text>. – $$a Gruppe: </xsl:text><xsl:value-of select="./tei:cell[4]"/>
                                              </xsl:when>
                                          </xsl:choose>
                                              <xsl:choose>
                                                  <xsl:when test="./tei:cell[10]/text()">
                                                      <br/><xsl:text>. – </xsl:text><xsl:value-of select="./tei:cell[10]"/>
                                                  </xsl:when>
                                              </xsl:choose></td>
                                      </tr>
                                      <tr>
                                          <td>505 8 0 Informationen zum Inhalt</td>
                                          <td>$$ t <xsl:value-of select="./tei:cell[18]"/></td>
                                      </tr>
                                      <tr>
                                          <td>751 ($$a Mondsee $$0 (DE-588)4333077-0 $$4 prp)</td>
                                          <td>
                                              <xsl:choose>
                                                  <xsl:when test="./tei:cell[12]/text()">
                                                      <xsl:value-of select="./tei:cell[12]"/>
                                                  </xsl:when>
                                              </xsl:choose>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>856 4 Fragmentarium</td>
                                          <td>
                                              <xsl:choose>
                                                  <xsl:when test="./tei:cell[3]/tei:ptr">
                                                      <xsl:text>$$u </xsl:text><xsl:value-of select="./tei:cell[3]/tei:ptr/@target"/><xsl:text> $$z Fragmentarium</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                      Not in Fragmentarium
                                                  </xsl:otherwise>
                                              </xsl:choose>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>856 4   $$u $$z Literatur zum Fragment</td>
                                          <td>$$u https://www.onb.ac.at/bibliothek/sammlungen/handschriften-und-alte-drucke/bestaende/bestandsrecherche/literatur-zu-handschriften $$z Literatur zum Fragment</td>
                                      </tr>                                      
                                  </tbody>
                              </table></li>
                              <hr/>
                  </xsl:for-each>                
                </ol>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
