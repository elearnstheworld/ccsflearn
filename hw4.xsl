<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/Accounts">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="description" content="ABC Financial Startup Client Information"/>
                <title>ABC Financial Startup</title>
                <style>
                    h1 {
                        text-align: center;
                    }
                    img {
                        display: block;
                        margin: 0 auto;
                    }
                </style>
            </head>
            <body>
                <h1>ABC Financial Startup</h1>
                <img src="financialstartup.jpg" alt="ABC Financial Startup Logo" />
                <p>We are a very young financial manager company and we are proud of our clients</p>
                <p>We have started with 1 client a little bit more than 10 years ago and now we have <xsl:value-of select="count(Client)"/> clients!</p>
                <p>
                    These are our clients: 
                    <xsl:for-each select="Client">
                        <xsl:value-of select="concat(Name/First, ' ', Name/Last)"/>
                        <xsl:choose>
                            <xsl:when test="position()=last()">
                                <xsl:text>.</xsl:text>
                            </xsl:when>
                            <xsl:when test="position()=last() - 1">
                                <xsl:text>, and </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>, </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </p>
                
                <p>
                    <xsl:value-of select="count(Client[Years > 7])"/> have been with us for more than 7 years!
                </p>
                
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
