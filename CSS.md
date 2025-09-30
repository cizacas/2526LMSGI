## 5. Hojas de estilo (CSS)

### 5.1. ¿Qué es CSS?

**CSS (Cascading Style Sheets)** es un `lenguaje de hojas de estilo` que describe la presentación de documentos HTML. CSS separa el contenido (HTML) de la presentación (estilos).
* **No** es un lenguaje de marcado.
* Define la apariencia y el estilo visual
* Describe cómo se ve el contenido
* Utiliza `selectores y propiedades`
  * **selector**: es la parte que indica **a qué elementos HTML** se van a aplicar los estilos. Permite "seleccionar" o "apuntar" a elementos específicos del documento. 
  * **propiedad**: es la característica de estilo que queremos modificar (como el color, tamaño, margen, etc.), junto con su **valor**.
  
Sintasis básica:
```css
selector {
    propiedad: valor;
}
```
Ejemplo básico:
```css
p {
    color: blue; /* Propiedad: color, Valor: blue */
    font-size: 16px; /* Propiedad: font-size, Valor: 16px */
}
```

**Ventajas de CSS:**
- **Separación de responsabilidades**: Contenido y presentación independientes
- **Reutilización**: Un archivo CSS para múltiples páginas
- **Mantenimiento**: Cambios centralizados
- **Carga más rápida**: Estilos cacheables

### 5.2. Formas de aplicar CSS

#### **CSS Inline (En línea)**
```html
<p style="color: blue; font-size: 16px;">Texto con estilo inline</p>
```

#### **CSS Interno**
```html
<head>
    <style>
        p {
            color: blue;
            font-size: 16px;
        }
    </style>
</head>
```

#### **CSS Externo** (Recomendado)
```html
<head>
    <link rel="stylesheet" href="estilos.css">
</head>
```

```css
/* estilos.css */
p {
    color: blue;
    font-size: 16px;
}
```

### 5.3. Selectores CSS

#### **Selectores básicos**
En CSS existen 3 tipos básicos de selectores:
* De elemento.
* De clase.
* De identificador.

##### selector de elemento
* **Sintaxis**: Se escribe directamente con el nombre del elemento HTML
* **Especificidad**: Baja (valor 1)
* **Alcance**: Selecciona TODOS los elementos de ese tipo en el documento
* **Uso**: Para aplicar estilos generales a elementos específicos

```css
/* Selector de elemento */
/* Ejemplos de selectores de elemento */
h1 { color: blue; }     /* Todos los h1 */
p { margin: 10px; }     /* Todos los párrafos */
div { border: 1px solid black; }  /* Todos los div */
```

##### selector de clase
* **Sintaxis**: Se escribe con un punto (`.`) seguido del nombre de la clase
* **Especificidad**: Media (valor 10)
* **Alcance**: Selecciona todos los elementos que tengan esa clase asignada
* **Reutilizable**: Una clase puede aplicarse a múltiples elementos
* **Uso**: Para estilos que se repiten en varios elementos

```css
/* Selector de clase */
/* Ejemplos de selectores de clase */
.destacado { background-color: yellow; }
.centrado { text-align: center; }
.boton-principal { padding: 15px; }
```
##### selector de identificador (ID)
* **Sintaxis**: Se escribe con una almohadilla (`#`) seguida del nombre del ID
* **Especificidad**: Alta (valor 100)
* **Alcance**: Selecciona únicamente el elemento con ese ID específico
* **Único**: Cada ID debe ser único en todo el documento HTML
* **Uso**: Para elementos únicos que necesitan estilos específicos

```css
/* Selector de ID */
/* Ejemplos de selectores de ID */
#encabezado-principal { font-size: 32px; }
#menu-navegacion { position: fixed; }
#pie-pagina { background-color: #333; }
```

#### **Selector universal**
* **Sintaxis**: Se escribe con un asterisco (*)
* **Especificidad**: La más baja posible (valor 0)
* **Alcance**: Selecciona TODOS los elementos del documento HTML
* **Herencia**: Los estilos se aplican a todos los elementos sin excepción

```css
/* Selector universal */

* {
    margin: 0; /* Eliminar márgenes y padding por defecto */
    padding: 0;
    font-family: 'Arial', sans-serif;/* Fuente base para todo el documento */
}
```

#### **Selectores de atributo**

```css
/* Elemento con atributo */
input[required] {
    border: 2px solid red;
}

/* Atributo con valor específico */
input[type="email"] {
    background-color: lightblue;
}

/* Atributo que comienza con valor */
a[href^="https"] {
    color: green;
}

/* Atributo que termina con valor */
img[src$=".jpg"] {
    border: 1px solid gray;
}
```

#### **Selectores de combinación**

```css
/* Selector descendiente */
div p {
    color: blue;
}

/* Selector hijo directo */
ul > li {
    list-style: none;
}

/* Selector hermano adyacente */
h1 + p {
    font-weight: bold;
}

/* Selector hermanos generales */
h1 ~ p {
    margin-top: 10px;
}
```

#### **Pseudo-clases**

```css
/* Estados de enlace */
a:link { color: blue; }
a:visited { color: purple; }
a:hover { color: red; }
a:active { color: orange; }

/* Estados de formulario */
input:focus {
    outline: 2px solid blue;
}

input:valid {
    border-color: green;
}

input:invalid {
    border-color: red;
}

/* Pseudo-clases estructurales */
li:first-child {
    font-weight: bold;
}

li:last-child {
    margin-bottom: 0;
}

li:nth-child(odd) {
    background-color: #f0f0f0;
}

li:nth-child(3n) {
    color: red;
}
```

#### **Pseudo-elementos**

```css
/* Pseudo-elemento before */
.icono::before {
    content: "★";
    color: gold;
}

/* Pseudo-elemento after */
.enlace-externo::after {
    content: " ↗";
}

/* Primera letra */
p::first-letter {
    font-size: 2em;
    float: left;
}

/* Primera línea */
p::first-line {
    font-weight: bold;
}

/* Selección de texto */
::selection {
    background-color: yellow;
    color: black;
}
```

### 5.4. Propiedades principales

#### **Tipografía**

```css
.texto {
    /* Familia de fuente */
    font-family: "Helvetica Neue", Arial, sans-serif;
    
    /* Tamaño */
    font-size: 16px; /* px, em, rem, % */
    
    /* Peso */
    font-weight: bold; /* normal, bold, 100-900 */
    
    /* Estilo */
    font-style: italic; /* normal, italic, oblique */
    
    /* Altura de línea */
    line-height: 1.5; /* número, px, % */
    
    /* Espaciado entre letras */
    letter-spacing: 2px;
    
    /* Espaciado entre palabras */
    word-spacing: 5px;
    
    /* Transformación de texto */
    text-transform: uppercase; /* lowercase, capitalize */
    
    /* Decoración */
    text-decoration: underline; /* none, overline, line-through */
    
    /* Alineación */
    text-align: center; /* left, right, justify */
    
    /* Indentación */
    text-indent: 20px;
}
```

#### **Colores y fondos**

```css
.colores {
    /* Color de texto */
    color: #333333; /* hexadecimal */
    color: rgb(51, 51, 51); /* RGB */
    color: rgba(51, 51, 51, 0.8); /* RGBA con transparencia */
    color: hsl(0, 0%, 20%); /* HSL */
    color: hsla(0, 0%, 20%, 0.8); /* HSLA */
    
    /* Color de fondo */
    background-color: lightblue;
    
    /* Imagen de fondo */
    background-image: url('imagen.jpg');
    background-repeat: no-repeat; /* repeat, repeat-x, repeat-y */
    background-position: center center; /* left, right, top, bottom */
    background-size: cover; /* contain, auto, px, % */
    background-attachment: fixed; /* scroll, local */
    
    /* Abreviación */
    background: lightblue url('imagen.jpg') no-repeat center center / cover;
}
```

#### **Espaciado**

```css
.espaciado {
    /* Margen exterior */
    margin: 20px; /* todos los lados */
    margin: 10px 20px; /* vertical horizontal */
    margin: 10px 15px 20px 25px; /* arriba derecha abajo izquierda */
    margin-top: 10px;
    margin-right: 15px;
    margin-bottom: 20px;
    margin-left: 25px;
    
    /* Relleno interior */
    padding: 15px;
    padding: 10px 20px;
    padding: 5px 10px 15px 20px;
    padding-top: 5px;
    padding-right: 10px;
    padding-bottom: 15px;
    padding-left: 20px;
}
```

### 5.5. Modelo de caja (Box Model)

Todos los elementos HTML se representan como cajas rectangulares:

```css
.caja {
    /* Contenido */
    width: 200px;
    height: 150px;
    
    /* Relleno */
    padding: 20px;
    
    /* Borde */
    border: 2px solid black;
    border-width: 2px;
    border-style: solid; /* dotted, dashed, double */
    border-color: black;
    border-radius: 10px; /* esquinas redondeadas */
    
    /* Margen */
    margin: 15px;
    
    /* Control del modelo de caja */
    box-sizing: border-box; /* content-box (default) */
}
```

**Cálculo de dimensiones:**
- `content-box`: width/height = solo contenido
- `border-box`: width/height = contenido + padding + border

### 5.6. Flexbox y Grid

#### **Flexbox (Diseño flexible)**

```css
.contenedor-flex {
    display: flex;
    
    /* Dirección principal */
    flex-direction: row; /* column, row-reverse, column-reverse */
    
    /* Justificación en eje principal */
    justify-content: space-between; /* flex-start, flex-end, center, space-around, space-evenly */
    
    /* Alineación en eje transversal */
    align-items: center; /* flex-start, flex-end, stretch, baseline */
    
    /* Permitir salto de línea */
    flex-wrap: wrap; /* nowrap, wrap-reverse */
    
    /* Espacio entre elementos */
    gap: 20px;
}

.elemento-flex {
    /* Factor de crecimiento */
    flex-grow: 1;
    
    /* Factor de reducción */
    flex-shrink: 1;
    
    /* Base inicial */
    flex-basis: 200px;
    
    /* Abreviación */
    flex: 1 1 200px; /* grow shrink basis */
    
    /* Alineación individual */
    align-self: flex-end;
}
```

#### **Grid (Rejilla)**

```css
.contenedor-grid {
    display: grid;
    
    /* Definir columnas */
    grid-template-columns: 1fr 2fr 1fr; /* fracciones */
    grid-template-columns: repeat(3, 1fr); /* repetir */
    grid-template-columns: 200px auto 150px; /* tamaños fijos y automático */
    
    /* Definir filas */
    grid-template-rows: 100px auto 50px;
    
    /* Espacio entre celdas */
    gap: 20px; /* row-gap, column-gap */
    
    /* Areas nombradas */
    grid-template-areas: 
        "header header header"
        "sidebar main main"
        "footer footer footer";
}

.elemento-grid {
    /* Posicionamiento por líneas */
    grid-column: 1 / 3; /* desde línea 1 a 3 */
    grid-row: 2 / 4;
    
    /* Posicionamiento por span */
    grid-column: span 2; /* ocupa 2 columnas */
    grid-row: span 1;
    
    /* Posicionamiento por área */
    grid-area: header;
}
```

---

## 6. Validación de documentos HTML y CSS

### 6.1. ¿Por qué validar?

La **validación** es el proceso de verificar que el código HTML y CSS cumple con los estándares web establecidos por el W3C.

**Beneficios de la validación:**
- **Compatibilidad**: Funcionamiento consistente entre navegadores
- **Accesibilidad**: Mejor soporte para tecnologías asistivas
- **SEO**: Los motores de búsqueda prefieren código válido
- **Mantenimiento**: Código más fácil de mantener y depurar
- **Rendimiento**: Código válido suele ser más eficiente

### 6.2. Validador HTML del W3C

#### **Acceso al validador**
- **URL**: https://validator.w3.org/
- **Métodos de validación**:
  - Por URL
  - Subida de archivo
  - Entrada directa de código

#### **Tipos de errores comunes**

```html
<!-- ❌ Error: Etiqueta no cerrada -->
<p>Párrafo sin cerrar

<!-- ✅ Correcto -->
<p>Párrafo correctamente cerrado</p>

<!-- ❌ Error: Atributo sin valor -->
<input type="text" required>

<!-- ✅ Correcto en HTML5 -->
<input type="text" required>

<!-- ✅ Correcto en XHTML -->
<input type="text" required="required" />

<!-- ❌ Error: Elementos anidados incorrectamente -->
<p><div>Contenido</div></p>

<!-- ✅ Correcto -->
<div><p>Contenido</p></div>

<!-- ❌ Error: Atributos duplicados -->
<img src="imagen.jpg" alt="Descripción" alt="Otra descripción">

<!-- ✅ Correcto -->
<img src="imagen.jpg" alt="Descripción">
```

#### **Advertencias vs Errores**
- **Errores**: Violaciones de las especificaciones HTML
- **Advertencias**: Prácticas no recomendadas pero técnicamente válidas

### 6.3. Validador CSS del W3C

#### **Acceso al validador**
- **URL**: https://jigsaw.w3.org/css-validator/
- **Métodos**: URL, archivo, entrada directa

#### **Errores CSS comunes**

```css
/* ❌ Error: Propiedad inexistente */
.elemento {
    colour: red; /* Debería ser 'color' */
}

/* ❌ Error: Valor inválido */
.elemento {
    margin: 10; /* Falta unidad */
}

/* ✅ Correcto */
.elemento {
    color: red;
    margin: 10px;
}

/* ❌ Error: Selector inválido */
.elemento > > p {
    color: blue;
}

/* ✅ Correcto */
.elemento > p {
    color: blue;
}

/* ❌ Error: Falta punto y coma */
.elemento {
    color: red
    margin: 10px;
}

/* ✅ Correcto */
.elemento {
    color: red;
    margin: 10px;
}
```

### 6.4. Herramientas de validación automática

#### **Extensiones de VS Code**
```json
// settings.json
{
    "html.validate.scripts": true,
    "html.validate.styles": true,
    "css.validate": true,
    "css.lint.emptyRules": "warning"
}
```

#### **Linters en línea de comandos**

```bash
# HTMLHint
npm install -g htmlhint
htmlhint index.html

# stylelint para CSS
npm install -g stylelint
stylelint styles.css
```

#### **Herramientas de construcción**

```javascript
// Webpack con html-webpack-plugin
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    plugins: [
        new HtmlWebpackPlugin({
            template: './src/index.html',
            minify: {
                removeComments: true,
                collapseWhitespace: true,
                removeRedundantAttributes: true,
                useShortDoctype: true,
                removeEmptyAttributes: true,
                removeStyleLinkTypeAttributes: true,
                keepClosingSlash: true,
                minifyJS: true,
                minifyCSS: true,
                minifyURLs: true,
            }
        })
    ]
};
```

---

## 7. Lenguajes de marcas para la sindicación de contenidos

### 7.1. ¿Qué es la sindicación de contenidos?

La **sindicación de contenidos** es el proceso de distribuir contenido web de forma automatizada, permitiendo que otros sitios web o aplicaciones consuman y muestren el contenido actualizado sin intervención manual.

**Casos de uso:**
- **Blogs**: Distribución de nuevos artículos
- **Noticias**: Actualización automática de titulares
- **Podcasts**: Distribución de episodios
- **E-commerce**: Actualizaciones de productos
- **Redes sociales**: Agregación de contenido

### 7.2. RSS (Really Simple Syndication)

RSS es uno de los formatos más populares para la sindicación de contenidos web.

#### **Estructura básica de RSS**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
    <channel>
        <!-- Información del canal -->
        <title>Blog de Tecnología</title>
        <description>Las últimas noticias sobre tecnología y programación</description>
        <link>https://www.ejemplo.com</link>
        <language>es-ES</language>
        <pubDate>Wed, 26 Sep 2025 10:00:00 GMT</pubDate>
        <lastBuildDate>Wed, 26 Sep 2025 10:00:00 GMT</lastBuildDate>
        <generator>Sistema de gestión de contenidos</generator>
        <managingEditor>editor@ejemplo.com (Editor Principal)</managingEditor>
        <webMaster>webmaster@ejemplo.com (Webmaster)</webMaster>
        
        <!-- Elementos del feed -->
        <item>
            <title>Introducción a HTML5</title>
            <description>Una guía completa sobre las nuevas características de HTML5</description>
            <link>https://www.ejemplo.com/html5-introduccion</link>
            <guid>https://www.ejemplo.com/html5-introduccion</guid>
            <pubDate>Wed, 26 Sep 2025 09:00:00 GMT</pubDate>
            <author>autor@ejemplo.com (Juan Pérez)</author>
            <category>Desarrollo Web</category>
        </item>
        
        <item>
            <title>CSS Grid vs Flexbox</title>
            <description><![CDATA[
                <p>Comparación detallada entre CSS Grid y Flexbox.</p>
                <p>Incluye ejemplos prácticos y casos de uso.</p>
            ]]></description>
            <link>https://www.ejemplo.com/css-grid-flexbox</link>
            <guid>https://www.ejemplo.com/css-grid-flexbox</guid>
            <pubDate>Tue, 25 Sep 2025 14:30:00 GMT</pubDate>
            <author>autor@ejemplo.com (María García)</author>
            <category>CSS</category>
            <enclosure url="https://www.ejemplo.com/video.mp4" 
                      length="15360" 
                      type="video/mp4"/>
        </item>
    </channel>
</rss>
```

#### **Elementos principales de RSS**

| Elemento | Descripción | Requerido |
|----------|-------------|-----------|
| `<title>` | Nombre del canal o artículo | Sí |
| `<description>` | Descripción del canal o artículo | Sí |
| `<link>` | URL del sitio web o artículo | Sí |
| `<pubDate>` | Fecha de publicación | No |
| `<author>` | Autor del contenido | No |
| `<category>` | Categoría del contenido | No |
| `<guid>` | Identificador único | No |
| `<enclosure>` | Archivo multimedia adjunto | No |

### 7.3. Atom

Atom es un formato más reciente y completo que RSS, basado en estándares web modernos.

#### **Estructura básica de Atom**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
    <!-- Información del feed -->
    <title>Blog de Tecnología</title>
    <subtitle>Las últimas noticias sobre tecnología y programación</subtitle>
    <link href="https://www.ejemplo.com"/>
    <link href="https://www.ejemplo.com/feed.atom" rel="self"/>
    <id>https://www.ejemplo.com</id>
    <updated>2025-09-26T10:00:00Z</updated>
    <rights>Copyright © 2025, Blog de Tecnología</rights>
    
    <author>
        <name>Equipo Editorial</name>
        <email>editor@ejemplo.com</email>
        <uri>https://www.ejemplo.com/about</uri>
    </author>
    
    <!-- Entradas del feed -->
    <entry>
        <title>Introducción a HTML5</title>
        <id>https://www.ejemplo.com/html5-introduccion</id>
        <link href="https://www.ejemplo.com/html5-introduccion"/>
        <updated>2025-09-26T09:00:00Z</updated>
        <published>2025-09-26T09:00:00Z</published>
        
        <author>
            <name>Juan Pérez</name>
            <email>juan@ejemplo.com</email>
        </author>
        
        <category term="Desarrollo Web" scheme="https://www.ejemplo.com/categorias"/>
        
        <summary>Una guía completa sobre las nuevas características de HTML5</summary>
        
        <content type="html"><![CDATA[
            <h2>Introducción</h2>
            <p>HTML5 introduce muchas nuevas características...</p>
            <h2>Nuevos elementos</h2>
            <p>Los elementos semánticos como &lt;section&gt; y &lt;article&gt;...</p>
        ]]></content>
    </entry>
    
    <entry>
        <title>CSS Grid vs Flexbox</title>
        <id>https://www.ejemplo.com/css-grid-flexbox</id>
        <link href="https://www.ejemplo.com/css-grid-flexbox"/>
        <updated>2025-09-25T14:30:00Z</updated>
        <published>2025-09-25T14:30:00Z</published>
        
        <author>
            <name>María García</name>
            <email>maria@ejemplo.com</email>
        </author>
        
        <category term="CSS"/>
        
        <summary>Comparación detallada entre CSS Grid y Flexbox</summary>
        
        <content type="html" src="https://www.ejemplo.com/css-grid-flexbox"/>
        
        <link rel="enclosure" 
              href="https://www.ejemplo.com/video.mp4" 
              type="video/mp4" 
              length="15360"/>
    </entry>
</feed>
```

#### **Ventajas de Atom sobre RSS**

1. **Namespaces XML**: Mejor extensibilidad
2. **Tipos MIME**: Soporte explícito para diferentes tipos de contenido
3. **Metadatos ricos**: Más información sobre autores y contenido
4. **Internacionalización**: Mejor soporte para múltiples idiomas
5. **Validación**: Esquema XML más estricto

### 7.4. JSON Feed

JSON Feed es un formato moderno basado en JSON, más simple para desarrolladores web.

#### **Estructura de JSON Feed**

```json
{
    "version": "https://jsonfeed.org/version/1.1",
    "title": "Blog de Tecnología",
    "description": "Las últimas noticias sobre tecnología y programación",
    "home_page_url": "https://www.ejemplo.com",
    "feed_url": "https://www.ejemplo.com/feed.json",
    "icon": "https://www.ejemplo.com/icon.png",
    "favicon": "https://www.ejemplo.com/favicon.ico",
    "language": "es",
    
    "authors": [
        {
            "name": "Equipo Editorial",
            "url": "https://www.ejemplo.com/about",
            "avatar": "https://www.ejemplo.com/avatar.png"
        }
    ],
    
    "items": [
        {
            "id": "https://www.ejemplo.com/html5-introduccion",
            "title": "Introducción a HTML5",
            "summary": "Una guía completa sobre las nuevas características de HTML5",
            "content_html": "<h2>Introducción</h2><p>HTML5 introduce muchas nuevas características...</p>",
            "content_text": "HTML5 introduce muchas nuevas características que mejoran la experiencia de desarrollo...",
            "url": "https://www.ejemplo.com/html5-introduccion",
            "external_url": "https://www.ejemplo.com/html5-introduccion",
            "date_published": "2025-09-26T09:00:00Z",
            "date_modified": "2025-09-26T09:00:00Z",
            
            "authors": [
                {
                    "name": "Juan Pérez",
                    "url": "https://www.ejemplo.com/autor/juan"
                }
            ],
            
            "tags": ["HTML5", "Desarrollo Web", "Frontend"],
            
            "attachments": [
                {
                    "url": "https://www.ejemplo.com/video.mp4",
                    "mime_type": "video/mp4",
                    "size_in_bytes": 15360,
                    "title": "Video tutorial HTML5"
                }
            ]
        },
        
        {
            "id": "https://www.ejemplo.com/css-grid-flexbox",
            "title": "CSS Grid vs Flexbox",
            "summary": "Comparación detallada entre CSS Grid y Flexbox",
            "content_html": "<h2>Comparación</h2><p>CSS Grid y Flexbox son dos sistemas de layout...</p>",
            "url": "https://www.ejemplo.com/css-grid-flexbox",
            "date_published": "2025-09-25T14:30:00Z",
            "date_modified": "2025-09-25T14:30:00Z",
            
            "authors": [
                {
                    "name": "María García",
                    "url": "https://www.ejemplo.com/autor/maria"
                }
            ],
            
            "tags": ["CSS", "Grid", "Flexbox", "Layout"]
        }
    ]
}
```

### 7.5. Comparación de formatos

| Característica | RSS 2.0 | Atom 1.0 | JSON Feed |
|----------------|---------|----------|-----------|
| **Formato base** | XML | XML | JSON |
| **Complejidad** | Simple | Compleja | Muy simple |
| **Extensibilidad** | Limitada | Excelente | Buena |
| **Soporte navegadores** | Universal | Universal | Limitado |
| **Validación** | Básica | Estricta | Schema JSON |
| **Internacionalización** | Básica | Excelente | Buena |
| **Metadatos** | Básicos | Ricos | Modernos |
| **Popularidad** | Alta | Media | Creciente |

#### **Cuándo usar cada formato**

**Usar RSS cuando:**
- Necesitas máxima compatibilidad
- El contenido es simple (blog básico)
- Los lectores de feeds existentes son prioritarios

**Usar Atom cuando:**
- Necesitas metadatos ricos
- Manejas múltiples idiomas
- Quieres extensibilidad avanzada

**Usar JSON Feed cuando:**
- Desarrollas aplicaciones modernas
- Priorizas la simplicidad
- Trabajas principalmente con JavaScript

#### **Implementación práctica**

```html
<!-- Enlace a feeds en HTML -->
<head>
    <link rel="alternate" type="application/rss+xml" 
          title="RSS Feed" href="/feed.rss">
    <link rel="alternate" type="application/atom+xml" 
          title="Atom Feed" href="/feed.atom">
    <link rel="alternate" type="application/json" 
          title="JSON Feed" href="/feed.json">
</head>
```

```javascript
// Consumir JSON Feed con JavaScript
fetch('/feed.json')
    .then(response => response.json())
    .then(feed => {
        console.log(`Feed: ${feed.title}`);
        feed.items.forEach(item => {
            console.log(`- ${item.title}: ${item.url}`);
        });
    })
    .catch(error => console.error('Error:', error));
```

---

## 8. Ejercicios prácticos

### **Ejercicio 1: Estructura HTML completa**

Crea una página web completa que incluya:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Página de ejemplo para práctica HTML">
    <title>Mi Primera Página Web</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <header>
        <h1>Mi Blog Personal</h1>
        <nav>
            <ul>
                <li><a href="#inicio">Inicio</a></li>
                <li><a href="#articulos">Artículos</a></li>
                <li><a href="#contacto">Contacto</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="inicio">
            <h2>Bienvenido</h2>
            <p>Este es mi blog personal donde comparto mis experiencias...</p>
        </section>

        <section id="articulos">
            <h2>Últimos Artículos</h2>
            <article>
                <h3>Mi primer artículo</h3>
                <p>Contenido del artículo...</p>
                <time datetime="2025-09-26">26 de septiembre de 2025</time>
            </article>
        </section>
    </main>

    <aside>
        <h3>Sobre mí</h3>
        <p>Información personal...</p>
    </aside>

    <footer>
        <p>&copy; 2025 Mi Blog Personal</p>
    </footer>
</body>
</html>
```

### **Ejercicio 2: Formulario completo con validación**

```html
<form action="/procesar-formulario" method="post">
    <fieldset>
        <legend>Información Personal</legend>
        
        <div>
            <label for="nombre">Nombre completo *</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>
        
        <div>
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" required>
        </div>
        
        <div>
            <label for="telefono">Teléfono</label>
            <input type="tel" id="telefono" name="telefono" pattern="[0-9]{9}">
        </div>
        
        <div>
            <label for="fecha-nacimiento">Fecha de nacimiento</label>
            <input type="date" id="fecha-nacimiento" name="fecha-nacimiento">
        </div>
    </fieldset>
    
    <fieldset>
        <legend>Preferencias</legend>
        
        <div>
            <label for="pais">País</label>
            <select id="pais" name="pais">
                <option value="">Selecciona un país</option>
                <option value="es">España</option>
                <option value="fr">Francia</option>
                <option value="it">Italia</option>
            </select>
        </div>
        
        <div>
            <p>Intereses:</p>
            <input type="checkbox" id="tecnologia" name="intereses" value="tecnologia">
            <label for="tecnologia">Tecnología</label>
            
            <input type="checkbox" id="deportes" name="intereses" value="deportes">
            <label for="deportes">Deportes</label>
            
            <input type="checkbox" id="arte" name="intereses" value="arte">
            <label for="arte">Arte</label>
        </div>
    </fieldset>
    
    <button type="submit">Enviar</button>
    <button type="reset">Limpiar</button>
</form>
```

### **Ejercicio 3: CSS con Flexbox y Grid**

```css
/* Estilos generales */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
    color: #333;
}

/* Layout principal con Grid */
.contenedor-principal {
    display: grid;
    grid-template-areas: 
        "header header"
        "nav nav"
        "main aside"
        "footer footer";
    grid-template-columns: 3fr 1fr;
    grid-template-rows: auto auto 1fr auto;
    min-height: 100vh;
    gap: 20px;
    padding: 20px;
}

header {
    grid-area: header;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 2rem;
    text-align: center;
    border-radius: 10px;
}

nav {
    grid-area: nav;
}

nav ul {
    display: flex;
    justify-content: center;
    list-style: none;
    gap: 2rem;
    background: #f4f4f4;
    padding: 1rem;
    border-radius: 5px;
}

nav a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
    padding: 0.5rem 1rem;
    border-radius: 3px;
    transition: background-color 0.3s;
}

nav a:hover {
    background-color: #667eea;
    color: white;
}

main {
    grid-area: main;
    background: white;
    padding: 2rem;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

aside {
    grid-area: aside;
    background: #f9f9f9;
    padding: 1.5rem;
    border-radius: 5px;
    height: fit-content;
}

footer {
    grid-area: footer;
    background: #333;
    color: white;
    text-align: center;
    padding: 1rem;
    border-radius: 5px;
}

/* Componentes responsivos */
@media (max-width: 768px) {
    .contenedor-principal {
        grid-template-areas: 
            "header"
            "nav"
            "main"
            "aside"
            "footer";
        grid-template-columns: 1fr;
    }
    
    nav ul {
        flex-direction: column;
        gap: 0.5rem;
    }
}
```

### **Ejercicio 4: Feed RSS**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
    <channel>
        <title>Mi Blog de Desarrollo Web</title>
        <description>Artículos sobre HTML, CSS y JavaScript</description>
        <link>https://miblog.com</link>
        <language>es-ES</language>
        <pubDate>Wed, 26 Sep 2025 12:00:00 GMT</pubDate>
        <lastBuildDate>Wed, 26 Sep 2025 12:00:00 GMT</lastBuildDate>
        
        <item>
            <title>Guía completa de CSS Grid</title>
            <description>Aprende a usar CSS Grid para crear layouts complejos</description>
            <link>https://miblog.com/css-grid-guia</link>
            <guid>https://miblog.com/css-grid-guia</guid>
            <pubDate>Wed, 26 Sep 2025 10:00:00 GMT</pubDate>
            <category>CSS</category>
        </item>
        
        <item>
            <title>JavaScript ES2025: Nuevas características</title>
            <description>Descubre las últimas funcionalidades de JavaScript</description>
            <link>https://miblog.com/javascript-es2025</link>
            <guid>https://miblog.com/javascript-es2025</guid>
            <pubDate>Tue, 25 Sep 2025 15:30:00 GMT</pubDate>
            <category>JavaScript</category>
        </item>
    </channel>
</rss>
```

---

## 9. Referencias

### **Documentación oficial**
- [MDN Web Docs](https://developer.mozilla.org/) - Referencia completa de tecnologías web
- [W3C Standards](https://www.w3.org/standards/) - Especificaciones oficiales
- [HTML Living Standard](https://html.spec.whatwg.org/) - Especificación actual de HTML
- [CSS Specifications](https://www.w3.org/Style/CSS/specs.en.html) - Especificaciones de CSS

### **Herramientas de validación**
- [W3C HTML Validator](https://validator.w3.org/) - Validador oficial de HTML
- [W3C CSS Validator](https://jigsaw.w3.org/css-validator/) - Validador oficial de CSS
- [WAVE Web Accessibility Evaluator](https://wave.webaim.org/) - Evaluador de accesibilidad

### **Recursos de aprendizaje**
- [Can I Use](https://caniuse.com/) - Compatibilidad de características web
- [CSS-Tricks](https://css-tricks.com/) - Guías y trucos de CSS
- [A List Apart](https://alistapart.com/) - Artículos sobre diseño web

### **Herramientas de desarrollo**
- [Visual Studio Code](https://code.visualstudio.com/) - Editor de código
- [Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools) - Herramientas de desarrollo
- [Firefox Developer Tools](https://developer.mozilla.org/en-US/docs/Tools) - Herramientas de Firefox

### **Frameworks y librerías**
- [Bootstrap](https://getbootstrap.com/) - Framework CSS
- [Tailwind CSS](https://tailwindcss.com/) - Framework utility-first
- [Bulma](https://bulma.io/) - Framework CSS moderno

### **Sindicación de contenidos**
- [RSS 2.0 Specification](https://www.rssboard.org/rss-specification) - Especificación RSS
- [Atom Specification](https://tools.ietf.org/html/rfc4287) - Especificación Atom
- [JSON Feed](https://jsonfeed.org/) - Especificación JSON Feed
