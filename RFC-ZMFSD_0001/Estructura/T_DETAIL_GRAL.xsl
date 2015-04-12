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
				<table name="T_DETAIL_GRAL">
					<xsl:for-each select=".">
						<row id="{position() - 1}">
							<field name="BSTKD"><!-- Nro de orden -->
								<xsl:value-of select="orders:BGM/c:e1004" />
							</field>
							
							
							<!-- <field name="POSNR">
								<xsl:value-of select="Line_item/Line_item_number"/>
							</field>
						
							<field name="KDMAT">
								<xsl:value-of select="Line_item/ITEM_NUMBER_IDENTIFICATION/Item_number"/>
							</field>
						
							<field name="ZDMAT">
								<xsl:value-of select="Additional_product_id/ITEM_NUMBER_IDENTIFICATION_-_-1/Item_number"/>
							</field>
						
							<field name="ZVENDOR">
								<xsl:value-of select="Additional_product_id/ITEM_NUMBER_IDENTIFICATION_-_-2/Item_number"/>
							</field>
						
							<field name="ZMENG">
								<xsl:value-of select="Quantity/QUANTITY_DETAILS/Quantity"/>
							</field>
						
							<field name="ZPREC">
								<xsl:value-of select="Monetary_amount/MONETARY_AMOUNT/Monetary_amount"/>
							</field>
						
							<field name="NETWR">
								<xsl:value-of select="Segment_group_28/Price_details/PRICE_INFORMATION/Price"/>
							</field>
						
							<field name="ZTIPP">
								<xsl:value-of select="Segment_group_28/Price_details/PRICE_INFORMATION/Price_type_qualifier"/>
							</field>
						
							<field name="VRKME">
								<xsl:value-of select="Segment_group_28/Price_details/PRICE_INFORMATION/Measure_unit_qualifier"/>
							</field>
						
							<field name="ZNUMP">
								<xsl:value-of select="Segment_group_30/Package/Number_of_packages"/>
							</field>
						
							<field name="ZPACL">
								<xsl:value-of select="Segment_group_30/Package/PACKAGING_DETAILS/Packaging_level__coded"/>
							</field> -->
							
						</row>
					</xsl:for-each>
				</table>
				<!-- -->

			</tables>
		</bapirfc>

	</xsl:template>

</xsl:stylesheet>