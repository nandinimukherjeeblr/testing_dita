<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:array="http://www.w3.org/2005/xpath-functions/array"
    xmlns:f="http://some.function.com/function"
    exclude-result-prefixes="xsl xs map array f">
    
    <!-- Template that matches arrays -->
    <xsl:template match=".[. instance of array(*)]">
        <xsl:element name="array">
            <!-- Go in the JSON array -->
            <xsl:sequence select="array:for-each(., f:apply-templates#1)"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Template that matches map objects -->
    <xsl:template match=".[. instance of map(*)]">
        <xsl:variable name="theMap" select="."/>
        <xsl:for-each select="map:keys(.)">
            <xsl:element name="{.}">
                <xsl:variable name="mapEntry" select="map:get($theMap, .)"/>
                <xsl:choose>
                    <xsl:when test="$mapEntry instance of map(*)">
                        <xsl:apply-templates select="$mapEntry"/>
                    </xsl:when>
                    <xsl:when test="$mapEntry instance of array(*)">
                        <xsl:apply-templates select="$mapEntry"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$mapEntry"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match=".[. instance of xs:anyAtomicType]">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:function name="f:apply-templates">
        <xsl:param name="input"/>
        <xsl:choose>
            <xsl:when test="$input instance of map(*)">
                <xsl:element name="entry">
                    <xsl:apply-templates select="$input"/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$input instance of array(*)">
                <xsl:apply-templates select="$input"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$input"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>