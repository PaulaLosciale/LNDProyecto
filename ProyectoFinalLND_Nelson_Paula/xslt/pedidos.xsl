<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <div class="document-container">
            <div class="document-header">
                <h2><i class="fas fa-clipboard-list"></i> Historial de Pedidos</h2>
                <div class="document-meta">
                    <span><i class="fas fa-calendar"></i> Fecha actualización: <xsl:value-of select="concesionario/fecha_actualizacion"/></span>
                    <span><i class="fas fa-list-ol"></i> Total pedidos: <xsl:value-of select="count(concesionario/pedidos/pedido)"/></span>
                </div>
            </div>
            
            <table class="professional-table">
                <thead>
                    <tr>
                        <th>ID Pedido</th>
                        <th>Fecha</th>
                        <th>Vehículo</th>
                        <th>Comprador</th>
                        <th>Vendedor</th>
                        <th>Precio</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="concesionario/pedidos/pedido">
                        <tr>
                            <td><xsl:value-of select="id"/></td>
                            <td><xsl:value-of select="fecha"/></td>
                            <td><xsl:value-of select="vehiculo"/></td>
                            <td><xsl:value-of select="comprador"/></td>
                            <td><xsl:value-of select="vendedor"/></td>
                            <td class="price"><xsl:value-of select="format-number(precio_final, '#,##0.00')"/> €</td>
                            <td>
                                <span class="status-{translate(estado, 'ÁÉÍÓÚáéíóú', 'AEIOUaeiou')}">
                                    <xsl:value-of select="estado"/>
                                </span>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>