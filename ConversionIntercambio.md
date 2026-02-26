# Conversión y adaptación de documentos para el intercambio de información
- [Conversión y adaptación de documentos para el intercambio de información](#conversión-y-adaptación-de-documentos-para-el-intercambio-de-información)
  - [1. Introducción](#1-introducción)
  - [2. ¿Dónde se usa la conversión de documentos?](#2-dónde-se-usa-la-conversión-de-documentos)
  - [3. Tecnologías y herramientas básicas](#3-tecnologías-y-herramientas-básicas)
    - [Referencias XSLT (para XML)](#referencias-xslt-para-xml)
    - [3.1 ¿Qué es XSLT?](#31-qué-es-xslt)
      - [¿Para qué se usa?](#para-qué-se-usa)
      - [¿Cómo funciona?](#cómo-funciona)
      - [Ejemplo paso a paso:](#ejemplo-paso-a-paso)
      - [Estructura básica de una plantilla XSLT](#estructura-básica-de-una-plantilla-xslt)
      - [Principales elementos de XSLT:](#principales-elementos-de-xslt)
      - [Otras instrucciones útiles de XSLT](#otras-instrucciones-útiles-de-xslt)
      - [¿Cómo se aplica un XSLT?](#cómo-se-aplica-un-xslt)
    - [3.2 Transformación y validación de JSON](#32-transformación-y-validación-de-json)
      - [Ejemplo: Cómo unir JSON y Handlebars paso a paso](#ejemplo-cómo-unir-json-y-handlebars-paso-a-paso)
      - [Principales elementos de una plantilla Handlebars](#principales-elementos-de-una-plantilla-handlebars)

## 1. Introducción
En informática, muchas veces necesitamos transformar documentos de un formato a otro para poder compartirlos, publicarlos en la web o adaptarlos a diferentes programas. Por ejemplo, convertir un archivo de texto a PDF para imprimirlo, o transformar datos de XML a HTML para mostrarlos en una página web.

## 2. ¿Dónde se usa la conversión de documentos?
- **Empresas:** Facturas electrónicas (de XML a PDF).
- **Clases:** Apuntes en Word que se pasan a PDF o HTML.
- **Web:** Publicar información en diferentes formatos (HTML, JSON, XML).

## 3. Tecnologías y herramientas básicas 

### Referencias XSLT (para XML)
- [W3Schools XSLT Tutorial](https://www.w3schools.com/xml/xsl_intro.asp)

### 3.1 ¿Qué es XSLT?
XSLT (eXtensible Stylesheet Language Transformations) es un lenguaje diseñado para transformar documentos XML en otros formatos, como HTML, texto plano o incluso otros XML. Es muy útil cuando queremos mostrar datos XML en una web o convertirlos a otro formato para compartirlos.

#### ¿Para qué se usa?
- Para mostrar datos XML como páginas web (HTML).
- Para convertir datos XML a otros formatos que necesite una aplicación.
- Para automatizar la generación de informes o listados a partir de datos estructurados.

#### ¿Cómo funciona?
XSLT utiliza "plantillas" (templates) que indican cómo debe transformarse cada parte del XML. El archivo XSLT se aplica sobre el XML y genera el resultado deseado. 

#### Ejemplo paso a paso:
- Tienes una lista de libros en XML y quieres verla como una lista en una página web (HTML).
1. Tienes este XML  denominado `libros.xml`(fíjate en la línea que relaciona el XML con el XSLT):

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <?xml-stylesheet type="text/xsl" href="libros.xsl"?>
  <libros>
    <libro>
      <titulo>1984</titulo>
      <autor>George Orwell</autor>
    </libro>
    <libro>
      <titulo>Fahrenheit 451</titulo>
      <autor>Ray Bradbury</autor>
    </libro>
  </libros>
  ```
2. Usas este XSLT denominado `libros.xsl` para convertirlo en una lista HTML:

  ```xml
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
  ```

3. El resultado es una página web con una lista de libros.

:pencil: Ejemplo libros.xsl y libros.xml

**¿Cómo puedes probarlo?**
1. Guarda el XML en un archivo llamado, por ejemplo, `libros.xml`.
2. Guarda el XSLT en un archivo llamado `libros.xsl` en la misma carpeta.
3. Abre el archivo `libros.xml` con un navegador web (por ejemplo, Chrome, Edge o Firefox).
4. Si todo está correcto, verás la lista de libros transformada según la plantilla XSLT.

>**Nota importante sobre navegadores:**
Algunos navegadores modernos pueden bloquear la transformación XSLT si abres el archivo XML directamente (por motivos de seguridad). Si no ves el resultado esperado, prueba a arrancar un pequeño servidor web local, por ejemplo `Live Server`.

>**Importante:**
- El nombre del archivo XSLT (`libros.xsl`) debe coincidir con el que aparece en la línea `<?xml-stylesheet ...?>` del XML.
- Ambos archivos deben estar en la misma carpeta para que el navegador los encuentre fácilmente.

#### Estructura básica de una plantilla XSLT
Una plantilla XSLT es un archivo XML especial que contiene las reglas para transformar un documento XML. Para que funcione correctamente, debe tener unas cabeceras y elementos básicos:

**Cabecera mínima de un archivo XSLT:**
```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Aquí van las plantillas y reglas de transformación -->
  <xsl:template match="/">
    <!-- Aquí va el contenido transformado -->
  </xsl:template>
</xsl:stylesheet>
```
**¿Cómo se relaciona el XSLT con el XML?**
Para que un XML use una hoja de estilos XSLT y se transforme automáticamente (por ejemplo, al abrirlo en un navegador), hay que añadir una línea especial al principio del archivo XML, justo después de la declaración `<?xml ...?>`:

```xml
<?xml-stylesheet type="text/xsl" href="nombre_hoja.xsl"?>
```
Donde `nombre_hoja.xsl` es el nombre del archivo XSLT que quieres aplicar. Así, el navegador o el procesador sabrá que debe transformar el XML usando esa hoja de estilos.


#### Principales elementos de XSLT:

- `<xsl:stylesheet>` o `<xsl:transform>`: Elemento raíz obligatorio. Define que el archivo es una hoja de estilos XSLT y su versión.
- `xmlns:xsl`: Especifica el espacio de nombres necesario para que el procesador reconozca las instrucciones XSLT.
- `<xsl:template>`: Define una plantilla, es decir, una regla para transformar una parte concreta del XML. El atributo `match` indica a qué parte del XML se aplica.El atributo `match="/"` asocia la plantilla con la raíz del documento fuente XML.
- `<xsl:value-of>`: Extrae y muestra el valor de un elemento o atributo del XML.Para indicar el elemento o atributo necesitamos hacer uso de su `atributo select`, donde con una `expresión XPath` le indicaremos la ruta hasta el elemento o atributo partiendo siempre del nodo seleccionado en el template.

```xml
<!-- Aquí va el contenido XML -->
<libro>
  <titulo>El Quijote</titulo>
  <autor>Miguel de Cervantes</autor>
</libro>
<!-- Aquí va el contenido XSLT -->
<xsl:template match="/libro">
  <p>Título: <xsl:value-of select="titulo"/></p>
  <p>Autor: <xsl:value-of select="autor"/></p>
  <!-- Aquí va utilizando expresión XPath --> 
  <p><xsl:value-of select="concat(titulo, ' - ', autor)"/></p> 
</xsl:template>
```

- `<xsl:for-each>`: Permite repetir una acción para cada elemento seleccionado (por ejemplo, para recorrer una lista de libros).
- `<xsl:if>`: Permite realizar una acción solo si se cumple una condición.

```xml
<!-- Aquí va el contenido XML -->
<libro>
  <titulo>El Quijote</titulo>
  <autor>Miguel de Cervantes</autor>
  <premio>Nobel</premio>
</libro>
<!-- Aquí va el contenido XSLT -->
<xsl:template match="/libro">
  <p>Título: <xsl:value-of select="titulo"/></p>
  <xsl:if test="premio">
    <p>Este libro ha recibido un premio.</p>
  </xsl:if>
</xsl:template>
```
En este ejemplo, la condición test="premio" es una expresión XPath que comprueba si existe el elemento <premio> dentro de <libro>. Si existe, se muestra el mensaje. 

- `<xsl:choose>`, `<xsl:when>`, `<xsl:otherwise>`: Estructura condicional similar a un "if-else".

* <xsl:choose> se usa para hacer estructuras condicionales (como un "if-else if-else").
* Dentro de <xsl:choose>, puedes poner varios <xsl:when test="condición"> para comprobar diferentes condiciones.
* Si ninguna condición de <xsl:when> se cumple, se ejecuta el bloque <xsl:otherwise> (opcional), que actúa como el "else" final.

```xml
<!-- Aquí va el contenido XML -->
<libro>
  <titulo>Ejemplo de libro</titulo>
  <precio>15</precio>
</libro>
<!-- Aquí va el contenido XSLT -->
<xsl:choose>
  <xsl:when test="precio &gt; 20">
    <p>Libro caro</p>
  </xsl:when>
  <xsl:when test="precio &gt; 10">
    <p>Libro de precio medio</p>
  </xsl:when>
  <xsl:otherwise>
    <p>Libro barato</p>
  </xsl:otherwise>
</xsl:choose>
```

- `<xsl:sort>`: Permite ordenar los nodos seleccionados antes de procesarlos. Es útil dentro de `<xsl:for-each>` o `<xsl:apply-templates>`.Para ordenar los nodos seleccionados antes de procesarlos. Permite especificar el criterio de ordenación (por ejemplo, por el valor de un elemento o atributo), el orden (ascendente o descendente) y el tipo de datos (texto o número).

```xml
<libros>
  <libro>
    <titulo>C</titulo>
  </libro>
  <libro>
    <titulo>A</titulo>
  </libro>
  <libro>
    <titulo>B</titulo>
  </libro>
</libros>
```

Y este fragmento XSLT para ordenarlos alfabéticamente por título:
```xml
<xsl:for-each select="libros/libro">
  <xsl:sort select="titulo" order="ascending"/>
  <p><xsl:value-of select="titulo"/></p>
</xsl:for-each>
```
Esto mostrará los títulos en orden: A, B, C.

- `<xsl:apply-templates>` es un elemento de XSLT que se utiliza para procesar de forma recursiva los nodos hijos del nodo actual, aplicando la plantilla (`<xsl:template>`) que mejor coincida con cada uno de ellos. Es fundamental para recorrer y transformar estructuras XML complejas, ya que permite separar la lógica de transformación en diferentes plantillas según el tipo de nodo.
*¿Para qué se usa?*
- Para recorrer automáticamente todos los elementos hijos de un nodo.
- Para aplicar reglas de transformación específicas a cada tipo de elemento.
- Para crear transformaciones modulares y fáciles de mantener.

Supón que tienes este XML:
```xml
<libros>
  <libro>
    <titulo>Ejemplo 1</titulo>
  </libro>
  <libro>
    <titulo>Ejemplo 2</titulo>
  </libro>
</libros>
```

Y este fragmento XSLT:
```xml
<xsl:template match="/libros">
  <ul>
    <xsl:apply-templates select="libro"/>
  </ul>
</xsl:template>

<xsl:template match="libro">
  <li><xsl:value-of select="titulo"/></li>
</xsl:template>
```
Esto generará una lista HTML con los títulos de los libros.

- `<xsl:output>`: Se utiliza para indicar **cómo** se generará el resultado de la transformación: tipo de documento (XML, HTML, texto plano), codificación, sangrado, etc. Suele colocarse al inicio del documento XSLT, como hijo directo de `<xsl:stylesheet>`.

Ejemplo básico:

```xml
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Indicamos que la salida será HTML, en UTF-8 y con sangrado -->
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Listado de libros</title>
      </head>
      <body>
        <h1>Libros</h1>
        <ul>
          <xsl:apply-templates select="libros/libro"/>
        </ul>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="libro">
    <li><xsl:value-of select="titulo"/></li>
  </xsl:template>

</xsl:stylesheet>
```

En este caso, `xsl:output` controla que el navegador reciba una página HTML bien formateada.


- `<xsl:element>`: Se utiliza para **crear elementos de forma dinámica** en la salida. Es útil cuando el nombre de la etiqueta que queremos generar depende de un valor del XML o de una condición.

Ejemplo sencillo:

```xml
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="campo">
    <!-- Crea una etiqueta cuyo nombre viene del atributo @nombre -->
    <xsl:element name="{ @nombre }">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
```

Si el XML tuviera este fragmento:

```xml
<campo nombre="titulo">El Quijote</campo>
```

La salida generada sería:

```xml
<titulo>El Quijote</titulo>
```

Es decir, `xsl:element` permite que el nombre de la etiqueta de salida sea variable.


- `<xsl:attribute>`: Se utiliza para **añadir atributos** a un elemento que se está generando en la salida. El nombre del atributo puede ser fijo o dinámico y su valor suele venir de datos del XML.

Ejemplo básico añadiendo un atributo fijo y otro dinámico:

```xml
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="libro">
    <div>
      <xsl:attribute name="class">destacado</xsl:attribute>
      <xsl:attribute name="codigo">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
      <xsl:value-of select="titulo"/>
    </div>
  </xsl:template>

</xsl:stylesheet>
```

Si el XML tuviera:

```xml
<libro id="L001">
  <titulo>El Quijote</titulo>
</libro>
```

La salida sería:

```html
<div class="destacado" codigo="L001">El Quijote</div>
```

Es decir, `xsl:attribute` permite construir atributos (y sus valores) a partir de la información del XML o de constantes.


- `<xsl:text>`: Se utiliza para **insertar texto literal** en la salida, respetando espacios, saltos de línea o caracteres especiales que a veces el procesador podría ignorar si se escriben directamente.

Ejemplo sencillo mezclando datos del XML con texto fijo:

```xml
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="libro">
    <p>
      <xsl:text>Título: </xsl:text>
      <xsl:value-of select="titulo"/>
      <xsl:text> - Autor: </xsl:text>
      <xsl:value-of select="autor"/>
    </p>
  </xsl:template>

</xsl:stylesheet>
```

Si el XML fuera:

```xml
<libro>
  <titulo>El Quijote</titulo>
  <autor>Cervantes</autor>
</libro>
```

La salida sería:

```html
<p>Título: El Quijote - Autor: Cervantes</p>
```

De esta forma, `xsl:text` garantiza que se conserven exactamente los espacios y el texto que queremos en la salida.

> Nota: `xsl:text` es especialmente útil cuando necesitamos conservar varios espacios seguidos, tabulaciones o saltos de línea. Si escribimos ese texto directamente en la plantilla sin `xsl:text`, el procesador XSLT podría “colapsar” los espacios y no aparecerían tal y como los hemos escrito.


#### Otras instrucciones útiles de XSLT 

| Instrucción           | Descripción breve                                                     | Uso típico                                      |
|-----------------------|-----------------------------------------------------------------------|-------------------------------------------------|
| `<xsl:variable>`      | Declara una variable con un valor calculado o literal.              | Guardar valores intermedios o expresiones XPath |
| `<xsl:param>`         | Declara un parámetro que se puede pasar desde fuera a la transformación. | Configurar opciones o filtros desde el exterior |
| `<xsl:call-template>` | Llama a otra plantilla por su nombre.                               | Reutilizar “bloques de código” tipo función     |
| `<xsl:copy>`          | Copia el nodo actual (sin hijos ni atributos opcionalmente).        | Clonar parte del XML manteniendo su estructura  |
| `<xsl:copy-of>`       | Copia un nodo o conjunto de nodos completo.                         | Duplicar secciones del XML tal cual            |
| `<xsl:comment>`       | Genera un comentario en la salida.                                  | Añadir comentarios al XML/HTML resultante       |


#### ¿Cómo se aplica un XSLT?

Puedes aplicar un XSLT a un XML de varias formas:

**1. Visual Studio Code (VS Code):**
- Abre tus archivos XML y XSLT en VS Code.
- Instala extensiones recomendadas:
  - **XML Tools**: para resaltar y validar XML.

  - **XSLT/XPath** (DeltaXML): para resaltar, validar y transformar XML con XSLT directamente desde el editor. Enlace directo: [XSLT/XPath - DeltaXML](https://marketplace.visualstudio.com/items?itemName=DeltaXML.xslt-xpath)
  

**2. Herramientas online:**
- [FreeFormatter XSLT Online](https://www.freeformatter.com/xsl-transformer.html): Permite cargar tu XML y XSLT y ver el resultado de la transformación.
- [Code Beautify XSLT Transform](https://codebeautify.org/xml-xsl-transformation): Similar, muy fácil de usar.

**3. Navegador web:**
- Si tu XML referencia el XSLT con la línea `<?xml-stylesheet type="text/xsl" href="archivo.xsl"?>`, puedes abrir el XML en un navegador (aunque algunos modernos pueden requerir un servidor local por seguridad), como hemos visto en el primer ejemplo.

**4. Programas específicos:**
- **Oxygen XML Editor:** Muy completo para trabajar profesionalmente con XML y XSLT.

:pencil: Actividad 1, Actividad 2, Actividad 3, Actividad 4, Actividad 5 

### 3.2 Transformación y validación de JSON 

Para trabajar con JSON y transformarlo a otros formatos como HTML, existen herramientas y lenguajes similares a XSLT en XML:

**1. JSONata**
- Es un lenguaje de consulta y transformación para datos JSON, parecido a XPath/XSLT pero para JSON.
- Permite seleccionar, filtrar y transformar datos JSON fácilmente.
- Puedes probarlo online en [https://jsonata.org/](https://jsonata.org/).

**Ejemplo práctico de JSONata**

Supón que tienes este JSON:
```json
{
  "libros": [
    {"titulo": "1984", "autor": "George Orwell"},
    {"titulo": "Fahrenheit 451", "autor": "Ray Bradbury"}
  ]
}
```
Si quieres obtener la lista de títulos, puedes usar la expresión JSONata:
```
libros.titulo
```

Esto selecciona todos los valores del campo "titulo" dentro del array "libros" y el resultado será:
```
["1984", "Fahrenheit 451"]
```

**¿Dónde y cómo se usa?**
- Puedes probarlo fácilmente en la web oficial [jsonata.org](https://jsonata.org/):
  1. Copia tu JSON en el área de datos.
  2. Escribe la expresión (por ejemplo, `libros.titulo`) en el área de consulta.
  3. Verás el resultado al instante.

**2. Motores de plantillas (Mustache, Handlebars, EJS)**
- Permiten generar HTML a partir de datos JSON usando plantillas.
- Muy usados en desarrollo web y Node.js.

#### Ejemplo: Cómo unir JSON y Handlebars paso a paso

Este ejemplo será una _plantilla embebida en el HTML_:
* Solo necesitas un archivo .html.
* La plantilla Handlebars va dentro de una etiqueta <script type="text/x-handlebars-template"> en el propio HTML.
* El código JavaScript toma esa plantilla y la une con el JSON para generar el HTML final.

1. **Incluye Handlebars en tu HTML** (puedes usar CDN):
```html
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.min.js"></script>
```

2. **Define la plantilla en tu HTML**:
```html
<script id="plantilla-libros" type="text/x-handlebars-template">
  <ul>
    {{#each libros}}
      <li>{{titulo}} - {{autor}}</li>
    {{/each}}
  </ul>
</script>
<div id="resultado"></div>
```

3. **Prepara los datos JSON y el código JavaScript**:
```html
<script>
  // Tus datos JSON
  var datos = {
    libros: [
      {titulo: "1984", autor: "George Orwell"},
      {titulo: "Fahrenheit 451", autor: "Ray Bradbury"}
    ]
  };

  // Obtén la plantilla del HTML
  var fuente = document.getElementById('plantilla-libros').innerHTML;
  // Compila la plantilla
  var plantilla = Handlebars.compile(fuente);
  // Genera el HTML pasando los datos JSON
  var html = plantilla(datos);
  // Inserta el HTML generado en la página
  document.getElementById('resultado').innerHTML = html;
</script>
```

**¿Qué ocurre aquí?**
- Handlebars toma la plantilla y reemplaza las variables por los valores del JSON.
- El resultado es una lista HTML generada dinámicamente.

:pencil: Ejemplo ejHandlebars.html

Si queremos que los datos JSON se carguen desde un archivo externo. En el JavaScript realizamos una solicitud `fetch` al archivo JSON y luego pasar los datos a Handlebars para renderizar la plantill.

Si suponemos que el archivo se denomina `datos.json`

```html
  <!-- Script para cargar JSON y renderizar -->
  <script>
    // Cargar el archivo JSON
    fetch('datos.json')
      .then(response => response.json())
      .then(data => {
        // Obtener la plantilla
        const source = document.getElementById('plantilla-libros').innerHTML;
        const template = Handlebars.compile(source);

        // Renderizar la plantilla con los datos
        const html = template(data);

        // Insertar el HTML generado en el DOM
        document.getElementById('contenido').innerHTML = html;
      })
      .catch(error => console.error('Error al cargar el JSON:', error));
  </script>
```
:pencil: Ejemplo ejHandlebars2.html

#### Principales elementos de una plantilla Handlebars

- `{{variable}}`: Inserta el valor de una variable del JSON.
- `{{#each array}} ... {{/each}}`: Recorre un array del JSON y repite el bloque para cada elemento.

```json
{
  "libros": [
    {"titulo": "1984", "autor": "George Orwell", "disponible": true},
    {"titulo": "Fahrenheit 451", "autor": "Ray Bradbury", "disponible": false}
  ]
}
```
```handlebars
<ul>
  {{#each libros}}
    <li>{{titulo}} - {{autor}}</li>
  {{/each}}
</ul>
```

- `{{#if condicion}} ... {{/if}}`: Muestra el bloque solo si se cumple la condición.

```handlebars
<ul>
  {{#each libros}}
    <li>
      {{titulo}} - {{autor}}
      {{#if disponible}}
        <span style="color:green">(Disponible)</span>
      {{else}}
        <span style="color:red">(No disponible)</span>
      {{/if}}
    </li>
  {{/each}}
</ul>
```

- `{{#unless condicion}} ... {{/unless}}`: Muestra el bloque solo si NO se cumple la condición.

```handlebars
<ul>
  {{#each libros}}
    <li>
      {{titulo}} - {{autor}}
      {{#unless disponible}}
        <span style="color:red">(No disponible)</span>
      {{/unless}}
    </li>
  {{/each}}
</ul>
```

- `{{this}}`: Referencia al elemento actual dentro de un bucle.

```json  
{
  "generos": ["Ciencia ficción", "Novela", "Ensayo"]
}
```
```handlebars
<ul>
  {{#each generos}}
    <li>{{this}}</li>
  {{/each}}
</ul>
```

- `{{> partial}}`: Inserta una plantilla parcial (útil en proyectos grandes).

Supón que quieres reutilizar una plantilla para mostrar cada libro.

1. Plantilla parcial (por ejemplo, en el HTML):

```html
<script id="parcial-libro" type="text/x-handlebars-template">
  <li>{{titulo}} - {{autor}}</li>
</script>
```
2. Plantilla principal:

```handlebars
<ul>
  {{#each libros}}
    {{> parcial-libro}}
  {{/each}}
</ul>
```

3. Registro y uso en JavaScript

```javascript
// Obtener el contenido de la plantilla parcial
var parcial = document.getElementById('parcial-libro').innerHTML;
// Registrar el partial
Handlebars.registerPartial('parcial-libro', parcial);

// Obtener la plantilla principal y compilarla como antes
var fuente = document.getElementById('plantilla-principal').innerHTML;
var plantilla = Handlebars.compile(fuente);
var html = plantilla(datos);
```

**3. Validación de JSON**
- Puedes validar JSON online en [JSONLint](https://jsonlint.com/) o con extensiones en Visual Studio Code.

Estas herramientas permiten transformar y adaptar datos JSON de forma similar a como XSLT lo hace con XML.


:pencil: Actividad6 y Actividad7