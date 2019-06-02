<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>
            &lt;!DOCTYPE html>
            &lt;meta charset="utf-8"/>
        </xsl:text>
        <xsl:comment>
            Całkiem przydatny komentarz
        </xsl:comment>
        <html>
            <head>
                <title>HTML generated</title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <div class="main">
                    <h1>
                        Gry Bethesdy:
                    </h1>
                    <table id = "info">
                        <xsl:for-each select="/products/games/game[developer = 'Bethesda']">
                            <xsl:sort select="price" order="descending" data-type="number"/>
                            <xsl:choose>
                                <xsl:when test="position() mod 2 = 1">
                                    <tr id="odd">
                                        <td>
                                        <xsl:text>
                                            Name:
                                        </xsl:text>
                                            <nazwa>
                                                <xsl:value-of select="name"/>
                                            </nazwa>
                                        </td>
                                        <td>
                                            <price>
                                                <xsl:value-of select="price"/>
                                            </price>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr id="even">
                                        <td>
                                            <xsl:text>
                                                Name:
                                            </xsl:text>
                                            <nazwa>
                                                <xsl:value-of select="name"/>
                                            </nazwa>
                                        </td>
                                        <td>
                                            <price>
                                                <xsl:value-of select="price"/>
                                            </price>
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </table>
                    <table class="calculations">
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
                            </th>
                                <td>
                                    <xsl:value-of
                                            select="format-number(sum(/products/games/game[developer = 'Bethesda']/price) div count(/products/games/game/price), '#.##')"/>
                                </td>
                            <th>
                            <xsl:text>
                                Liczba gier Bethesdy:
                            </xsl:text>
                            </th>
                            <td>
                                <xsl:value-of
                                        select="count(/products/games/game[developer = 'Bethesda'])"/>
                            </td>
                            <xsl:comment>
                                czy liczba gier jest większa niż 4
                            </xsl:comment>
                            <th>
                                czy liczba gier jest większa niż 4
                            </th>
                            <td>
                                <xsl:if test="count(/products/games/game) &gt; 4">
                            <xsl:text>
                                Gier jest więcej niż 4
                            </xsl:text>
                                </xsl:if>
                            </td>
                        </tr>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>