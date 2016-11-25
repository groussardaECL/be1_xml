<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xhtml" doctype-public="-//W3C//DTD XHTML 1.1//EN"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel='stylesheet' href='css-stylesheet2.css' />
                <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' />
                <link href="https://fonts.googleapis.com/css?family=Bungee|Roboto" rel="stylesheet"/>
                <title>Elèves et Profs</title>
            </head>
            <body>
                <h1>Liste des élèves et professeurs</h1>
                <table border="1" style="padding:10px">
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Téléphone</th>
                        <th>Email</th>
                        <th>Adresse</th>
                        <th>Ville</th>
                    </tr>
                    <xsl:for-each select="option/personnes/personne">
                        <tr>
                            <td style="padding:5px"><xsl:apply-templates select="nom"/></td>
                            <td style="padding:5px"><xsl:apply-templates select="prénom"/></td>
                            <td style="padding:5px"><xsl:apply-templates select="phone"/></td>
                            <td style="padding:5px">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        mailto:<xsl:value-of select="email"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="email"/>
                                </xsl:element>
                            </td>
                            <td style="padding:5px"><xsl:apply-templates select="adresse"/></td>
                            <td style="padding:5px"><xsl:apply-templates select="ville"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
