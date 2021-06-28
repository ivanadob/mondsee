<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all" version="3.0">
    <xsl:template match="/">
        
        <html>          
            <head>
                <xsl:value-of select=".//tei:msIdentifier/tei:idno"/>
                <br/>
                <xsl:value-of select=".//tei:head/tei:title"/>
            </head>
            <body>
                <p>
                    <xsl:value-of select=".//tei:head/tei:note"/>
                </p>
                <h1>Support:</h1>
                <p>
                    <xsl:value-of select=".//tei:support"/>
                    
                </p>
                <h1>Extent:</h1>
                <p><xsl:value-of select=".//tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent/tei:measure[@type = 'leavesCount']"/></p> 
                <h1>Format:</h1>
                <xsl:for-each select=".//tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent"> <p>
                    <xsl:value-of
                        select=".//tei:dimensions[@type = 'leaf']/tei:height"/><xsl:text>×</xsl:text>
                    <xsl:value-of
                        select=".//tei:dimensions[@type = 'leaf']/tei:width"/>
                    mm
                    <xsl:apply-templates
                        select="normalize-space(string-join(.//tei:extent/text(), ' '))"/>
                </p>
                </xsl:for-each>
                <xsl:choose>
                    <xsl:when test=".//tei:condition">
                        <h1>Condition:</h1>
                        <xsl:value-of select=".//tei:condition"/>
                    </xsl:when>
                </xsl:choose>
                <h1>Foliation:</h1>
                <p>
                    <xsl:apply-templates select=".//tei:foliation"/>
                </p>
                <h1>Collation:</h1>
                <p>
                    <xsl:apply-templates
                        select="normalize-space(string-join(.//tei:collation, ' '))"
                    /><xsl:text> </xsl:text> 
                </p>
                <h1>Page layout:</h1>
                <xsl:for-each select=".//tei:msDesc/tei:physDesc/tei:objectDesc/tei:layoutDesc/tei:layout"> <p>
                    <xsl:value-of
                        select=".//tei:dimensions[@type = 'written']/tei:height"/><xsl:text>×</xsl:text>
                    <xsl:value-of
                        select=".//tei:dimensions[@type = 'written']/tei:width"/>
                    mm
                    <xsl:apply-templates
                        select="normalize-space(string-join(.//tei:p/text(), ' '))"/>
                   <!-- <xsl:value-of
                        select=".//tei:dimensions[@type = 'written']/tei:height"/><xsl:text>×</xsl:text>
                    <xsl:value-of
                        select=".//tei:dimensions[@type = 'written']/tei:width"/><xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:p"/>--></p>
                </xsl:for-each>
                
                <p><xsl:apply-templates select=".//tei:scriptNote"/></p>
                <xsl:choose>
                    <xsl:when test=".//tei:additions">
                        <xsl:value-of select=".//tei:additions"/></xsl:when>
                </xsl:choose>
                <h1>Decoration:</h1>
                <p>
                    <xsl:apply-templates select=".//tei:decoNote"/>
                </p>
                <h1>Binding:</h1>
                <p>
                    <xsl:apply-templates select=".//tei:binding"/>
                </p>
                <xsl:choose>
                    <xsl:when test=".//tei:accMat">
                        <p>
                            <xsl:apply-templates select=".//tei:accMat"/>
                        </p>
                    </xsl:when>
                </xsl:choose>
                <h1>Origin and Provenance:</h1>
                <p>
                    <xsl:apply-templates select="normalize-space(string-join(.//tei:history, ' '))"
                    />
                </p>
                <h1>Literature:</h1>
                <p>
                    <xsl:text/>
                    <xsl:apply-templates
                        select="normalize-space(string-join(.//tei:additional/tei:listBibl/tei:bibl, ' — '))"
                    />
                </p>
                <!--     ###########   INHALT-->
                <xsl:for-each select=".//tei:msItem">
                    <p>
                        <xsl:value-of select="data(./@n)"/>
                        <xsl:text> </xsl:text>
                        <!--##### item folionumber in brackets-->
                        <xsl:text>(</xsl:text>
                        <xsl:value-of select="./tei:locus"/>
                        <xsl:text>) </xsl:text>
                        
                        <xsl:choose>
                            <xsl:when test="./tei:author">
                                <xsl:choose>
                                    <xsl:when test="./tei:author/@rend = 'supplied'">
                                        <xsl:text>[</xsl:text>
                                        <xsl:apply-templates select="./tei:author"/>
                                        <xsl:text>]: </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text/>
                                        <xsl:apply-templates select="./tei:author"/>
                                        <xsl:text>: </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:title[not(@type)]">
                                <xsl:value-of select="./tei:title[not(@type)]"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:title/@type = 'sub'">
                                <xsl:value-of select="./tei:title[@type = 'sub']"/>
                                <xsl:text> </xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:respStmt">
                                <xsl:text> (</xsl:text>
                                <xsl:apply-templates select=".//tei:resp"/>
                                <xsl:apply-templates select=".//tei:persName"/>
                                <xsl:text>) </xsl:text>
                            </xsl:when>
                        </xsl:choose>                        
                        <xsl:choose>
                            <xsl:when test="./tei:listBibl">
                                <xsl:text> (</xsl:text>
                                <xsl:apply-templates
                                    select="normalize-space(string-join(.//tei:bibl, ' — '))"/>
                                <xsl:text>). </xsl:text>
                            </xsl:when>
                            <xsl:when test="./tei:bibl">
                                <xsl:text> (</xsl:text>
                                <xsl:apply-templates select="./tei:bibl"/>
                                <xsl:text>). </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>. </xsl:otherwise>
                        </xsl:choose>                        
                        <xsl:choose>
                            <xsl:when test="./tei:rubric">
                                <xsl:text>Tit.: </xsl:text>
                                <i>
                                    <xsl:value-of select="./tei:rubric"/>
                                </i>
                                <xsl:text> </xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:incipit">
                                <xsl:choose>
                                    <!-- ################# checks if the <incipit> is mutile or no -->
                                    <xsl:when test="./tei:incipit/@defective = 'true'">
                                        <xsl:text>Inc. (mut.): </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Inc.: </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <i><xsl:apply-templates select="string-join(./tei:incipit, '')"/>
                                    ... </i>
                                <xsl:choose>
                                    <!-- ################# check if there is bibliographical note within the <incipit> to put in brackets-->
                                    <xsl:when test=".//tei:note/@type = 'bibl'">
                                        <xsl:text>(</xsl:text>
                                        <xsl:value-of select=".//tei:note"/>
                                        <xsl:text>).</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:explicit">
                                <xsl:text>Expl.: ... </xsl:text>
                                <i>
                                    <xsl:value-of select="./tei:explicit"/>
                                </i>
                                <xsl:text/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:finalRubric">
                                <xsl:text> </xsl:text>
                                <i>
                                    <xsl:value-of select="./tei:finalRubric"/>
                                </i>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:colophon">
                                <xsl:text> </xsl:text>
                                <i>
                                    <xsl:value-of select="./tei:colophon"/>
                                </i>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:quote">
                                <xsl:apply-templates select="./tei:quote"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="./tei:note">
                                <xsl:text> </xsl:text>
                                <xsl:apply-templates select="./tei:note"/>
                                <xsl:text> </xsl:text>
                            </xsl:when>
                        </xsl:choose>
                    </p>
                </xsl:for-each>
                <xsl:for-each select=".//tei:div">
                    <h1>
                        <xsl:value-of select="./tei:head"/>
                    </h1>
                    <xsl:for-each select="./tei:p">
                        <p>
                            <xsl:apply-templates select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    
    
    <!--<xsl:template match="tei:note[@type='footnote']">
        <xsl:text></xsl:text><xsl:value-of select="."/><xsl:text></xsl:text>
    </xsl:template>-->
    
    <xsl:template match="tei:quote">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'sup']">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    <xsl:template match="tei:author">
        <a>
            <xsl:attribute name="href" select="./@ref"/>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:persName">
        <a>
            <xsl:attribute name="href" select="./@ref"/>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="./@target">
                <a>
                    <xsl:attribute name="href" select="./@target"/>
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:rs">
        <xsl:choose>
            <xsl:when test="./@ref">
                <a>
                    <xsl:attribute name="href" select="./@ref"/>
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:gap">
        <xsl:text> ... </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <xsl:for-each select="./tei:item">
            <xsl:apply-templates/>
            <xsl:if test="not(position() = last())">
                <xsl:text> — </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:supplied"> [<xsl:value-of select="."/>] </xsl:template>
    <xsl:template match="tei:sic">
        <xsl:value-of select="."/><xsl:text> (!)</xsl:text>
    </xsl:template>
    <xsl:template match="tei:foreign">
        <i><xsl:value-of select="."/></i>
    </xsl:template>
</xsl:stylesheet>
        
        <!--
        <xsl:template match="tei:accMat[not(. = '')]">        
        <div>
            <span class="head">Accompanying materials: </span>
        </div>
    </xsl:template>
    <xsl:template match="tei:acquisition[not(. = '')]">
        <div>
            <span class="head">Acquisition of the manuscript: </span>
            <xsl:choose>
                <xsl:when test="tei:p[2]">
                    <ul>
                        <xsl:apply-templates/>
                    </ul>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>
    <xsl:template match="tei:additions[not(. = '')]">
        <div>
            <span class="head">Additions: </span>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:stylesheet>-->