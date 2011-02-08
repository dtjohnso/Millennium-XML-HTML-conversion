<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="no" encoding="UTF-8"/>
	<xsl:template match="/Bibliography">
				<xsl:apply-templates select="Item">
					<xsl:sort data-type="text" select="ItemUniformTitle" order="ascending" />
				</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="Item">
		<p>
			<xsl:variable name="bibID" select="ItemBibIDTruncated"/>
			<xsl:choose>
				<xsl:when test="ItemUniformTitle != ''">
					<b><xsl:value-of select="ItemUniformTitle" /></b>
					<xsl:text> </xsl:text>
					<xsl:value-of select="ItemTitle"/>
				</xsl:when>
				<xsl:otherwise>
					<b><xsl:value-of select="ItemTitle"/></b>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text> </xsl:text>
			<xsl:value-of select="ItemPublication" />
			<xsl:text> [</xsl:text>
			<a href="http://library.bju.edu/record={$bibID}" target="_blank">
				<xsl:value-of select="ItemCallNum" />
			</a>]<xsl:text/>
			<xsl:if test="ItemNote != ''">
				<br/>
				<i>
					<xsl:value-of select="ItemNote"/>
				</i>
			</xsl:if>
		</p>
	</xsl:template>
</xsl:stylesheet>