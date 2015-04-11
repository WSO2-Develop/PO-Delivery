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
			
				<!-- T_HEADER -->
				<table name="T_HEADER">
					<xsl:for-each select=".">
						<row id="{position() - 1}">
							<field name="BSTKD"><!-- Nro de orden -->
								<xsl:value-of select="orders:BGM/c:e1004" />
							</field>
							<xsl:for-each select="orders:DTM/c:C507">
								<xsl:choose>
									<xsl:when test="c:e2005 = 137">
										<field name="BSTDK"><!-- Fecha de pedido -->
											<xsl:value-of select="c:e2380" />
										</field>
									</xsl:when>
									<xsl:when test="string(c:e2005) = '43E'">
										<field name="BSTDK_E"><!-- Fecha vencimiento -->
											<xsl:value-of select="c:e2380" />
										</field>
									</xsl:when>
									<xsl:when test="c:e2005 = 10">
										<field name="VDATU"><!-- Fecha de despacho -->
											<xsl:value-of select="c:e2380" />
										</field>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
							<xsl:for-each
								select="orders:Segment_group_1/orders:RFF/c:C506">
								<xsl:choose>
									<xsl:when test="c:e1153 = 'SD'">
										<field name="ZDEP"><!-- Departamento -->
											<xsl:value-of select="c:e1154" />
										</field>
									</xsl:when>
									<xsl:when test="c:e1153 = 'ZZZ'">
										<field name="ZTPO"><!-- Tipo PO -->
											<xsl:value-of select="c:e1154" />
										</field>
									</xsl:when>
									<xsl:when test="c:e1153 = 'PD'">
										<field name="ZMPO"><!-- Descripcion de Orden de compra -->
											<xsl:value-of select="c:e1154" />
										</field>
									</xsl:when>
									<xsl:otherwise />
								</xsl:choose>
							</xsl:for-each>
							<field name="WAERK"><!-- Moneda -->
								<xsl:value-of
									select="orders:Segment_group_7/orders:CUX/c:C504_-_-1/c:e6345" />
							</field>
							<field name="ZTERM"><!-- Cond de pago -->
								<xsl:value-of
									select="orders:Segment_group_8/orders:PAT/c:C112/c:e2009" />
							</field>
							<field name="ZMODP"><!-- Modo Pago -->
								<xsl:value-of
									select="orders:Segment_group_8/orders:PAT/c:C112/c:e2151" />
							</field>
						</row>
					</xsl:for-each>
				</table>
				<!-- -->

			</tables>
		</bapirfc>

	</xsl:template>

</xsl:stylesheet>