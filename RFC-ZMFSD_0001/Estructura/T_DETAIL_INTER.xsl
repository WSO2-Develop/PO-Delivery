<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:env="urn:org.milyn.edi.unedifact.v41" xmlns:orders="urn:org.milyn.edi.unedifact:un:d96a:orders"
	xmlns:c="urn:org.milyn.edi.unedifact:un:d96a:common"
	exclude-result-prefixes="soapenv env orders c">

	<xsl:strip-space elements="*" />
	<xsl:output method="xml" version="1.0" encoding="UTF-8"
		indent="yes" omit-xml-declaration="yes" />

	<xsl:template match="/">
		<root>
			<xsl:apply-templates />
		</root>
	</xsl:template>

	<xsl:template match="env:UNH" />
	<xsl:template match="env:UNT" />
	<xsl:template match="env:UNZ" />

	<xsl:template match="orders:ORDERS">

		<bapirfc name="ZMFSD_0001">
			<tables>
			
				<!-- T_DETAIL_INTER -->
				<table name="T_DETAIL_INTER">
					<xsl:for-each select="orders:Segment_group_25/orders:Segment_group_33">
						<row id="{position() - 1}">
							<field name="BSTKD"><!-- Nro de orden -->
								<xsl:value-of select="parent::*/parent::*/orders:BGM/c:e1004" />
							</field>							
							<field name="POSNR"><!-- Posición -->
								<xsl:value-of select="parent::*/orders:LIN/c:e1082"/>
							</field>
							<field name="EXPNR"><!-- Int. Externo -->
							<xsl:value-of select="orders:LOC/c:C517/c:e3225"/>
							</field>
							<field name="ZMENG"><!-- Cantidad -->
								<xsl:value-of select="orders:QTY/c:C186/c:e6060"/>
							</field>
						</row>
					</xsl:for-each>
				</table>
				<!-- -->

			</tables>
		</bapirfc>

	</xsl:template>

</xsl:stylesheet>