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
                                    <msIdentifier>
                                        <settlement>Wien</settlement>
                                        <repository>Österreichische Nationalbibliothek</repository>
                                        <idno></idno>
                                        <altIdentifier type="former">
                                            <idno><xsl:value-of select=".//tei:row/tei:cell[1]"/></idno>
                                        </altIdentifier>
                                    </msIdentifier>
                                    <head>
                                        <title></title>
                                        <origDate>
                                            <xsl:attribute name="from">
                                                <xsl:value-of select="substring-before(.//tei:row/tei:cell[46], '-')"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="to">
                                                <xsl:value-of select="substring-after(.//tei:row/tei:cell[46], '-')"/>
                                            </xsl:attribute>
                                            <xsl:value-of select=".//tei:row/tei:cell[46]"/>
                                        </origDate>
                                        <origPlace>
                                            <xsl:value-of select=".//tei:row/tei:cell[47]"/>
                                        </origPlace>
                                    </head>
                                    <msContents>
                                        <msItem>
                                            <textLang><xsl:value-of select=".//tei:row/tei:cell[55]"/></textLang>
                                            <title></title>
                                            <note type="persons" ref=""><xsl:value-of select=".//tei:row/tei:cell[50]"/></note>
                                            <note type="description"><xsl:value-of select=".//tei:row/tei:cell[56]"/></note>
                                            <note>
                                                <bibl type="edition"><xsl:value-of select=".//tei:row/tei:cell[60]"/></bibl>
                                            </note>
                                            <note type="remarks"/>
                                        </msItem>
                                    </msContents>
                                    <physDesc>
                                        <objectDesc form="Fragment">
                                            <supportDesc>
                                                <support>
                                                    <material>
                                                        <xsl:value-of select=".//tei:row/tei:cell[10]"/>
                                                    </material>
                                                </support>
                                                <extent>
                                                    <dimensions type="leaf_orig">
                                                        <width>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei/row/tei:cell[26]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei/row/tei:cell[27]"/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select=".//tei/row/tei:cell[26]"/>-<xsl:value-of select=".//tei/row/tei:cell[27]"/>
                                                        </width>
                                                        <height>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei/row/tei:cell[24]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei/row/tei:cell[25]"/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select=".//tei/row/tei:cell[24]"/>-<xsl:value-of select=".//tei/row/tei:cell[25]"/>
                                                        </height>
                                                    </dimensions>
                                                    <dimensions type="written_orig">
                                                        <width>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei/row/tei:cell[30]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei/row/tei:cell[31]"/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select=".//tei/row/tei:cell[30]"/>-<xsl:value-of select=".//tei/row/tei:cell[31]"/>
                                                        </width>
                                                        <height>
                                                            <xsl:attribute name="min">
                                                                <xsl:value-of select=".//tei/row/tei:cell[28]"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="max">
                                                                <xsl:value-of select=".//tei/row/tei:cell[29]"/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select=".//tei/row/tei:cell[28]"/>-<xsl:value-of select=".//tei/row/tei:cell[29]"/>
                                                        </height>
                                                    </dimensions>
                                                </extent>
                                                <condition>
                                                    <p><xsl:value-of select=".//tei/row/tei:cell[42]"/></p>
                                                </condition>
                                            </supportDesc>
                                            <layoutDesc>
                                                <layout>
                                                <dimensions type="column">
                                                    <width min="105" max="105">
                                                    <xsl:attribute name="min">
                                                        
                                                    </xsl:attribute>
                                                        <xsl:attribute name="max"></xsl:attribute>
                                                    </width>
                                                </dimensions>
                                                </layout>
                                                <layout>
                                                    <dimensions>
                                                        <xsl:attribute name="line"></xsl:attribute>
                                                        <height min="8" max="8">8 8</height>
                                                    </dimensions>
                                                </layout>
                                                <layout>
                                                    <xsl:attribute name="writtenLines">
                                                        <xsl:value-of select=".//tei:row/tei:cell[43]"/> <xsl:value-of select=".//tei:row/tei:cell[44]"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="columns">
                                                        <xsl:value-of select=".//tei:row/tei:cell[34]"/>
                                                    </xsl:attribute>
                                                    <xsl:value-of select=".//tei:row/tei:cell[43]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[44]"/>
                                                    <xsl:value-of select=".//tei:row/tei:cell[34]"/>
                                                </layout>
                                                <layout>
                                                    <dimensions type="column">
                                                        <width min=""></width>
                                                    </dimensions>
                                                </layout>
                                            </layoutDesc>
                                        </objectDesc>
                                        <handDesc>
                                            <handNote>
                                                <p><xsl:value-of select=".//tei:row/tei:cell[43]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[44]"/></p>
                                            </handNote>
                                        </handDesc>
                                        <decoDesc>
                                            <decoNote><xsl:value-of select=".//tei:row/tei:cell[48]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[49]"/></decoNote>
                                        </decoDesc>
                                        <musicNotation><xsl:value-of select=".//tei:row/tei:cell[58]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[59]"/></musicNotation>
                                        <additions>
                                            <gloss><xsl:value-of select=".//tei:row/tei:cell[57]"/></gloss>
                                        </additions>
                                    </physDesc>
                                    <history>
                                        <summary/>
                                        <origin><xsl:value-of select=".//tei:row/tei:cell[61]"/></origin>
                                        <provenance><xsl:value-of select=".//tei:row/tei:cell[62]"/><xsl:text> </xsl:text><xsl:value-of select=".//tei:row/tei:cell[63]"/></provenance>
                                    </history>
                                    <additional>
                                        <adminInfo>
                                            <recordHist>
                                                <source>
                                                    <bibl type="not-printed">Description by: <xsl:value-of select=".//tei:row/tei:cell[64]"/></bibl>
                                                </source>
                                            </recordHist>
                                        </adminInfo>
                                        <listBibl>
                                            <bibl><xsl:value-of select=".//tei:row/tei:cell[6]"/></bibl>
                                        </listBibl>
                                    </additional>
                                </msDesc>
                            </sourceDesc>
                        </fileDesc>
                    </teiHeader>
                </TEI>
            </xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>