<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:strip-space elements="*" />
	<xsl:output method="text" version="1.0" encoding="UTF-8"
		indent="yes" omit-xml-declaration="yes" />
	<xsl:template match="text">
		<!-- TODO: Auto-generated template -->
		<xsl:value-of select="//text" />
	</xsl:template>
</xsl:stylesheet>