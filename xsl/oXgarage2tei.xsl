<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">  
            <xsl:for-each select="//tei:row">
                <TEI xmlns="http://www.tei-c.org/ns/1.0">
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <title></title>
                            </titleStmt>
                            <editionStmt>
                                <edition>Electronic version according to TEI P5.1</edition>
                            </editionStmt>
                            <publicationStmt>
                                <publisher>Fragmentarium - Digital Research Laboratory for Medieval Manuscript Fragments</publisher>
                                <availability status="restricted">
                                    <licence>
                                        <p>cc-by-nc</p>
                                    </licence>
                                </availability>
                            </publicationStmt>
                            <sourceDesc>
                                <msDesc xml:id="" xml:lang="deu">
                                    <!--<xsl:attribute name="xml:id">
                                        <xsl:value-of select="substring-after-last(.//tei:cell[1], ' ')"></xsl:value-of>
                                    </xsl:attribute>-->
                                    <msIdentifier>
                                        <settlement><xsl:value-of select="substring-before(.//tei:cell[1], ',')"/></settlement>
                                        <repository>
                                            <xsl:choose>
                                            <xsl:when test="contains(.//tei:cell[1], 'ÖNB')">
                                                <xsl:text>Österreichische Nationalbibliothek</xsl:text>
                                            </xsl:when>
                                                <xsl:when test="contains(.//tei:cell[1], 'Staatsbibl')">
                                                    <xsl:text>Staatsbibliothek</xsl:text>
                                                </xsl:when>
                                                <xsl:when test="contains(.//tei:cell[1], 'OÖLA')">
                                                    <xsl:text>Oberösterreichisches Landesarchiv</xsl:text>
                                                </xsl:when>
                                                <xsl:when test="contains(.//tei:cell[1], 'OÖLB')">
                                                    <xsl:text>Oberösterreichische Landesbibliothek</xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
                                        </repository>
                                        <idno><xsl:value-of select="substring-after(.//tei:cell[1], ': ')"/></idno>
                                        <xsl:choose> 
                                            <xsl:when test="contains(.//tei:cell[5], ',')">
                                                <altIdentifier type="former">
                                                    <idno><xsl:value-of select="substring-before(.//tei:cell[5], ',')"/></idno>
                                                </altIdentifier>
                                                <altIdentifier type="former">
                                                    <idno><xsl:value-of select="substring-after(.//tei:cell[5], ', ')"/></idno>
                                                </altIdentifier>
                                                </xsl:when>
                                            <xsl:otherwise>
                                                <altIdentifier  type="former">
                                                    <idno><xsl:value-of select=".//tei:cell[5]"></xsl:value-of></idno>
                                                </altIdentifier>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </msIdentifier>
                                    <head>
                                        <title>
                                            <xsl:choose>
                                                <xsl:when test=".//tei:cell[54]/text()">
                                                    <xsl:value-of select=".//tei:cell[54]"/>                                                    
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select=".//tei:cell[51]"/><xsl:text>: </xsl:text><xsl:value-of select=".//tei:cell[53]"/>                                                    
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </title>
                                        <origDate>
                                            <xsl:attribute name="from">
                                                <xsl:value-of select="substring-before(.//tei:cell[46], '-')"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="to">
                                                <xsl:value-of select="substring-after(.//tei:cell[46], '-')"/>
                                            </xsl:attribute>
                                            <xsl:value-of select=".//tei:cell[45]"/>
                                        </origDate>
                                        <origPlace>
                                            <xsl:value-of select=".//tei:cell[47]"/>
                                        </origPlace>
                                    </head>
                                    <msContents>
                                        <msItem>
                                            <textLang>
                                                <xsl:attribute name="mainLang">
                                                    <xsl:choose>
                                                        <xsl:when test="contains(.//tei:cell[55], 'lateinisch')">
                                                            <xsl:text>lat</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test="contains(.//tei:cell[55], 'deutsch')">
                                                            <xsl:text>deu</xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:value-of select=".//tei:cell[55]"/></textLang>
                                            <title>
                                                <xsl:value-of select=".//tei:cell[54]"/>
                                                <xsl:value-of select=".//tei:cell[53]"/>
                                            </title>
                                            <xsl:if test=".//tei:cell[51]/text()">
                                                <note type="persons">
                                                    <xsl:if test=".//tei:cell[50]/text()">
                                                        <xsl:attribute name="ref">
                                                            <xsl:text>gnd_</xsl:text><xsl:value-of select=".//tei:cell[50]"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select=".//tei:cell[51]"/>
                                                </note>
                                            </xsl:if>
                                            <note type="description"><xsl:value-of select=".//tei:cell[56]"/></note>
                                            <note>
                                                <bibl type="edition"><xsl:value-of select=".//tei:cell[60]"/></bibl>
                                            </note>
                                            <note type="remarks"/>
                                        </msItem>
                                    </msContents>
                                    <physDesc>
                                        <objectDesc form="Fragment">
                                            <supportDesc>
                                                <support>
                                                    <material>
                                                        <xsl:value-of select=".//tei:cell[10]"/>
                                                    </material>
                                                </support>
                                                <extent>
                                                    <dimensions type="leaf_orig">
                                                        <width>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei:cell[26]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei:cell[27]"/>
                                                            </xsl:attribute>
                                                            <xsl:choose>
                                                                <xsl:when test=".//tei:cell[26]/text()=.//tei:cell[27]/text()">
                                                                    <xsl:value-of select=".//tei:cell[26]"/>
                                                                </xsl:when>
                                                                <xsl:when test=".//tei:cell[27]/text()!=.//tei:cell[26]/text()">
                                                                <xsl:value-of select=".//tei:cell[26]"/>-<xsl:value-of select=".//tei:cell[27]"/>
                                                            </xsl:when>                                                                
                                                                <xsl:otherwise>
                                                                    <xsl:if test=".//tei:cell[26]/text()">
                                                                        <xsl:text>min </xsl:text><xsl:value-of select=".//tei:cell[26]"/>
                                                                    </xsl:if>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </width>
                                                        <height>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei:cell[24]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei:cell[25]"/>
                                                            </xsl:attribute>
                                                            <xsl:choose>
                                                                <xsl:when test=".//tei:cell[24]/text()=.//tei:cell[25]/text()">
                                                                    <xsl:value-of select=".//tei:cell[24]"/>
                                                                </xsl:when>
                                                                <xsl:when test=".//tei:cell[24]/text()!=.//tei:cell[25]/text()">
                                                                    <xsl:value-of select=".//tei:cell[24]"/>-<xsl:value-of select=".//tei:cell[25]"/>
                                                                </xsl:when>                                                                
                                                                <xsl:otherwise>
                                                                    <xsl:if test=".//tei:cell[24]/text()">
                                                                        <xsl:text>min </xsl:text><xsl:value-of select=".//tei:cell[24]"/>
                                                                    </xsl:if>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </height>
                                                    </dimensions>
                                                    <dimensions type="written_orig">
                                                        <width>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei:cell[30]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei:cell[31]"/>
                                                            </xsl:attribute>
                                                            <xsl:choose>
                                                                <xsl:when test=".//tei:cell[30]/text()=.//tei:cell[31]/text()">
                                                                    <xsl:value-of select=".//tei:cell[31]"/>
                                                                </xsl:when>
                                                                <xsl:when test=".//tei:cell[30]/text()!=.//tei:cell[31]/text()">
                                                                    <xsl:value-of select=".//tei:cell[30]"/>-<xsl:value-of select=".//tei:cell[31]"/>
                                                                </xsl:when>                                                                
                                                                <xsl:otherwise>
                                                                    <xsl:if test=".//tei:cell[30]/text()">
                                                                        <xsl:text>min </xsl:text><xsl:value-of select=".//tei:cell[30]"/>
                                                                    </xsl:if>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </width>
                                                        <height>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei:cell[28]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei:cell[29]"/>
                                                            </xsl:attribute><xsl:choose>
                                                                <xsl:when test=".//tei:cell[28]/text()=.//tei:cell[29]/text()">
                                                                    <xsl:value-of select=".//tei:cell[28]"/>
                                                                </xsl:when>
                                                                <xsl:when test=".//tei:cell[28]/text()!=.//tei:cell[29]/text()">
                                                                    <xsl:value-of select=".//tei:cell[28]"/>-<xsl:value-of select=".//tei:cell[29]"/>
                                                                </xsl:when>                                                                
                                                                <xsl:otherwise>
                                                                    <xsl:if test=".//tei:cell[28]/text()">
                                                                        <xsl:text>min </xsl:text><xsl:value-of select=".//tei:cell[28]"/>
                                                                    </xsl:if>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </height>
                                                    </dimensions>
                                                </extent>
                                                <condition>
                                                    <p><xsl:value-of select=".//tei:cell[42]"/></p>
                                                </condition>
                                            </supportDesc>
                                            <layoutDesc>
                                                <layout>
                                                <dimensions type="column">
                                                    <width>
                                                    <xsl:attribute name="min">
                                                        <xsl:value-of select=".//tei:cell[35]"/>
                                                    </xsl:attribute>
                                                        <xsl:attribute name="max">
                                                            <xsl:value-of select=".//tei:cell[36]"/>
                                                        </xsl:attribute>
                                                        <xsl:choose>
                                                            <xsl:when test=".//tei:cell[35]/text()=.//tei:cell[36]/text()">
                                                                <xsl:value-of select=".//tei:cell[35]"/>
                                                            </xsl:when>
                                                            <xsl:when test=".//tei:cell[35]/text()!=.//tei:cell[36]/text()">
                                                                <xsl:value-of select=".//tei:cell[35]"/>-<xsl:value-of select=".//tei:cell[36]"/>
                                                            </xsl:when>                                                                
                                                            <xsl:otherwise>
                                                                <xsl:if test=".//tei:cell[35]/text()">
                                                                    <xsl:text>min </xsl:text><xsl:value-of select=".//tei:cell[35]"/>
                                                                </xsl:if>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </width>
                                                </dimensions>
                                                </layout>
                                                <layout>
                                                    <dimensions type="line">
                                                        <height>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei:cell[37]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei:cell[38]"/>
                                                            </xsl:attribute>
                                                            <xsl:choose>
                                                                <xsl:when test=".//tei:cell[37]/text()=.//tei:cell[38]/text()">
                                                                    <xsl:value-of select=".//tei:cell[37]"/>
                                                                </xsl:when>
                                                                <xsl:when test=".//tei:cell[37]/text()!=.//tei:cell[38]/text()">
                                                                    <xsl:value-of select=".//tei:cell[37]"/>-<xsl:value-of select=".//tei:cell[38]"/>
                                                                </xsl:when>                                                                
                                                                <xsl:otherwise>
                                                                    <xsl:if test=".//tei:cell[37]/text()">
                                                                        <xsl:text>min </xsl:text><xsl:value-of select=".//tei:cell[37]"/>
                                                                    </xsl:if>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </height>
                                                    </dimensions>
                                                </layout>
                                                <layout>
                                                    <xsl:attribute name="writtenLines">
                                                        <xsl:value-of select=".//tei:cell[32]"/> <xsl:value-of select=".//tei:row/tei:cell[33]"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="columns">
                                                        <xsl:value-of select=".//tei:cell[34]"/>
                                                    </xsl:attribute>
                                                    <xsl:value-of select=".//tei:cell[39]"/>
                                                    <xsl:choose>
                                                        <xsl:when test=".//tei:cell[34]='2'">
                                                            zweispaltig
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[34]='1'">
                                                            einspaltig
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </layout>                                               
                                            </layoutDesc>
                                        </objectDesc>
                                        <handDesc>
                                            <handNote>
                                                <p><xsl:value-of select=".//tei:cell[43]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[44]"/></p>
                                            </handNote>
                                        </handDesc>
                                        <musicNotation><xsl:value-of select=".//tei:cell[58]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[59]"/></musicNotation>
                                        <decoDesc>
                                            <decoNote><xsl:value-of select=".//tei:cell[48]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[49]"/></decoNote>
                                        </decoDesc>
                                        <additions>
                                            <gloss><xsl:value-of select=".//tei:cell[57]"/></gloss>
                                        </additions>
                                    </physDesc>
                                    <history>
                                        <summary/>
                                        <origin><xsl:value-of select=".//tei:cell[61]"/>
                                        <xsl:if test=".//tei:cell[9]/text()">
                                            Weitere Fragmente von dergleichen Handschrift: <xsl:value-of select=".//tei:cell[9]"></xsl:value-of>
                                        </xsl:if>
                                        </origin>
                                        <provenance><p><xsl:value-of select=".//tei:cell[62]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[63]"/></p>
                                            <p>Das Fragment wurde als <xsl:value-of select=".//tei:cell[23]"/> verwendet.
                                            <xsl:choose>
                                                <xsl:when test=".//tei:cell[19]/text()">
                                                <xsl:choose>
                                                <xsl:when test="contains (.//tei:cell[2], 'a')">
                                                    <xsl:text>Ausgelöst aus:</xsl:text>
                                                </xsl:when>
                                                <xsl:when test="contains (.//tei:cell[2], 'i')">
                                                    <xsl:text>Es befindet sich im:</xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
                                                <xsl:value-of select=".//tei:cell[19]"/><!--Signatur Traegerband-->
                                                    <ptr>
                                                        <xsl:attribute name="target"><xsl:text>http://data.onb.ac.at/rec/</xsl:text><xsl:value-of select=".//tei:cell[20]"/></xsl:attribute>
                                                    </ptr>
                                                    <xsl:value-of select=".//tei:cell[22]"/>
                                                <xsl:value-of select=".//tei:cell[21]"/>
                                            </xsl:when>
                                            </xsl:choose>
                                            </p>
                                        </provenance>
                                    </history>
                                    <additional>
                                        <adminInfo>
                                            <recordHist>
                                                <source>
                                                    <bibl type="not-printed">Description by: <xsl:value-of select=".//tei:cell[64]"/></bibl>
                                                </source>
                                            </recordHist>
                                        </adminInfo>
                                        <listBibl>
                                            <bibl><xsl:apply-templates select=".//tei:cell[6]"/></bibl>
                                        </listBibl>
                                    </additional>
                                </msDesc>
                            </sourceDesc>
                        </fileDesc>
                    </teiHeader>
                    <text>
                        <body>
                            <p/>
                        </body>
                    </text>
                </TEI>
            </xsl:for-each>
        
    </xsl:template>
    <xsl:template match="tei:hi">
        <title>
            <xsl:apply-templates></xsl:apply-templates>
        </title>
    </xsl:template>
</xsl:stylesheet>