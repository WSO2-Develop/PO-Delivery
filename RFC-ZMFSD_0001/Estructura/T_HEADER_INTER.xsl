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
			
				<!-- T_HEADER_INTER -->
				<table name="T_HEADER_INTER">
					<xsl:for-each select="orders:Segment_group_2">
						<xsl:if test="orders:NAD/c:e3035 != 'SN'">
							<row id="{position() - 1}">
								<field name="BSTKD"><!-- Nro de orden -->
									<xsl:value-of select="parent::*/orders:BGM/c:e1004" />
								</field>
								<field name="ZTIPO"><!-- Tipo -->						
									<xsl:value-of select="orders:NAD/c:e3035"/>
								</field>
								<field name="EXPNR"><!-- Int. Externo --> 
									<xsl:if test="parent::*/orders:Segment_group_1/orders:RFF/c:C506/c:e1154= 73">
										<xsl:if test="orders:NAD/c:e3035 = 'ST'">
											<xsl:value-of select="orders:NAD/c:C082/c:e3039" />
										</xsl:if>
										<xsl:if test="orders:NAD/c:e3035 = 'BT'">
											<xsl:value-of select="orders:NAD/c:C082/c:e3039" />
										</xsl:if>
										<xsl:if test="orders:NAD/c:e3035 = 'SF'">
											<xsl:value-of select="orders:Segment_group_3/orders:RFF/c:C506/c:e1154" />
										</xsl:if>
									</xsl:if>
									<xsl:if test="parent::*/orders:Segment_group_1/orders:RFF/c:C506/c:e1154 = 20">
										<xsl:if test="orders:NAD/c:e3035 = 'BY'">
											<xsl:value-of select="orders:NAD/c:C082/c:e3039" />
										</xsl:if>
										<xsl:if test="orders:NAD/c:e3035 = 'SF'">
											<xsl:value-of select="orders:Segment_group_3/orders:RFF/c:C506/c:e1154" />
										</xsl:if>
									</xsl:if>
									<xsl:if test="parent::*/orders:Segment_group_1/orders:RFF/c:C506/c:e1154 = 03">
										<xsl:if test="orders:NAD/c:e3035 = 'BY'">
											<xsl:value-of select="orders:NAD/c:C082/c:e3039" />
										</xsl:if>
										<xsl:if test="orders:NAD/c:e3035 = 'SF'">
											<xsl:value-of select="orders:Segment_group_3/orders:RFF/c:C506/c:e1154" />
										</xsl:if>
									</xsl:if>
									<xsl:if test="parent::*/orders:Segment_group_1/orders:RFF/c:C506/c:e1154 = 33">
										<xsl:if test="orders:NAD/c:e3035 = 'BY'">
											<xsl:value-of select="orders:NAD/c:C082/c:e3039" />
										</xsl:if>
										<xsl:if test="orders:NAD/c:e3035 = 'SF'">
											<xsl:value-of select="orders:Segment_group_3/orders:RFF/c:C506/c:e1154" />
										</xsl:if>
									</xsl:if>
									<xsl:if test="parent::*/orders:Segment_group_1/orders:RFF/c:C506/c:e1154 = 07">
										<xsl:if test="orders:NAD/c:e3035 = 'FR'">
											<xsl:value-of select="parent::*/orders:Segment_group_25/orders:Segment_group_33/orders:LOC/c:C517/c:e3225" />
										</xsl:if>
										<xsl:if test="orders:NAD/c:e3035 = 'SF'">
											<xsl:value-of select="orders:Segment_group_3/orders:RFF/c:C506/c:e1154" />
										</xsl:if>
									</xsl:if>
									<xsl:if test="parent::*/orders:Segment_group_1/orders:RFF/c:C506/c:e1154 = 37">
										<xsl:if test="orders:NAD/c:e3035 = 'FR'">
											<xsl:value-of select="parent::*/orders:Segment_group_25/orders:Segment_group_33/orders:LOC/c:C517/c:e3225" />
										</xsl:if>
										<xsl:if test="orders:NAD/c:e3035 = 'SF'">
											<xsl:value-of select="orders:Segment_group_3/orders:RFF/c:C506/c:e1154" />
										</xsl:if>
									</xsl:if>
								</field>
								<field name="NAME1"><!-- Nombre -->
									<xsl:value-of select="orders:NAD/c:C080"/>
								</field>
								
								<field name="ZVENDOR"><!-- vendor -->
									<xsl:if test="orders:Segment_group_3/orders:RFF/c:C506/c:e1153 = 'IA'">
										<xsl:value-of select="orders:Segment_group_3/orders:RFF/c:C506/c:e1154"/>	
									</xsl:if>
								</field>
								
							</row>
						</xsl:if>
					</xsl:for-each>
				</table>
				<!-- -->

			</tables>
		</bapirfc>

	</xsl:template>

</xsl:stylesheet>
