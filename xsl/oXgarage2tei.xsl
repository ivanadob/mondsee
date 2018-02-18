<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/"> 
        <teiCorpus version="5.2" xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Die Fragmente aus Mondsee</title>
                    </titleStmt>
                    <editionStmt>
                        <edition>Electronic version according to TEI P5.1</edition>
                        <respStmt>
                            <persName>Andreas Fingernagel</persName>
                            <resp>Projektleitung</resp>
                        </respStmt>
                        <respStmt>
                            <persName>Ivana Dobcheva</persName>
                            <resp>Projektmitarbeiterin, Erschließung</resp>
                        </respStmt>
                        <respStmt>
                            <persName>Larissa Rasinger</persName>
                            <resp>Projektmitarbeiterin, Erschließung</resp>
                        </respStmt>
                        <respStmt>
                            <persName>Veronika Wöber</persName>
                            <resp>Projektmitarbeiterin, Digitalisierung</resp>
                        </respStmt>
                        <respStmt>
                            <orgName>Österreichische Nationalbibliothek</orgName>
                            <resp></resp>
                        </respStmt>
                        <respStmt>
                            <orgName>Oberösterreichische Landesbibliothek</orgName>
                            <resp>Kooperationspartner</resp>
                        </respStmt>
                        <respStmt>
                            <orgName>Oberöstereichisches Landesarchiv</orgName>
                            <resp>Kooperationspartner</resp>
                        </respStmt>
                        <respStmt>
                            <orgName>Institut für Österreichische Geschichtsforschung (Universität Wien)</orgName>
                            <resp>Kooperationspartner</resp>
                        </respStmt>
                        <funder>
                            <orgName>Fonds zur Förderung der wissenschaftlichen Forschung</orgName>
                            <orgName>Österreichische Akademie der Wissenschaften, GoDigital 2.0</orgName>
                        </funder>
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
                        <p></p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <xsl:for-each select="//tei:row">
                    <xsl:if test=".//tei:cell[7]/tei:ptr"> 
<!--                        temporarily solution to bring only those fragments that have Bearbeiter, to have a lower and managable number of results-->
                        <TEI xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
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
                                <msDesc xml:lang="deu">
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
                                            <xsl:choose>
                                                <xsl:when test="contains(.//tei:cell[46], '-')">
                                                    <xsl:attribute name="from">
                                                        <xsl:value-of select="substring-before(.//tei:cell[46], '-')"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="to">
                                                        <xsl:value-of select="substring-after(.//tei:cell[46], '-')"/>
                                                    </xsl:attribute>
                                                </xsl:when>
                                                <xsl:when test="contains(.//tei:cell[46], '?')">
                                                    <xsl:attribute name="cert">
                                                        <xsl:text>medium</xsl:text>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="from">
                                                        <xsl:value-of select="substring-before(.//tei:cell[46], ' (?)')"/>
                                                    </xsl:attribute>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:attribute name="from">
                                                        <xsl:value-of select=".//tei:cell[46]"/>
                                                    </xsl:attribute>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:value-of select=".//tei:cell[45]"/>
                                        </origDate>
                                        <origPlace>
                                            <xsl:value-of select=".//tei:cell[47]"/>
                                        </origPlace>
                                    </head>
                                    <msContents>
                                        <msItem>
                                            <textLang>
                                                <!--according to ISO 639-3-->
                                                <xsl:attribute name="mainLang">
                                                    <xsl:choose>
                                                        <xsl:when test=".//tei:cell[55]/text() = 'lateinisch'">
                                                            <xsl:text>lat</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[55]/text() = 'deutsch'">
                                                            <xsl:text>deu</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[55]/text() = 'hebräisch'">
                                                            <xsl:text>heb</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[55]/text() = 'französisch'">
                                                            <xsl:text>fra</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[55]/text() = 'lateinisch &amp; deutsch'">
                                                            <xsl:text>lat</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[55]/text() = 'deutsch &amp; lateinisch'">
                                                            <xsl:text>deu</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[55]/text() = 'griechisch'">
                                                            <xsl:text>ell</xsl:text>
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[55]/text() = 'englisch'">
                                                            <xsl:text>eng</xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:if test="contains(.//tei:cell[55], '&amp;')">
                                                    <xsl:attribute name="otherLangs">
                                                        <xsl:choose>
                                                            <xsl:when test="contains(.//tei:cell[55], '&amp; deutsch')">
                                                                <xsl:text>deu</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="contains(.//tei:cell[55], '&amp; lateinisch')">
                                                                <xsl:text>lat</xsl:text>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                    </xsl:attribute>
                                                </xsl:if>
                                                
                                                <xsl:value-of select=".//tei:cell[55]"/></textLang>
                                            <title>
                                                <xsl:value-of select=".//tei:cell[54]"/>
                                                <xsl:value-of select=".//tei:cell[53]"/>
                                            </title>
                                            <xsl:if test=".//tei:cell[51]/text()">
                                                <author>
                                                    <xsl:if test=".//tei:cell[50]/text()">
                                                        <xsl:attribute name="ref">
                                                            <xsl:text>http://d-nb.info/gnd/</xsl:text><xsl:value-of select=".//tei:cell[50]"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select=".//tei:cell[51]"/>
                                                </author>
                                            </xsl:if>
                                            <note type="description">
                                                <xsl:apply-templates select=".//tei:cell[56]"/>                                      
                                            </note>
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
                                                    <p>
                                                        <xsl:value-of select=".//tei:cell[12]"/>
                                                    </p>
                                                    <dim>
                                                        <xsl:value-of select=".//tei:cell[13]"/>
                                                    </dim>
                                                </support>
                                                <extent>
                                                    <dimensions type="leaf_orig">
                                                        <width>
                                                            <xsl:if test=".//tei:cell[26]/text()">
                                                                <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei:cell[26]"/>
                                                            </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:if test=".//tei:cell[27]/text()">
                                                                <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei:cell[27]"/>
                                                            </xsl:attribute>
                                                            </xsl:if>
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
                                                            <xsl:if test=".//tei:cell[24]/text()">
                                                                <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei:cell[24]"/>
                                                            </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:if test=".//tei:cell[25]/text()">
                                                                <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei:cell[25]"/>
                                                            </xsl:attribute>
                                                            </xsl:if>
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
                                                            <xsl:if test=".//tei:cell[30]/text()">
                                                                <xsl:attribute name="min">
                                                                    <xsl:value-of select=".//tei:cell[30]"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:if test=".//tei:cell[31]/text()">
                                                                <xsl:attribute name="max">
                                                                    <xsl:value-of select=".//tei:cell[31]"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
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
                                                            <xsl:if test=".//tei:cell[28]/text()">
                                                                <xsl:attribute name="min">
                                                                    <xsl:value-of select=".//tei:cell[28]"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:if test=".//tei:cell[29]/text()">
                                                                <xsl:attribute name="max">
                                                                    <xsl:value-of select=".//tei:cell[29]"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:choose>
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
                                                        <xsl:if test=".//tei:cell[35]/text()">
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei:cell[35]"/>
                                                            </xsl:attribute>
                                                        </xsl:if>
                                                        <xsl:if test=".//tei:cell[36]/text()">
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei:cell[36]"/>
                                                            </xsl:attribute>
                                                        </xsl:if>
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
                                                            <xsl:if test=".//tei:cell[37]/text()">
                                                                <xsl:attribute name="min">
                                                                    <xsl:value-of select=".//tei:cell[37]"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:if test=".//tei:cell[38]/text()">
                                                                <xsl:attribute name="max">
                                                                    <xsl:value-of select=".//tei:cell[38]"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            Höhe der Einzelzeile: 
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
                                                    <xsl:if test=".//tei:cell[32]/text()">
                                                        <xsl:attribute name="writtenLines">
                                                            <xsl:value-of select=".//tei:cell[32]"/> <xsl:value-of select=".//tei:row/tei:cell[33]"/>
                                                        </xsl:attribute>                                                        
                                                    </xsl:if>
                                                    <xsl:if test=".//tei:cell[34]/text()">
                                                        <xsl:attribute name="columns">
                                                            <xsl:value-of select=".//tei:cell[34]"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:if test=".//tei:cell[32]/text()">
                                                        <xsl:value-of select=".//tei:cell[32]"/> <xsl:value-of select=".//tei:row/tei:cell[33]"/> Zeilen,
                                                    </xsl:if>
                                                    <xsl:value-of select=".//tei:cell[39]"/>
                                                    <xsl:choose>
                                                        <xsl:when test=".//tei:cell[34]/text()='2'">
                                                            , zweispaltig
                                                        </xsl:when>
                                                        <xsl:when test=".//tei:cell[34]/text()='1'">
                                                            , einspaltig
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
                                        <xsl:if test=".//tei:cell[58]/text()">
                                            <musicNotation><xsl:value-of select=".//tei:cell[58]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[59]"/></musicNotation>
                                        </xsl:if>
                                        <xsl:if test=".//tei:cell[48]/text()">
                                            <decoDesc>
                                            <decoNote><xsl:value-of select=".//tei:cell[48]"/></decoNote>
                                            </decoDesc>
                                        </xsl:if>
                                        <xsl:if test=".//tei:cell[57]/text()">
                                            <additions>
                                                <gloss><xsl:value-of select=".//tei:cell[57]"/></gloss>
                                            </additions>
                                        </xsl:if>
                                    </physDesc>
                                    <history>
                                        <summary/>
                                        <origin>
                                            <p><xsl:choose>
                                                <xsl:when test=".//tei:cell[61]/text()">
                                                    <xsl:value-of select=".//tei:cell[61]"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select=".//tei:cell[45]"/><xsl:text> </xsl:text> <xsl:value-of select=".//tei:cell[47]"/><xsl:text> (nach dem palaeographischen Befund).</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose></p>
                                        <xsl:if test=".//tei:cell[9]/text()">
                                            <p>Weitere Fragmente von dergleichen Handschrift: <xsl:value-of select=".//tei:cell[9]"></xsl:value-of></p>
                                        </xsl:if>
                                        </origin>
                                        <provenance>
                                            <p><xsl:value-of select=".//tei:cell[62]"/></p>
                                            <p>Makulaturtyp: <xsl:value-of select=".//tei:cell[23]"/></p>
                                            <p><xsl:choose>
                                                <xsl:when test=".//tei:cell[19]/text()">
                                                <xsl:choose>
                                                <xsl:when test="contains (.//tei:cell[2], 'a')">
                                                    <xsl:text>Ausgelöst aus </xsl:text>
                                                </xsl:when>
                                                <xsl:when test="contains (.//tei:cell[2], 'i')">
                                                    <xsl:text>In situ Fragment im Trägerband </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
                                                <ref>
                                                    <xsl:attribute name="target">http://data.onb.ac.at/rec/<xsl:value-of select=".//tei:cell[20]"/></xsl:attribute>
                                                    <xsl:value-of select=".//tei:cell[19]"/><!--Signatur Traegerband-->
                                                </ref>
                                                    Inhalt: <xsl:value-of select=".//tei:cell[14]"/>
                                                    Entstehung: <xsl:value-of select=".//tei:cell[17]"/> <xsl:value-of select=".//tei:cell[18]"/>
                                                    Provenienz: <xsl:value-of select=".//tei:cell[21]"/>
                                                    Einband: <xsl:value-of select=".//tei:cell[22]"/><xsl:value-of select=".//tei:cell[15]"/><xsl:value-of select=".//tei:cell[16]"/>
                                            </xsl:when>
                                            </xsl:choose>
                                            </p>
                                        </provenance>
                                    </history>
                                    <additional>
                                        <adminInfo>
                                            <recordHist>
                                                <source>
                                                    <bibl type="not-printed"><xsl:value-of select=".//tei:cell[64]"/></bibl>
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
                    </xsl:if>
            </xsl:for-each>
                </teiCorpus>
    
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'italic']">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'color(FFFF0000)']">
        <hi rend='rubric'>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:analyze-string select="." regex="\(Can (\w\d+\w*)\)">         
            <xsl:matching-substring>
                <ref><xsl:attribute name="target"><xsl:value-of select="substring-before(concat('http://cantusindex.org/id/',  substring-after(., '(Can ')), ')')"/></xsl:attribute><xsl:value-of select="."/></ref>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    <!--    ############################################################# frag Peter (er behauptet es muss durch @element@ gehen - https://www.w3.org/TR/xslt/#element-analyze-string oder da https://www.data2type.de/xml-xslt-xslfo/xslt/xslt-referenz/analyze-string/ wie ich bei jedem Can ein <ref target="http://cantusindex.org/id/...">Can ...</ref> mache. Suche mit reg ex Can (\w*\d+\w*) -->
        <!--<xsl:template match="tei:cell[56]/text()">
            
<!-\-        <xsl:value-of select="replace(., 'Can (\w*\d+\w*)', '')" />-\->
<!-\-        <xsl:for-each select="(Can \w*\d+\w*)">-\->
            <!-\-<xsl:for-each select="'Can (\w*\d+\w*)'">
                <xsl:variable name="cantusID">
                    <xsl:value-of select=".">                       
                    </xsl:value-of>
                </xsl:variable>
                <xsl:element name="ref">
                    <xsl:attribute name="target"><xsl:value-of select="$cantusID"></xsl:value-of></xsl:attribute>
                </xsl:element>
            </xsl:for-each>-\->
<!-\-            <ptr target="http://cantusindex.org/id/$1"/>-\->
        <!-\-</xsl:for-each>-\->
<!-\-        <xsl:value-of select='replace(., "Can (\w*\d+\w*)", "$1 <ptr target="http://cantusindex.org/id/$1"/>)'></xsl:value-of>-\->
    </xsl:template>-->
</xsl:stylesheet>