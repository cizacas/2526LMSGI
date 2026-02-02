<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Listado de Libros</h2>
        <ul>
          <xsl:for-each select="libros/libro">
            <li>
              <strong><xsl:value-of select="titulo"/></strong> - <xsl:value-of select="autor"/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>