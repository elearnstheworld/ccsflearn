<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/Accounts">
    <html>
        <head>
            <title>List of Clients</title>
            <style>
                table, th, td {
                    border: 1px solid black;
                    border-collapse: collapse;
                }
                td, th {
                    padding: 8px;
                }
                .account-total {
                    text-align: right;
                }
                .low-balance {
                    color: red;
                    font-weight: bold;
                }
            </style>
        </head>
        <body>
            <h1>List of Clients</h1>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Account Total</th>
                </tr>
                <xsl:apply-templates select="Client"/>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="Client">
    <tr>
        <td><xsl:value-of select="concat(Name/First, ' ', Name/Last)"/></td>
        <td><xsl:value-of select="Phone"/></td>
        <td><xsl:value-of select="E-mail"/></td>
        <td class="account-total">
            <xsl:choose>
                <xsl:when test="Account_Total &lt;= 80000">
                    <span class="low-balance">$<xsl:value-of select="Account_Total"/></span>
                </xsl:when>
                <xsl:otherwise>
                    $<xsl:value-of select="Account_Total"/>
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </tr>
</xsl:template>

</xsl:stylesheet>
