<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <div class="vehicle-container">
            <h2><i class="fas fa-car"></i> Detalles de Vehículos</h2>
            
            <!-- Verificación de estructura XML -->
            <xsl:if test="not(concesionario/vehiculos)">
                <div class="error">Error: Estructura XML no válida para vehículos</div>
            </xsl:if>
            
            <div class="vehicle-list">
                <xsl:for-each select="concesionario/vehiculos/vehiculo">
                    <div class="vehicle-card">
                        <div class="vehicle-header">
                            <h3>
                                <xsl:value-of select="marca"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="modelo"/>
                            </h3>
                            <span class="vehicle-status">
                                <xsl:choose>
                                    <xsl:when test="disponible = 'true'">Disponible</xsl:when>
                                    <xsl:otherwise>Vendido</xsl:otherwise>
                                </xsl:choose>
                            </span>
                        </div>
                        
                        <div class="vehicle-details">
                            <div class="detail-row">
                                <span class="detail-label">Matrícula:</span>
                                <span class="detail-value"><xsl:value-of select="matricula"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Año:</span>
                                <span class="detail-value"><xsl:value-of select="anioFabricacion"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Precio:</span>
                                <span class="detail-value price">
                                    <xsl:value-of select="format-number(precio, '#,##0.00')"/> €
                                </span>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>