<?xml version="1.0"?>
<xsl:stylesheet xmlns:ili="http://www.interlis.ch/INTERLIS2.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html"/>
	<xsl:template match="/">
        <html>
        <head>
        <title>INTERLIS-Modellablage • Kanton Solothurn</title>
        <meta name="description" content="Modellablage für INTELIS-Datenmodelle der Geodaten des des Kantons Solothurn."/>
        <meta name="keywords" content="INTERLIS, Modellablage, Geodaten, Datenmodell, Solothurn, AGI, SOGIS"/>
        <meta name="author" content="Stefan Ziegler" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="cache-control" content="no-cache"/>

        <link type="text/css" rel="stylesheet" href="fonts.css" />
        <link type="text/css" rel="stylesheet" href="ilimodels.css" />
        <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

        </head>
        <body>
            <div id="container">
                <div class="logo">
                    <div>
                        <img src="Logo.png" alt="Logo Kanton Solothurn" style="max-width: 100%; min-width:200px;"/>
                    </div>
                </div>

                <div>
                    <i style="line-height:40px; vertical-align:middle;" class="material-icons md-18">home</i>
                    <ul class="breadcrumb">
                        <li><a href="https://agi.so.ch">Home</a></li>
                        <li class="active">Datenmodelle</li>
                    </ul>
                </div>

                <div id="title">
                    Datenmodelle Kanton Solothurn
                </div>

                <xsl:apply-templates select="ili:TRANSFER/ili:DATASECTION/ili:IliRepository09.RepositoryIndex" />

            </div>
        </body>
        </html>

	</xsl:template>

    <xsl:template match="ili:IliRepository09.RepositoryIndex">
        <xsl:for-each select="ili:IliRepository09.RepositoryIndex.ModelMetadata">
            <xsl:sort select="substring(ili:File,1,3)" data-type="text"/>
            <xsl:sort select="ili:Name" data-type="text"/>

            <details>
                <summary>
                    <span><xsl:value-of select="ili:Name"/></span>
                    &#160;
                    <span>
                        <i>
                            <xsl:attribute name='class'>material-icons</xsl:attribute>
                            <xsl:attribute name='style'>vertical-align: -5px;</xsl:attribute>
                            <a>
                                <xsl:attribute name='class'>icon-link</xsl:attribute>
                                <xsl:attribute name='href' select="ili:File" />
                                launch
                            </a>
                        </i>


                    </span>

                </summary>
                <p>
                    <div style="overflow-x:auto;">
                        <table>
                            <colgroup>
                                <col span="1" style="width: 20%;"/>
                                <col span="1" style="width: 80%;"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>Beschreibung:</td><td>&#8212;</td>
                                </tr>
                                <tr>
                                    <td>Version:</td><td>2021-10-12</td>
                                </tr>
                                <tr>
                                    <td>Abhängigkeiten:</td>
                                        <xsl:if test="count(ili:dependsOnModel/ili:IliRepository09.ModelName_) > 0">
                                            <td>
                                                <xsl:for-each select="ili:dependsOnModel/ili:IliRepository09.ModelName_">
                                                    <xsl:value-of select="ili:value"/>       
                                                    <xsl:if test="position()!=last()">
                                                        <xsl:text>, </xsl:text>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </td>
                                        </xsl:if>
                                        <xsl:if test="count(ili:dependsOnModel/ili:IliRepository09.ModelName_) = 0">
                                            <td>
                                                <xsl:text>&#8212;</xsl:text>    
                                            </td>
                                        </xsl:if>

                                </tr>
                                <tr>
                                    <td>Fachamt:</td>
                                    <td>
                                        <a>
                                            <xsl:attribute name='class'>default-link</xsl:attribute>
                                            <xsl:attribute name='href' select="ili:Issuer"/>
                                            <xsl:value-of select="ili:Issuer"/>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Technischer Kontakt:</td>
                                    <td>
                                        <a>
                                            <xsl:attribute name='class'>default-link</xsl:attribute>
                                            <xsl:attribute name='href' select="ili:technicalContact"/>
                                            <xsl:value-of select="ili:technicalContact"/>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                
                
                </p>
            </details>

            <hr/>

        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>