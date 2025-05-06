<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Vehículos</title>
                <link rel="stylesheet" href="../css/styles.css"/>
            </head>
            <body>
                <div class="container">
                    <h1>Vehículos Disponibles</h1>
                    <div class="vehicle-grid">
                        <xsl:for-each select="concesionario/vehiculos/vehiculo">
                            <div class="vehicle-card">
                                <div class="vehicle-image">
                                    <img src="{imagen}" alt="{marca} {modelo}" style="width: 100%; height: 200px; object-fit: cover;"/>
                                </div>
                                <div class="vehicle-details">
                                    <h2><xsl:value-of select="marca"/> <xsl:value-of select="modelo"/></h2>
                                    <div class="detail-row">
                                        <span class="detail-label">Matrícula:</span>
                                        <span class="detail-value"><xsl:value-of select="matricula"/></span>
                                    </div>
                                    <div class="detail-row">
                                        <span class="detail-label">Año:</span>
                                        <span class="detail-value"><xsl:value-of select="anioFabricacion"/></span>
                                    </div>
                                    <div class="detail-row">
                                        <span class="detail-label">Kilometraje:</span>
                                        <span class="detail-value"><xsl:value-of select="kilometraje"/> km</span>
                                    </div>
                                    <div class="detail-row">
                                        <span class="detail-label">Combustible:</span>
                                        <span class="detail-value"><xsl:value-of select="combustible"/></span>
                                    </div>
                                    <div class="detail-row">
                                        <span class="detail-label">Potencia:</span>
                                        <span class="detail-value"><xsl:value-of select="potencia"/> HP</span>
                                    </div>
                                    <div class="detail-row">
                                        <span class="detail-label">Garantía:</span>
                                        <span class="detail-value"><xsl:value-of select="garantia"/></span>
                                    </div>
                                    <div class="detail-row">
                                        <span class="detail-label">Precio:</span>
                                        <span class="detail-value"><xsl:value-of select="format-number(precio, '#,##0.00')"/>€</span>
                                    </div>
                                    <div class="detail-row">
                                        <span class="detail-label">Disponible:</span>
                                        <span class="detail-value">
                                            <xsl:choose>
                                                <xsl:when test="normalize-space(disponible) = 'true'">
                                                    <span class="status-emoji">✅</span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="status-emoji">❌</span>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </span>
                                    </div>
                                    <div class="detail-row">
                                        <a href="{web}" target="_blank" class="web-link">Ver en web oficial</a>
                                    </div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="update-info">
                        <p>Última actualización: <xsl:value-of select="concesionario/fecha_actualizacion"/></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>