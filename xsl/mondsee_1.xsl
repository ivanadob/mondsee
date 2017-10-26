<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <ivana>
        <xsl:for-each select="//tei:div">
            <TEI xmlns="http://www.tei-c.org/ns/1.0">
                <teiHeader>
                    <fileDesc>
                        <titleStmt>
                            <title></title>
                        </titleStmt>
                        <publicationStmt>
                            <p>Publication Information</p>
                        </publicationStmt>
                        <sourceDesc>
                            <msDesc xml:id="" xml:lang="deu">
                                <msIdentifier>
                                    <settlement>Wien</settlement>
                                    <repository>Österreichische Nationalbibliothek</repository>
                                    <idno>
                                        <xsl:value-of select=".//tei:head"/>
                                    </idno>
                                    <altIdentifier type="former">
                                        <idno></idno>
                                    </altIdentifier>
                                </msIdentifier>
                                <head>
                                    <title></title>
                                    <origDate>
                                        <xsl:attribute name="from">
                                            <xsl:value-of select="substring-before(.//tei:p[.//tei:label[./text()='Datierung numerisch']]//text()[2], '-')"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="to">
                                            <xsl:value-of select="substring-after(.//tei:p[.//tei:label[./text()='Datierung numerisch']]//text()[2], '-')"/>
                                        </xsl:attribute>
                                        <xsl:value-of select=".//tei:p[.//tei:label[./text()='Datierung']]//text()[2]"/>
                                    </origDate>
                                    <origPlace><xsl:value-of select=".//tei:p[.//tei:label[./text()='grobe Lokalisierung']]//text()[2]"/></origPlace>
                                </head>
                                <msContents>
                                    <msItem>
                                        <textLang><xsl:value-of select=".//tei:p[.//tei:label[./text()='Sprache']]//text()[2]"/></textLang>
                                        <title></title>
                                        <note type="persons" ref="">
                                            <xsl:value-of select=".//tei:p[.//tei:label[./text()='Autor (plain)']]//text()[2]"/>
                                        </note>
                                        <note type="description"><xsl:value-of select=".//tei:p[.//tei:label[./text()='Textidentifizierung mit Stelle, oder Texttyp mit Zitaten (Freitext)']]//text()[2]"/></note>
                                        <note>
                                            <bibl type="edition"><xsl:value-of select=".//tei:p[.//tei:label[./text()='Edition']]//text()[2]"/></bibl>
                                        </note>
                                        <note type="remarks"></note>
                                    </msItem>
                                </msContents>
                                <physDesc>
                                    <objectDesc form="Fragment">
                                        <supportDesc>
                                            <support>
                                                <material><xsl:value-of select=".//tei:p[./tei:label[./text()='Beschreibstoff']]//text()[2]"/></material>
                                            </support>
                                            <extent>
                                                <dimensions type="leaf_orig">
                                                    <width>
                                                        <xsl:attribute name="min">
                                                            <xsl:value-of select=".//tei:p[./tei:label[./text()='Blattbreite min']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="max">
                                                            <xsl:value-of select=".//tei:p[./tei:label[./text()='Blattbreite max']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select=".//tei:p[./tei:label[./text()='Blattbreite min']]//text()[2]"/>-<xsl:value-of select=".//tei:p[./tei:label[./text()='Blattbreite max']]//text()[2]"/>
                                                    </width>
                                                    <height>
                                                        <xsl:attribute name="min">
                                                            <xsl:value-of select=".//tei:p[./tei:label[./text()='Blatthöhe max']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="max">
                                                            <xsl:value-of select=".//tei:p[./tei:label[./text()='Blatthöhe max']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select=".//tei:p[./tei:label[./text()='Blatthöhe max']]//text()[2]"/>-<xsl:value-of select=".//tei:p[./tei:label[./text()='Blatthöhe max']]//text()[2]"/>
                                                    </height>
                                                </dimensions>
                                                <dimensions type="written_orig">
                                                    <width>
                                                        <xsl:attribute name="min">
                                                            <xsl:value-of select=".//tei:p[./tei:label[./text()='Schrift-raumbreite min']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="max">
                                                            <xsl:value-of select=".//tei:p[./tei:label[./text()='Schrift-raumbreite max']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select=".//tei:p[./tei:label[./text()='Schrift-raumbreite min']]//text()[2]"/>-<xsl:value-of select=".//tei:p[./tei:label[./text()='Schrift-raumbreite max']]//text()[2]"/>
                                                    </width>
                                                    <height>
                                                        <xsl:attribute name="min">
                                                            <xsl:value-of select=".//tei:p[./tei:label[./text()='Schrift-raumhöhe min']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="max">
                                                            <xsl:value-of select=".//tei:p[./tei:label[./text()='Schrift-raumhöhe max']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select=".//tei:p[./tei:label[./text()='Schrift-raumhöhe min']]//text()[2]"/>-<xsl:value-of select=".//tei:p[./tei:label[./text()='Schrift-raumhöhe max']]//text()[2]"/>
                                                    </height>
                                                </dimensions>
                                            </extent>
                                            <condition>
                                                <p><xsl:value-of select=".//tei:p[.//tei:label[./text()='Anmerkungen zum heutigen Zustand']]//text()[2]"/></p>
                                            </condition>
                                        </supportDesc>
                                        <layoutDesc>
                                            <layout>
                                                <xsl:attribute name="writtenLines">
                                                    <xsl:value-of select=".//tei:p[.//tei:label[./text()='Anzahl der Zeilen min']]//text()[2]"/> <xsl:value-of select=".//tei:p[.//tei:label[./text()='Anzahl der Zeilen max']]//text()[2]"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="columns">
                                                    <xsl:value-of select=".//tei:p[.//tei:label[./text()='Spalten-zahl']]//text()[2]"/>
                                                </xsl:attribute>
                                                <xsl:value-of select=".//tei:p[.//tei:label[./text()='Anzahl der Zeilen min']]//text()[2]"/>-<xsl:value-of select=".//tei:p[.//tei:label[./text()='Spalten-zahl']]//text()[2]"/>
                                            </layout>
                                            <layout>
                                                <dimensions type="column">
                                                    <width>
                                                        <xsl:attribute name="min">
                                                            <xsl:value-of select=".//tei:p[.//tei:label[./text()='Spalten-breite min']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="max">
                                                            <xsl:value-of select=".//tei:p[.//tei:label[./text()='Spalten-breite max']]//text()[2]"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select=".//tei:p[.//tei:label[./text()='Spalten-breite min']]//text()[2]"/>-<xsl:value-of select=".//tei:p[.//tei:label[./text()='Spalten-breite max']]//text()[2]"/>
                                                    </width>
                                                </dimensions>
                                            </layout>
                                        </layoutDesc>
                                    </objectDesc>
                                    <handDesc>
                                        <handNote>
                                            <p>
                                                <xsl:value-of select=".//tei:p[.//tei:label[./text()='Schriftart']]//text()[2]"/> <xsl:text> </xsl:text>
                                                <xsl:value-of select=".//tei:p[.//tei:label[./text()='Bemerkungen zur Schrift / zur Schreibhand (Freitext)']]//text()[2]"/>
                                            </p>
                                        </handNote>
                                    </handDesc>
                                    <decoDesc>
                                        <decoNote><xsl:value-of select=".//tei:p[.//tei:label[./text()='Rubrizierung / Buchschmuck']]//text()[2]"/> <xsl:value-of select=".//tei:p[.//tei:label[./text()='Initialtyp']]//text()[2]"/></decoNote>
                                    </decoDesc>
                                    <musicNotation><xsl:value-of select=".//tei:p[.//tei:label[./text()='bei liturgischen Hss. Notation']]//text()[2]"/> <xsl:value-of select=".//tei:p[.//tei:label[./text()='Bemerkungen zur Notation']]//text()[2]"/></musicNotation>
                                    <additions>
                                        <gloss><xsl:value-of select=".//tei:p[.//tei:label[./text()='Glossierung / Nachträge']]//text()[2]"/></gloss>
                                    </additions>
                                </physDesc>
                                <history>
                                    <summary></summary>
                                    <origin>
                                        <xsl:value-of select=".//tei:p[.//tei:label[./text()='Herkunft Fragment']]//text()[2]"/>
                                    </origin>
                                    <provenance>
<!--                                        add here the info to Traegerband-->
                                        <xsl:value-of select=".//tei:p[.//tei:label[./text()='Provenienz']]//text()[2]"/>
                                    </provenance>
                                </history>
                                <additional>
                                    <adminInfo>
                                        <recordHist>
                                            <source>
                                                <bibl type="not-printed">Description by: <xsl:value-of select=".//tei:p[.//tei:label[./text()='Urheber']]//text()[2]"/></bibl>
                                            </source>
                                        </recordHist>
                                    </adminInfo>
                                    <listBibl>
                                        <bibl></bibl>
                                    </listBibl>
                                </additional>
                            </msDesc>
                        </sourceDesc>
                    </fileDesc>
                </teiHeader>
            </TEI>
        </xsl:for-each>
        </ivana>
           </xsl:template>
</xsl:stylesheet>