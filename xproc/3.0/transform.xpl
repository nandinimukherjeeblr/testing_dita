<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">
    <!-- Bind on input the personal.xml file to be transformed with personal.xsl stylesheet -->
    <p:input port="source">
        <p:document href="../../personal.xml"/>
    </p:input>
    <!-- Declare the output port. -->
    <p:output port="result"/>
    <!-- Apply transformation. -->
    <p:xslt>
        <p:with-input port="source"/>
        <p:with-input port="stylesheet">
            <p:document href="../../personal.xsl"/>
        </p:with-input>
    </p:xslt>
</p:declare-step>
