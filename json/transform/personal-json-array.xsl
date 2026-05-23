<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Stylesheet used to process a JSON document using json-doc() function
    and generate an HTML output from the JSON content
-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:array="http://www.w3.org/2005/xpath-functions/array"
    xmlns:person="http://www.personnel.com/person"
    exclude-result-prefixes="#all">
    
    <xsl:output method="html"/>
    
    <!-- The initial template that process the JSON -->
    <xsl:template match=".[. instance of array(*)]">
        <html>
            <head>
                <title>Employees</title>
                <style type="text/css">
                    body {
                        font-family: Helvetica, Arial, sans-serif;
                    }
                    .header {
                        color: #FFFFFF;
                    }
                </style>
            </head>
                
            <xsl:element name="table">
                <xsl:attribute name="border">1</xsl:attribute>
                <tr class="header">
                    <xsl:attribute name="bgcolor">#336666</xsl:attribute>
                    <xsl:attribute name="align">center</xsl:attribute>
                    <td>
                        <font face="Arial" size="3">
                            <b>Name</b>
                        </font>
                    </td>
                    <td>
                        <font face="verdana" size="3">
                            <b>Email</b>
                        </font>
                    </td>
                    <td>
                        <font face="verdana" size="3">
                            <b>Link</b>
                        </font>
                    </td>
                </tr>
                <xsl:sequence select="array:for-each(., person:apply-templates#1)"/>
            </xsl:element>
        </html>
    </xsl:template>

    <xsl:function name="person:apply-templates">
        <xsl:param name="input"/>
        <xsl:apply-templates select="$input"/>
    </xsl:function>

    <!-- Template that matches map objects -->
    <xsl:template match=".[. instance of map(*)]">
        <xsl:element name="tr">
            <xsl:attribute name="align">center</xsl:attribute>
            <xsl:element name="td">
                <xsl:attribute name="width">120</xsl:attribute>
                <font face="verdana" size="3">
                    <i>
                        <xsl:value-of select="?name?family"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="?name?given"/>
                    </i>
                </font>
            </xsl:element>
            <xsl:element name="td">
                <xsl:attribute name="width">120</xsl:attribute>
                <font face="verdana" size="3">
                    <xsl:value-of select="?email"/>
                </font>
            </xsl:element>
            <xsl:element name="td">
                <font color="black" face="verdana" size="3">
                    <xsl:value-of select="?link?subordinates"/>
                    <xsl:value-of select="?link?manager"/>
                </font>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
