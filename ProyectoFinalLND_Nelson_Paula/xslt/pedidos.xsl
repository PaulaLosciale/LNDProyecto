<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <div class="order-container">
            <h2><i class="fas fa-clipboard-list"></i> Detalles de Pedidos</h2>
            
            <div class="doc-info">
                <p><strong>Fecha actualización:</strong> <xsl:value-of select="concesionario/fecha_actualizacion"/></p>
            </div>
            
            <div class="order-list">
                <xsl:for-each select="concesionario/pedidos/pedido">
                    <div class="order-card">
                        <div class="order-header">
                            <h3>Pedido <xsl:value-of select="id"/></h3>
                            <span class="order-status" data-status="{estado}">
                                <xsl:value-of select="estado"/>
                            </span>
                        </div>
                        
                        <div class="order-details">
                            <div class="detail-row">
                                <span class="detail-label">Fecha:</span>
                                <span class="detail-value"><xsl:value-of select="fecha"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Vehículo:</span>
                                <span class="detail-value vehicle"><xsl:value-of select="vehiculo"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Comprador:</span>
                                <span class="detail-value customer"><xsl:value-of select="comprador"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Vendedor:</span>
                                <span class="detail-value seller"><xsl:value-of select="vendedor"/></span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Precio final:</span>
                                <span class="detail-value price">
                                    <xsl:value-of select="format-number(precio_final, '#,##0.00')"/> €
                                </span>
                            </div>
                            <div class="detail-row">
                                <span class="detail-label">Método de pago:</span>
                                <span class="detail-value payment"><xsl:value-of select="metodo_pago"/></span>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>