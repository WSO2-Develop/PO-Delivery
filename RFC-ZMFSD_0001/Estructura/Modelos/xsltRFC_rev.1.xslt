<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:env="urn:org.milyn.edi.unedifact.v41" exclude-result-prefixes="soapenv env">
	<xsl:strip-space elements="*"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
	<xsl:template match="/">
		<root>
			<xsl:apply-templates/>
		</root>
	</xsl:template>
	<xsl:template match="ORDERS">
		<bapirfc name="ZMFSD_0001">
			<tables>
				<!-- T_HEADER -->
				<table name="T_HEADER">
					<xsl:for-each select="Beginning_of_message">
						<row id="{position() - 1}">
							<field name="BSTKD">
								<xsl:value-of select="Document_message_number"/>
							</field>
							<xsl:for-each select="parent::*/Date_time_period/DATE_TIME_PERIOD">
								<xsl:choose>
									<xsl:when test="Date_time_period_qualifier = 137">
										<field name="BSTDK">
											<xsl:value-of select="Date_time_period"/>
										</field>
									</xsl:when>
									<xsl:when test="string(Date_time_period_qualifier) = '43E'">
										<field name="BSTDK_E">
											<xsl:value-of select="Date_time_period"/>
										</field>
									</xsl:when>
									<xsl:when test="Date_time_period_qualifier = 10">
										<field name="VDATU">
											<xsl:value-of select="Date_time_period"/>
										</field>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
							<xsl:for-each select="parent::*/Segment_group_1">
								<xsl:choose>
									<xsl:when test="Reference/REFERENCE/Reference_qualifier = 'SD'">
										<field name="ZDEP">
											<xsl:value-of select="Reference/REFERENCE/Reference_number"/>
										</field>
									</xsl:when>
									<xsl:when test="Reference/REFERENCE/Reference_qualifier = 'ZZZ'">
										<field name="ZTPO">
											<xsl:value-of select="Reference/REFERENCE/Reference_number"/>
										</field>
									</xsl:when>
									<xsl:otherwise>
										<field name="ZMPO">
											<xsl:value-of select="Reference/REFERENCE/Reference_number"/>
										</field>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
							<xsl:for-each select="parent::*/Segment_group_7">
								<field name="WAERK">
									<xsl:value-of select="Currencies/CURRENCY_DETAILS_-_-1/Currency__coded"/>
								</field>
							</xsl:for-each>
							<xsl:for-each select="parent::*/Segment_group_8">
								<field name="ZTERM">
									<xsl:value-of select="Payment_terms_basis/TERMS_TIME_INFORMATION/Time_relation__coded"/>
								</field>
								<field name="ZMODP">
									<xsl:value-of select="Payment_terms_basis/TERMS_TIME_INFORMATION/Type_of_period__coded"/>
								</field>
							</xsl:for-each>
						</row>
					</xsl:for-each>
				</table>
				<!-- T_HEADER_INTER -->
				<table name="T_HEADER_INTER">
					<xsl:for-each select="Segment_group_2">
						<row id="{position() - 1}">
							<field name="BSTKD">
								<xsl:value-of select="parent::*/Beginning_of_message/Document_message_number"/>
							</field>
							<xsl:if test="Name_and_address/Party_qualifier != ''">
								<field name="ZTIPO">
									<xsl:value-of select="Name_and_address/Party_qualifier"/>
								</field>
							</xsl:if>
							<xsl:if test="Name_and_address/PARTY_IDENTIFICATION_DETAILS/Party_id._identification != ''">
								<field name="EXPNR">
									<xsl:value-of select="Name_and_address/PARTY_IDENTIFICATION_DETAILS/Party_id._identification"/>
								</field>
							</xsl:if>
							<xsl:if test="Name_and_address/PARTY_NAME/Party_name_-_-1 != ''">
								<field name="NAME1">
									<xsl:value-of select="Name_and_address/PARTY_NAME/Party_name_-_-1"/>
								</field>
							</xsl:if>
							<xsl:if test="Segment_group_3/Reference/REFERENCE/Reference_qualifier = 'IA'">
								<field name="ZVENDOR">
									<xsl:value-of select="Segment_group_3/Reference/REFERENCE/Reference_number"/>
								</field>
							</xsl:if>
						</row>
					</xsl:for-each>
				</table>
				<!-- T_DETAIL_GRAL -->
				<table name="T_DETAIL_GRAL">
					<xsl:for-each select="Segment_group_25">
						<row id="{position() - 1}">
							<field name="BSTKD">
								<xsl:value-of select="parent::*/Beginning_of_message/Document_message_number"/>
							</field>
							<xsl:if test="Line_item/Line_item_number != ''">
								<field name="POSNR">
									<xsl:value-of select="Line_item/Line_item_number"/>
								</field>
							</xsl:if>
							<xsl:if test="Line_item/ITEM_NUMBER_IDENTIFICATION/Item_number != ''">
								<field name="KDMAT">
									<xsl:value-of select="Line_item/ITEM_NUMBER_IDENTIFICATION/Item_number"/>
								</field>
							</xsl:if>
							<xsl:if test="Additional_product_id/ITEM_NUMBER_IDENTIFICATION_-_-1/Item_number != ''">
								<field name="ZDMAT">
									<xsl:value-of select="Additional_product_id/ITEM_NUMBER_IDENTIFICATION_-_-1/Item_number"/>
								</field>
							</xsl:if>
							<xsl:if test="Additional_product_id/ITEM_NUMBER_IDENTIFICATION_-_-2/Item_number != ''">
								<field name="ZVENDOR">
									<xsl:value-of select="Additional_product_id/ITEM_NUMBER_IDENTIFICATION_-_-2/Item_number"/>
								</field>
							</xsl:if>
							<xsl:if test="Quantity/QUANTITY_DETAILS/Quantity != ''">
								<field name="ZMENG">
									<xsl:value-of select="Quantity/QUANTITY_DETAILS/Quantity"/>
								</field>
							</xsl:if>
							<xsl:if test="Monetary_amount/MONETARY_AMOUNT/Monetary_amount != ''">
								<field name="ZPREC">
									<xsl:value-of select="Monetary_amount/MONETARY_AMOUNT/Monetary_amount"/>
								</field>
							</xsl:if>
							<xsl:if test="Segment_group_28/Price_details/PRICE_INFORMATION/Price != ''">
								<field name="NETWR">
									<xsl:value-of select="Segment_group_28/Price_details/PRICE_INFORMATION/Price"/>
								</field>
							</xsl:if>
							<xsl:if test="Segment_group_28/Price_details/PRICE_INFORMATION/Price_type_qualifier != ''">
								<field name="ZTIPP">
									<xsl:value-of select="Segment_group_28/Price_details/PRICE_INFORMATION/Price_type_qualifier"/>
								</field>
							</xsl:if>
							<xsl:if test="Segment_group_28/Price_details/PRICE_INFORMATION/Measure_unit_qualifier != ''">
								<field name="VRKME">
									<xsl:value-of select="Segment_group_28/Price_details/PRICE_INFORMATION/Measure_unit_qualifier"/>
								</field>
							</xsl:if>
							<xsl:if test="Segment_group_30/Package/Number_of_packages != ''">
								<field name="ZNUMP">
									<xsl:value-of select="Segment_group_30/Package/Number_of_packages"/>
								</field>
							</xsl:if>
							<xsl:if test="Segment_group_30/Package/PACKAGING_DETAILS/Packaging_level__coded != ''">
								<field name="ZPACL">
									<xsl:value-of select="Segment_group_30/Package/PACKAGING_DETAILS/Packaging_level__coded"/>
								</field>
							</xsl:if>
						</row>
					</xsl:for-each>
				</table>
				<!-- T_DETAIL_ITEM -->
				<table name="T_DETAIL_ITEM">
					<xsl:for-each select="Segment_group_25">
						<row id="{position() - 1}">
							<field name="BSTKD">
								<xsl:value-of select="parent::*/Beginning_of_message/Document_message_number"/>
							</field>
							<xsl:if test="Line_item/Line_item_number != ''">
								<field name="POSNR">
									<xsl:value-of select="Line_item/Line_item_number"/>
								</field>
							</xsl:if>
							<xsl:if test="Line_item/ITEM_NUMBER_IDENTIFICATION/Item_number != ''">
								<field name="KDMAT">
									<xsl:value-of select="Line_item/ITEM_NUMBER_IDENTIFICATION/Item_number"/>
								</field>
							</xsl:if>
							<xsl:if test="Item_description/Item_description_type__coded != ''">
								<field name="ZTIPO">
									<xsl:value-of select="Item_description/Item_description_type__coded"/>
								</field>
							</xsl:if>
							<xsl:if test="Item_description/Item_characteristic__coded != ''">
								<field name="ZCART">
									<xsl:value-of select="Item_description/Item_characteristic__coded"/>
								</field>
							</xsl:if>
							<xsl:if test="Item_description/ITEM_DESCRIPTION/Item_description_identification != ''">
								<field name="ZDESC">
									<xsl:value-of select="Item_description/ITEM_DESCRIPTION/Item_description_identification"/>
								</field>
							</xsl:if>
						</row>
					</xsl:for-each>
				</table>
				<!-- T_DETAIL_INTER -->
				<table name="T_DETAIL_INTER">
					<xsl:for-each select="Segment_group_25/Segment_group_33">
						<row id="{position() - 1}">
							<field name="BSTKD">
								<xsl:value-of select="parent::*/parent::*/Beginning_of_message/Document_message_number"/>
							</field>
							<xsl:if test="parent::*/Line_item/Line_item_number != ''">
								<field name="POSNR">
									<xsl:value-of select="parent::*/Line_item/Line_item_number"/>
								</field>
							</xsl:if>
							<xsl:if test="Place_location_identification/LOCATION_IDENTIFICATION/Place_location_identification != ''">
								<field name="EXPNR">
									<xsl:value-of select="Place_location_identification/LOCATION_IDENTIFICATION/Place_location_identification"/>
								</field>
							</xsl:if>
							<xsl:if test="Quantity/QUANTITY_DETAILS/Quantity != ''">
								<field name="ZMENG">
									<xsl:value-of select="Quantity/QUANTITY_DETAILS/Quantity"/>
								</field>
							</xsl:if>
						</row>
					</xsl:for-each>
				</table>
			</tables>
		</bapirfc>
	</xsl:template>
	<!-- <xsl:template match="ORDERS" name="ORDERS"> 
		<xsl:apply-templates select="order" />
	</xsl:template> -->
	<!-- <xsl:template match="Beginning_of_message">
			<field name="BSTKD">
				<xsl:value-of select="Document_message_number" />
			</field>
	</xsl:template> -->
	<xsl:template match="env:UNH"/>
	<xsl:template match="env:UNT"/>
	<xsl:template match="env:UNZ"/>
</xsl:stylesheet>
