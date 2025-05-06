<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <div class="customer-container">
            <h2><i class="fas fa-users"></i> Detalles de Compradores</h2>
            
            <div class="doc-info">
                <p><strong>Fecha actualización:</strong> <xsl:value-of select="concesionario/fecha_actualizacion"/></p>
            </div>
            
            <div class="customer-list">
                <xsl:for-each select="concesionario/compradores/comprador">
                    <div class="customer-card">
                        <div class="customer-header">
                            <h3><xsl:value-of select="nombre"/></h3>
                            <span class="customer-id"><xsl:value-of select="id"/></span>
                        </div>
                        
                        <div class="customer-details">
                            <div class="detail-row">
                                <span class="detail-label">DNI:</span>
                                <span class="detail-value"><xsl:value-of select="dni"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Teléfono:</span>
                                <span class="detail-value"><xsl:value-of select="telefono"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Email:</span>
                                <span class="detail-value"><xsl:value-of select="email"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Vehículos comprados:</span>
                                <span class="detail-value vehicles">
                                    <xsl:for-each select="vehiculos_comprados/vehiculo">
                                        <span class="vehicle-tag"><xsl:value-of select="."/></span>
                                    </xsl:for-each>
                                </span>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>