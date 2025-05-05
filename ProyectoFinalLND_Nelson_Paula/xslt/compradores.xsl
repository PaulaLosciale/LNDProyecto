<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <div class="doc-info">
            <h2>Lista de Compradores</h2>
            <p><strong>Fecha actualización:</strong> <xsl:value-of select="concesionario/fecha_actualizacion"/></p>
        </div>
        
        <table class="viewer-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>DNI</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>Vehículos comprados</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="concesionario/compradores/comprador">
                    <tr>
                        <td><xsl:value-of select="id"/></td>
                        <td><xsl:value-of select="nombre"/></td>
                        <td><xsl:value-of select="dni"/></td>
                        <td><xsl:value-of select="telefono"/></td>
                        <td><xsl:value-of select="email"/></td>
                        <td>
                            <xsl:for-each select="vehiculos_comprados/vehiculo">
                                <xsl:value-of select="."/>
                                <xsl:if test="position() != last()">, </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>