<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:foo="http://foo.bar.com"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output indent="yes"/>
    <xsl:function name="foo:makeId">
        <xsl:param name="label" as="xs:string"/>
        
        <xsl:sequence select="
            replace(
            replace(
            replace(
            lower-case($label),
            ' ', '-'
            ),
            'é', 'e'
            ),
            'ü', 'ue'
            )"/>
    </xsl:function>
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>List of primary sources and scondray literature</title>
                        <respStmt>
                            <resp>by </resp>
                            <persName>Ivana Dobcheva</persName>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <list type="bibliography">
                        <xsl:for-each select=".//tei:item">
                            <xsl:sort select="foo:makeId(./tei:label/text())"></xsl:sort>
                            <item>
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="foo:makeId(./tei:label/text())"/>
                                </xsl:attribute>
                                <label>
                                    <xsl:value-of select="./tei:label/text()"/>
                                </label>
                                <bibl>
                                    <xsl:value-of select="normalize-space(string-join(./tei:bibl//text()))"/>
                                </bibl>
                                
                                <xsl:if test="@xml:id">
                                    <idno type="gbv"><xsl:value-of select="substring-after(@xml:id, 'gbv_')"/></idno>
                                </xsl:if>
                            </item>
                        </xsl:for-each>
                    </list>
                    <!--<listBibl xml:id="secondary-lit">
                        <xsl:for-each select=".//tei:item">
                            <xsl:sort select="foo:makeId(./tei:label/text())"></xsl:sort>
                            <bibl>
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="foo:makeId(./tei:label/text())"/>
                                </xsl:attribute>
                                <title type="full">
                                    <xsl:value-of select="normalize-space(string-join(./tei:bibl//text()))"/>
                                </title>
                                <title type="short">
                                    <xsl:value-of select="./tei:label/text()"/>
                                </title>
                                <xsl:if test="@xml:id">
                                    <note type="gbv"><xsl:value-of select="substring-after(@xml:id, 'gbv_')"/></note>
                                </xsl:if>
                            </bibl>
                        </xsl:for-each>
                    </listBibl>-->
                    <listBibl xml:id="primary-sources">
                    <xsl:for-each select="doc('../data/indices/listtitle.xml')//work">
                        <xsl:sort select="@xml:id"></xsl:sort>
                        <bibl>
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:for-each select=".//title">
                                <title><xsl:value-of select="./text()"/></title>
                            </xsl:for-each>
                            <xsl:for-each select=".//author">
                                <author>
                                    <xsl:if test="@ref">
                                        <xsl:attribute name="ref">
                                            <xsl:value-of select="@ref"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="./text()"/></author>
                            </xsl:for-each>
                            <xsl:for-each select=".//incipit">
                                <incipit><xsl:value-of select="./text()"/></incipit>
                            </xsl:for-each>
                            <xsl:if test="@ref">
                                <idno type="gnd"><xsl:value-of select="@ref"/></idno>
                            </xsl:if>
                            <xsl:for-each select=".//note">
                                <note><xsl:value-of select="./text()"/></note>
                            </xsl:for-each>
                            <xsl:if test=".//bibl">
                                <listRelation>
                                    <xsl:for-each select=".//bibl">
                                        <relation>
                                            <xsl:try>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="concat('#', foo:makeId(./abbr/text()))"/>
                                                </xsl:attribute>
                                                <xsl:catch></xsl:catch>
                                            </xsl:try>
                                            
                                            <desc>
                                                <xsl:value-of select="."/>
                                            </desc>
                                        </relation>
                                    </xsl:for-each>
                                </listRelation>
                            </xsl:if>
                        </bibl>
                    </xsl:for-each>
                    </listBibl>
                </body>
            </text>
        </TEI>
    </xsl:template>
</xsl:stylesheet>