<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h2>Elenco persone</h2>
  
	<xsl:for-each select="dati/persona">
	<xsl:variable name="stileDiv">
		padding: 10px; border: 1px solid black; margin-bottom:2px;
	</xsl:variable>
	<div>
		<xsl:attribute name="style">
			<xsl:value-of select="$stileDiv"/>
			<xsl:choose>
				<xsl:when test="position() mod 2 = 0">
					background-color:#DDD;
				</xsl:when>
				<xsl:otherwise>
					background-color:#BBB;
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<p>
			<xsl:variable name="nnomi" select="count(anagrafica/nome)"/>
			<b>
			<xsl:text>Sig.</xsl:text>
			<xsl:if test="altridati/sesso='F'">
				<xsl:text>ra</xsl:text>
			</xsl:if>
			</b>
			<xsl:text> </xsl:text>
			<xsl:for-each select="anagrafica/nome">
				<xsl:value-of select="."/><xsl:text> </xsl:text>
				<xsl:if test="$nnomi>1 and position()=1">
					<i><xsl:text>(primo nome) </xsl:text></i>
				</xsl:if>
			</xsl:for-each>
			
			<b>
			<xsl:value-of select="anagrafica/cognome"/></b>
			<xsl:text>, nat</xsl:text>
			<xsl:choose>
				<xsl:when test="altridati/sesso='M'">
					<xsl:text>o</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>a</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text> il </xsl:text>
			<xsl:value-of select="altridati/data_nascita"/>
		</p>
		<p>
			<xsl:text>
				Residenza: 
			</xsl:text>
			<xsl:value-of select="indirizzo"/>
		</p>
		<p>	
			<xsl:if test="altridati/grupposanguigno">
				<xsl:text>
					Gruppo sanguigno : 
				</xsl:text>
				<xsl:value-of select="altridati/grupposanguigno"/>
				<xsl:text>
					 - 
				</xsl:text>
			</xsl:if>
			<xsl:text>
				Altezza: 
			</xsl:text>
			<xsl:value-of select="altridati/altezza"/>
			<xsl:text>
				(mt) - Peso: 
			</xsl:text>
			<xsl:value-of select="altridati/peso"/>
			<xsl:text>
				(kg)
			</xsl:text>
		</p>
	</div>
	</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>