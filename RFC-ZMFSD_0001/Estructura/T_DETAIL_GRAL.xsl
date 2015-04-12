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
			
				<!-- T_DETAIL_GRAL -->
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
							<field name="ZDMAT"><!-- ITEM -->
								<xsl:value-of select="orders:PIA/c:C212_-_-1/c:e7140"/>
							</field>
							<field name="ZVENDOR"><!-- vendor -->
								<xsl:value-of select="orders:PIA/c:C212_-_-2/c:e7140"/>
							</field>
							<field name="ZMENG"><!-- Cantidad total -->
								<xsl:value-of select="orders:QTY/c:C186/c:e6060"/>
							</field>
							<field name="ZPREC"><!-- Monto total -->
								<xsl:value-of select="orders:MOA/c:C516/c:e5004"/>
							</field>
							<field name="NETWR"><!-- Precio de la unidad -->
								<xsl:value-of select="orders:Segment_group_28/orders:PRI/c:C509/c:e5118"/>
							</field>
							<field name="ZTIPP"><!-- Tipo precio -->
								<xsl:value-of select="orders:Segment_group_28/orders:PRI/c:C509/c:e5387"/>
							</field>
							<field name="VRKME"><!-- unidad -->
							</field>
							<field name="ZNUMP"><!-- Number of packages -->
								<xsl:value-of select="orders:Segment_group_30/orders:PAC/c:e7224"/>
							</field>
							<field name="ZPACL"><!-- Packaging level -->
								<xsl:value-of select="orders:Segment_group_30/orders:PAC/c:C531/c:e7075"/>
							</field>
						</row>
					</xsl:for-each>
				</table>
				<!-- -->

			</tables>
		</bapirfc>

	</xsl:template>

</xsl:stylesheet>