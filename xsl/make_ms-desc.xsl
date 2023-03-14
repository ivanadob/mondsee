<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all" version="3.0">
	<!--     ######### Project specific variables: ############-->
	<xsl:variable name="githubPages">https://ivanadob.github.io/mondsee/</xsl:variable>
	<xsl:variable name="gitData">https://github.com/ivanadob/mondsee/blob/master/data/descriptions/</xsl:variable>
	<xsl:variable name="listPerson">../data/indices/listperson.xml</xsl:variable>
	<xsl:variable name="listBibl">../data/indices/listsources.xml</xsl:variable>
	<xsl:import href="nav_bar.xsl"/>
	<!--    ########## main template to generate html page (calling other templates listed below) #########-->
	<xsl:template match="/">
		<html lang="en">
			<head>
				<title>
					<xsl:value-of select="//tei:titleStmt/tei:title"/>
				</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>	
				<link rel="stylesheet" type="text/css" href="css/mondsee.css"/>
				<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
			</head>
			<body>
<!--				call external xsl template forthe navigation bar -->
				<xsl:call-template name="nav_bar"/>
				
				<div class="container">
					<div id="{generate-id()}">
						<span class="header">
							<xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
							<xsl:choose>
								<xsl:when test="//tei:msDesc/tei:msIdentifier/tei:altIdentifier[@type='former'][not(@rend='doNotShow')]">
									<xsl:text> (olim: </xsl:text>
									<xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:altIdentifier[@type='former']/tei:idno"/>
									<xsl:text>)</xsl:text>
								</xsl:when>					
							</xsl:choose>
						</span>			
					</div>	
					<hr/>	
					<!--                	Creates button group for link to facsimile, catalogue, and fragmentarium entries -->
					<div class="btn-group">	
						<xsl:choose>
							<xsl:when test="//tei:msDesc/tei:head/tei:note[@type='fragmentarium']">
								<a class="btn btn-outline-dark" href="{//tei:msDesc/tei:head/tei:note[@type='fragmentarium']/tei:ref/@target}"  target="_blank" title="Fragmentarium entry in a new tab">
									<img src="https://fragmentarium.ms/img/svg/logo-bw.svg" alt="Fragmentarium" width="20" height="20"></img>
								</a>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="//tei:msDesc/tei:head/tei:note[@type='facs']">
								<a class="btn btn-outline-dark" href="{//tei:msDesc/tei:head/tei:note[@type='facs']/tei:ref/@target}"  target="_blank" title="opens in a new tab">
									<xsl:value-of select="//tei:msDesc/tei:head/tei:note[@type='facs']/tei:ref"/>
								</a>
							</xsl:when>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="//tei:msDesc/tei:head/tei:note[@type='catalogue']">
								<a class="btn btn-outline-dark" href="{descendant-or-self::tei:msDesc/tei:head/tei:note[@type='catalogue']/tei:ref/@target}"  target="_blank" title="opens in a new tab">
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
					<div id="{generate-id()}">
						<span class="header">                            
							<xsl:choose>
								<xsl:when test="descendant-or-self::tei:msDesc/tei:head/tei:title">
									<xsl:apply-templates select="descendant-or-self::tei:msDesc/tei:head/tei:title"/>
								</xsl:when>
								<xsl:when test="not(descendant-or-self::tei:msDesc/tei:head/tei:title) and descendant-or-self::tei:msDesc/tei:msIdentifier/tei:msName">
									<xsl:apply-templates select="descendant-or-self::tei:msDesc/tei:msIdentifier/tei:msName"/>
								</xsl:when>
							</xsl:choose>	
						</span>			
					</div>	
					
					<xsl:apply-templates select="descendant-or-self::tei:msDesc"/>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>