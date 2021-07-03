<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all" version="3.0">
    
<!--    ########### Variables: #########-->
    <xsl:variable name="full_path">
        <xsl:value-of select="document-uri(/)"/>
    </xsl:variable>
    
    <xsl:variable name="listPerson">../data/indices/listperson.xml</xsl:variable>
    <xsl:variable name="listBibl">../data/indices/listbibl.xml</xsl:variable>
    <xsl:import href="nav_bar.xsl"/>
    
<!--    this checks if there is an internal or exeternal list with bibliography to be linked with the bibl/abbr elements withini the description-->
    <xsl:variable name="bibliography">
        <xsl:choose>
            <xsl:when test="//tei:list[@type = 'bibliography']">
                <xsl:copy-of select="//tei:list[@type = 'bibliography']"/>
            </xsl:when>
            <xsl:when test="not($listBibl = '')">
                <xsl:copy-of select="doc($listBibl)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    
<!--     ######### Project specific variables: ############-->
    <xsl:variable name="githubPages">https://ivanadob.github.io/mondsee/</xsl:variable>
    <xsl:variable name="gitData">https://github.com/ivanadob/mondsee/blob/master/data/descriptions_mss/</xsl:variable>
    
    
<!--    ########## main template to generate html page (calling other templates listed below) #########-->
    <xsl:template match="/">        
        <html>          
            <head>
                <title>
                    <xsl:value-of select="descendant-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>				
                </title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>	
                <link rel="stylesheet" type="text/css" href="css/mondsee.css"/>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
            </head>
            <body>
                <xsl:call-template name="nav_bar"/>
                <div class="container">
                    <div id="{generate-id()}">
                        <span class="header">
                            <xsl:value-of select="descendant-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                            <xsl:choose>
                                <xsl:when test="descendant-or-self::tei:msDesc/tei:msIdentifier/tei:altIdentifier[@type='former'][not(@rend='doNotShow')][not(contains(preceding-sibling::tei:idno, tei:idno))]">
                                    <xsl:apply-templates select="descendant-or-self::tei:TEI/tei:text/tei:body/tei:msDesc/tei:msIdentifier/tei:altIdentifier[@type='former'][not(@rend='doNotShow')][not(contains(preceding-sibling::tei:idno, tei:idno))]"/>
                                </xsl:when>					
                            </xsl:choose>
                        </span>			
                    </div>	
                    <hr/>	
                    <div class="btn-group">	
                        <xsl:choose>
                            <xsl:when test="descendant-or-self::tei:msDesc/tei:head/tei:note[@type='facs']">
                                <a class="btn btn-outline-dark" href="{descendant-or-self::tei:msDesc/tei:head/tei:note[@type='facs']/tei:ref/@target}">
                                    <xsl:text>Facsimile</xsl:text>
                                </a>
                            </xsl:when>
                        </xsl:choose>                       
                        
                        <xsl:choose>
                            <xsl:when test="descendant-or-self::tei:msDesc/tei:head/tei:note[@type='catalogue']">
                                <a class="btn btn-outline-dark" href="{descendant-or-self::tei:msDesc/tei:head/tei:note[@type='catalogue']/tei:ref/@target}">
                                    <xsl:text>Library catalogue</xsl:text>
                                </a>
                            </xsl:when>
                        </xsl:choose>                        
                        
                        <a class="btn btn-outline-dark">
                            <xsl:attribute name="href">		
                                <xsl:variable name="full_path">
                                    <xsl:value-of select="document-uri(/)"/>
                                </xsl:variable>
                                <xsl:value-of select="concat($gitData,replace(tokenize($full_path, '/')[last()], '.html', '.xml'))"/>
                            </xsl:attribute>
                            <xsl:text>Show TEI-XML</xsl:text>
                        </a>  
                    </div>
                <hr/>
                <div class="copyright">
                    <a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="_blank"><img src="https://licensebuttons.net/l/by/4.0/88x31.png" width="88" height="31" alt="Creative Commons License"></img></a>
                    <p><xsl:apply-templates select="descendant-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/></p>
                </div>
                <xsl:choose>
                    <xsl:when test="descendant-or-self::tei:TEI/tei:teiHeader/tei:revisionDesc/@status = 'draft' ">
                        <xsl:text> (draft version: </xsl:text>
                        <xsl:value-of select="descendant-or-self::tei:TEI/tei:teiHeader/tei:revisionDesc/tei:listChange/tei:change[1]/@when"/><xsl:text>)</xsl:text>		
                    </xsl:when>
                    <xsl:when test="descendant-or-self::tei:TEI/tei:teiHeader/tei:revisionDesc/@status = 'complete' ">
                        <xsl:text> (last change: </xsl:text>
                        <xsl:value-of select="descendant-or-self::tei:TEI/tei:teiHeader/tei:revisionDesc/tei:listChange/tei:change[1]/@when"/><xsl:text>)</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <div id="{generate-id()}">
                    <xsl:text>How to quote: </xsl:text>
                    <xsl:apply-templates select="descendant-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name | descendant-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName"/><xsl:text>, '</xsl:text>
                    <xsl:value-of select="descendant-or-self::tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/><xsl:text>' (</xsl:text>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat($gitData,replace(tokenize($full_path, '/')[last()], '.html', '.xml'))"/>
                        </xsl:attribute>
                        <xsl:value-of select="concat($gitData,replace(tokenize($full_path, '/')[last()], '.html', '.xml'))"/>
                    </a>
                    <xsl:text> last update: </xsl:text><xsl:value-of select="descendant-or-self::tei:TEI/tei:teiHeader/tei:revisionDesc/tei:change[1]/@when"/><xsl:text>).</xsl:text>
                </div>
                <hr/>
                </div>
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"  />
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  />
            </body>            
        </html>
    </xsl:template>
                <!--<p>
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
                   <!-\- <xsl:value-of
                        select=".//tei:dimensions[@type = 'written']/tei:height"/><xsl:text>×</xsl:text>
                    <xsl:value-of
                        select=".//tei:dimensions[@type = 'written']/tei:width"/><xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:p"/>-\-></p>
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
                <!-\-     ###########   INHALT-\->
                <xsl:for-each select=".//tei:msItem">
                    <p>
                        <xsl:value-of select="data(./@n)"/>
                        <xsl:text> </xsl:text>
                        <!-\-##### item folionumber in brackets-\->
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
                                    <!-\- ################# checks if the <incipit> is mutile or no -\->
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
                                    <!-\- ################# check if there is bibliographical note within the <incipit> to put in brackets-\->
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
                </xsl:for-each>-->
         
    
    
    	
    
    
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