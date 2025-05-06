<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <div class="seller-container">
            <h2><i class="fas fa-user-tie"></i> Detalles de Vendedores</h2>
            
            <div class="doc-info">
                <p><strong>Fecha actualización:</strong> <xsl:value-of select="concesionario/fecha_actualizacion"/></p>
            </div>
            
            <div class="seller-list">
                <xsl:for-each select="concesionario/vendedores/vendedor">
                    <div class="seller-card">
                        <div class="seller-header">
                            <h3><xsl:value-of select="nombre"/></h3>
                            <span class="seller-id"><xsl:value-of select="id"/></span>
                        </div>
                        
                        <div class="seller-details">
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
                                <span class="detail-label">Ventas del mes:</span>
                                <span class="detail-value sales"><xsl:value-of select="ventas_mes"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Comisión:</span>
                                <span class="detail-value commission">
                                    <xsl:value-of select="format-number(comision, '#,##0.00')"/> €
                                </span>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>