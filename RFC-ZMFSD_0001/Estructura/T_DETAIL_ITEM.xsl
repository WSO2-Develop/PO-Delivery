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
			
				<!-- T_DETAIL_ITEM -->
				<table name="T_DETAIL_GRAL">
					<xsl:for-each select="orders:Segment_group_25">
						<row id="{position() - 1}">
							<field name="BSTKD"><!-- Nro de orden -->
								<xsl:value-of select="parent::*/orders:BGM/c:e1004" />
							</field>							
							<field name="POSNR"><!-- Posición -->
								<xsl:value-of select="orders:LIN/c:e1082"/>
							</field>
							<field name="KDMAT"><!-- DUN14 -->
								<xsl:value-of select="orders:LIN/c:C212/c:e7140"/>
							</field>
							<field name="ZTIPO"><!-- tipo -->
							</field>
							<field name="ZCART"><!-- caracteristica -->
							</field>
							<field name="ZDESC"><!-- descripcion -->
								<xsl:value-of select="orders:IMD/c:C273/c:e7008_-_-1"/>
							</field>
						</row>
					</xsl:for-each>
				</table>
				<!-- -->

			</tables>
		</bapirfc>

	</xsl:template>

</xsl:stylesheet>