<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>
            &lt;!DOCTYPE html>
            &lt;meta charset="utf-8"/>
        </xsl:text>
        <html>
            <body>
                <h1>
                    Gry Bethesdy:
                </h1>
                <table>
                    <xsl:for-each select="/products/games/game[developer = 'Bethesda']">
                        <xsl:sort select="price" order="descending" data-type="number"/>
                        <xsl:choose>
                            <xsl:when test="position() mod 2 = 1">
                                <tr style = "background-color:green">
                                    <td>
                                        <xsl:text>
                                            Nazwa:
                                        </xsl:text>
                                        <nazwa>
                                            <xsl:value-of select="name"/>
                                        </nazwa>
                                    </td>
                                    <td>
                                        <xsl:text>
                                            Cena:
                                        </xsl:text>
                                        <price>
                                            <xsl:value-of select="price"/>
                                        </price>
                                    </td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                    <tr style = "background-color:red">
                                        <td>
                                            <xsl:text>
                                                Nazwa:
                                            </xsl:text>
                                            <nazwa>
                                                <xsl:value-of select="name"/>
                                            </nazwa>
                                        </td>
                                        <td>
                                            <xsl:text>
                                                Cena:
                                            </xsl:text>
                                            <price>
                                                <xsl:value-of select="price"/>
                                            </price>
                                        </td>
                                    </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
                <table>
                    <tr>
                        <th>
                            <xsl:text>
                                Ceny wszystkich gier:
                            </xsl:text>
                        </th>
                        <td>
                            <xsl:value-of select="sum(/products/games/game/price)"/>
                        </td>
                        <th>
                            <xsl:text>
                                Średnia cen Bethesdy:
                            </xsl:text>
                            <td>
                                <xsl:value-of select="format-number(sum(/products/games/game[developer = 'Bethesda']/price) div count(/products/games/game/price), '#.##')"/>
                            </td>
                        </th>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>