<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl     = "http://www.w3.org/1999/XSL/Transform"
							  xmlns:soapenv = "http://schemas.xmlsoap.org/soap/envelope/"
							  xmlns:env		= "urn:org.milyn.edi.unedifact.v41"
							  xmlns:orders  = "urn:org.milyn.edi.unedifact:un:d96a:orders"
							  xmlns:c       = "urn:org.milyn.edi.unedifact:un:d96a:common"
							  exclude-result-prefixes="soapenv env orders c"> 
	
	<xsl:strip-space elements="*"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	
	<xsl:template match="/">
		<root>
			<xsl:apply-templates/>
		</root>
	</xsl:template>
	
	<xsl:template match="env:UNH"/>
	<xsl:template match="env:UNT"/>
	<xsl:template match="env:UNZ"/>
	
	<xsl:template name="BSTKD">
	<!-- Nro de orden -->
		<!-- <xsl:for-each select="//orders:BGM"> -->
			<field name="BSTKD">
				<xsl:value-of select="//orders:BGM/c:e1004" />
			</field>
		<!-- </xsl:for-each> -->
	</xsl:template>
	
	<xsl:template name="BSTDK">
	<!-- Fecha de pedido -->
		<field name="BSTDK">
			<xsl:for-each select="//orders:DTM/c:C507">
				<xsl:choose>
					<xsl:when test="c:e2005 = 137">
						<xsl:value-of select="c:e2380"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</field>
	</xsl:template>
	
	<xsl:template name="BSTDK_E">
	<!-- Fecha vencimiento -->
		<field name="BSTDK_E">
			<xsl:for-each select="//orders:DTM/c:C507">
				<xsl:choose>
					<xsl:when test="string(c:e2005) = '43E'">
						<xsl:value-of select="c:e2380"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</field>
	</xsl:template>
	
	<xsl:template name="VDATU">
	<!-- Fecha de despacho -->
		<field name="VDATU">
			<xsl:for-each select="//orders:DTM/c:C507">
				<xsl:choose>
					<xsl:when test="c:e2005 = 10">
						<xsl:value-of select="c:e2380"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</field>
	</xsl:template>
	
	<xsl:template name="ZDEP">
	<!-- Departamento -->
		<field name="ZDEP">
			<xsl:for-each select="//orders:Segment_group_1/orders:RFF/c:C506">
				<xsl:choose>
					<xsl:when test="string(c:e1153) = 'SD'">
						<xsl:value-of select="c:e1154"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</field>
	</xsl:template>
	
	<xsl:template name="ZTPO">
	<!-- Tipo PO -->
		<field name="ZTPO">
			<xsl:for-each select="//orders:Segment_group_1/orders:RFF/c:C506">
				<xsl:choose>
					<xsl:when test="string(c:e1153) = 'ZZZ'">
						<xsl:value-of select="c:e1154"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</field>
	</xsl:template>
	
	<xsl:template name="ZMPO">
	<!-- Descripcion de Orden de compra -->
		<field name="ZMPO">
			<xsl:for-each select="//orders:Segment_group_1/orders:RFF/c:C506">
				<xsl:choose>
					<xsl:when test="string(c:e1153) = 'PD'">
						<xsl:value-of select="c:e1154"/>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</field>
	</xsl:template>
	
	<xsl:template name="WAERK">
	<!-- Moneda -->
		<field name="WAERK">
			<xsl:value-of select="//orders:Segment_group_7/orders:CUX/c:C504_-_-1/c:e6345"/>
		</field>
	</xsl:template>
	
	<xsl:template name="ZTERM">
	<!-- Cond de pago -->
		<field name="ZTERM">
			<xsl:value-of select="//orders:Segment_group_8/orders:PAT/c:C112/c:e2009"/>
		</field>
	</xsl:template>
	
	<xsl:template name="ZMODP">
	<!-- Modo Pago -->
		<field name="ZMODP">
			<xsl:value-of select="//orders:Segment_group_8/orders:PAT/c:C112/c:e2151"/>
		</field>
	</xsl:template>
	



	<xsl:template match="">
		<!-- TODO: Auto-generated template -->
	</xsl:template>
	
	
	
	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>	
</xsl:stylesheet>