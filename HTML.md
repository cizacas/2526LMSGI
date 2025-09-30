# Utilización de lenguajes de marcas en entornos web

- [Utilización de lenguajes de marcas en entornos web](#utilización-de-lenguajes-de-marcas-en-entornos-web)
  - [1. Estándares web. Versiones. Clasificación](#1-estándares-web-versiones-clasificación)
    - [1.1. ¿Qué son los estándares web?](#11-qué-son-los-estándares-web)
    - [1.2. World Wide Web Consortium (W3C)](#12-world-wide-web-consortium-w3c)
    - [1.3. Clasificación de estándares web](#13-clasificación-de-estándares-web)
      - [**Estructura y contenido**](#estructura-y-contenido)
      - [**Presentación**](#presentación)
      - [**Comportamiento**](#comportamiento)
      - [**Accesibilidad**](#accesibilidad)
    - [1.4. Versiones de HTML](#14-versiones-de-html)
    - [1.5. Versiones de CSS](#15-versiones-de-css)
  - [2. Estructura de un documento HTML](#2-estructura-de-un-documento-html)
    - [2.1. Estructura básica](#21-estructura-básica)
    - [2.2. DOCTYPE - ENCABEZADO](#22-doctype---encabezado)
    - [2.3. Elemento HTML](#23-elemento-html)
    - [2.4. Elemento HEAD](#24-elemento-head)
    - [2.5. Elemento BODY](#25-elemento-body)
  - [3. Identificación de etiquetas y atributos de HTML](#3-identificación-de-etiquetas-y-atributos-de-html)
    - [3.1. Etiquetas básicas de estructura](#31-etiquetas-básicas-de-estructura)
      - [**Elementos semánticos HTML5**](#elementos-semánticos-html5)
      - [**Elementos de agrupación**](#elementos-de-agrupación)
    - [3.2. Etiquetas de contenido textual](#32-etiquetas-de-contenido-textual)
      - [**Encabezados**](#encabezados)
      - [**Formato de texto**](#formato-de-texto)
      - [**Listas**](#listas)
    - [3.3. Etiquetas para multimedia](#33-etiquetas-para-multimedia)
      - [**Imágenes**](#imágenes)
      - [**Audio y video**](#audio-y-video)
      - [**Enlaces**](#enlaces)
    - [3.4. Etiquetas para formularios](#34-etiquetas-para-formularios)
    - [3.5. Atributos globales](#35-atributos-globales)
    - [3.6. Atributos específicos](#36-atributos-específicos)
      - [**Atributos de formularios**](#atributos-de-formularios)
      - [**Atributos de multimedia**](#atributos-de-multimedia)
      - [**Atributos de enlaces**](#atributos-de-enlaces)
  - [4. Herramientas de diseño web](#4-herramientas-de-diseño-web)
    - [4.1. Editores de código](#41-editores-de-código)
      - [**Visual Studio Code**](#visual-studio-code)
      - [**Sublime Text**](#sublime-text)
    - [4.2. Navegadores y herramientas de desarrollo](#42-navegadores-y-herramientas-de-desarrollo)
      - [**Chrome DevTools**](#chrome-devtools)
      - [**Firefox Developer Tools**](#firefox-developer-tools)
      - [**Safari Web Inspector**](#safari-web-inspector)
    - [4.3. Frameworks y librerías](#43-frameworks-y-librerías)
      - [**CSS Frameworks**](#css-frameworks)
      - [**JavaScript Frameworks**](#javascript-frameworks)
    - [4.4. Herramientas de diseño visual](#44-herramientas-de-diseño-visual)
      - [**Figma**](#figma)
      - [**Adobe XD**](#adobe-xd)
      - [**Sketch** (Solo macOS)](#sketch-solo-macos)

---

## 1. Estándares web. Versiones. Clasificación

### 1.1. ¿Qué son los estándares web?

Los **estándares web** son un conjunto de especificaciones técnicas y recomendaciones que definen cómo debe funcionar `la World Wide Web`. Estos estándares aseguran que las páginas web funcionen de manera consistente en `diferentes navegadores` y `dispositivos`.

**Objetivos principales:**
- **Interoperabilidad**: Las páginas web funcionan igual en todos los navegadores
- **Accesibilidad**: Contenido accesible para personas con discapacidades
- **Mantenibilidad**: Código más fácil de mantener y actualizar
- **Futuro-compatibilidad**: Preparación para futuras tecnologías

### 1.2. World Wide Web Consortium (W3C)

El **W3C** es la organización internacional que desarrolla los estándares web. Fundada en 1994 por Tim Berners-Lee, es responsable de:

- Especificaciones de HTML
- Especificaciones de CSS
- Estándares de accesibilidad [WCAG](https://guia-wcag.com/es/)
- Protocolos web
- APIs web

### 1.3. Clasificación de estándares web

Los estándares web se clasifican en diferentes categorías:

#### **Estructura y contenido**
- **HTML**: HyperText Markup Language - Lenguaje de marcado para estructura
- **XML**: Lenguaje extensible de marcado

#### **Presentación**
- **CSS**: Hojas de estilo en cascada
- **SVG**: Gráficos vectoriales escalables

#### **Comportamiento**
- **JavaScript**: Lenguaje de programación
- **DOM**: Modelo de objetos del documento
- **APIs web**: Interfaces de programación

#### **Accesibilidad**
- **WCAG**: Pautas de accesibilidad
- **ARIA**: Aplicaciones ricas accesibles

### 1.4. Versiones de HTML

| Versión | Año | Características principales |
|---------|-----|---------------------------|
| HTML 1.0 | 1993 | Primera versión básica |
| HTML 2.0 | 1995 | Formularios, tablas básicas |
| HTML 3.2 | 1997 | Tablas mejoradas, applets |
| HTML 4.0 | 1997 | CSS, JavaScript, internacionalización |
| HTML 4.01 | 1999 | Corrección de errores de 4.0 |
| XHTML 1.0 | 2000 | HTML reformulado como XML |
| HTML5 | 2014 | Elementos semánticos, multimedia, APIs |
| HTML 5.1 | 2016 | Nuevos elementos y atributos |
| HTML 5.2 | 2017 | Mejoras en formularios y elementos |

### 1.5. Versiones de CSS

| Versión | Año | Características principales |
|---------|-----|---------------------------|
| CSS 1 | 1996 | Propiedades básicas de estilo |
| CSS 2 | 1998 | Posicionamiento, medios |
| CSS 2.1 | 2004 | Correcciones y clarificaciones |
| CSS 3 | 2012+ | Módulos independientes, animaciones |
| CSS 4 | En desarrollo | Selectores avanzados, variables |

---

## 2. Estructura de un documento HTML
El **HTML** es un lenguaje de marcas por lo que debe cumplir con las mismas restricciones que hemos visto en **XML**, la principal diferencia con XML es que en HTML el número de etiquetas disponibles son limitadas y además están ya definidas (no podemos usar ninguna que no pertenezca ya a este lenguaje).

Por otro lado, los tipos que hay son los mismos. Tenemos etiquetas de apertura, etiquetas de cierre, etiquetas vacías y atributos, que deben cumplir con las características de todos los lenguajes de marcas.

**HTML** es un estándar desarrollado por [W3C (World Wide Web Consortium)](https://html.spec.whatwg.org/multipage/).

### 2.1. Estructura básica

Un documento HTML tiene una estructura jerárquica bien definida:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Título de la página</title>
</head>
<body>
    <h1>Contenido principal</h1>
    <p>Párrafo de ejemplo</p>
</body>
</html>
```

### 2.2. DOCTYPE - ENCABEZADO

La declaración `<!DOCTYPE>` informa al navegador sobre la versión de HTML utilizada:

```html
<!DOCTYPE html>  <!-- HTML5 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"> <!-- HTML 4.01 -->
```

### 2.3. Elemento HTML

El elemento `<html>` es la raíz del documento. Es obligatoria para poder formar el documento. Se compone de una etiqueta de apertura y otra de cierre y entre ambas incluiremos el resto del documento.

```html
<html lang="es">
    <!-- Todo el contenido va aquí -->
</html>
```

**Atributos importantes:**
- `lang`: Idioma principal del documento
- `dir`: Dirección del texto (ltr, rtl)

### 2.4. Elemento HEAD
Esta etiqueta es obligatoria dentro de todo documento HTML, contiene información sobre el título de la página, el autor, el idioma, etc.
Es obligatorio definir el título del documento.
La información que definamos dentro de esta etiqueta no se mostrará en el navegador a excepción del título.
La sección `<head>` contiene metadatos sobre el documento:

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Descripción de la página">
    <meta name="keywords" content="palabras, clave, separadas">
    <meta name="author" content="Nombre del autor">
    
    <title>Título de la página</title>
    
    <link rel="stylesheet" href="styles.css">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    
    <script src="script.js"></script>
</head>
```

### 2.5. Elemento BODY
También es obligatoria en todo documento HTML, contiene la información que se va a presentar en pantalla.

La sección `<body>` contiene todo `el contenido visible`:

```html
<body>
    <header>
        <nav><!-- Navegación --></nav>
    </header>
    
    <main>
        <section><!-- Contenido principal --></section>
    </main>
    
    <aside><!-- Contenido lateral --></aside>
    
    <footer><!-- Pie de página --></footer>
</body>
```

:pencil: Realizar actividad 1

## 3. Identificación de etiquetas y atributos de HTML

En el siguiente enlace disponéis de un resumen muy completo de las etiquetas disponibles en HTML, además de enlaces a ejemplos donde podéis ver como se utilizan y como se visualizan después en un navegador.
[Referencia completa de etiquetas HTML](https://developer.mozilla.org/es/docs/Web/HTML/Element)

### 3.1. Etiquetas básicas de estructura

#### **Elementos semánticos HTML5**

```html
<header>Cabecera de página o sección</header>
<nav>Navegación principal</nav>
<main>Contenido principal</main>
<section>Sección de contenido</section>
<article>Artículo independiente</article>
<aside>Contenido relacionado o lateral</aside>
<footer>Pie de página o sección</footer>
```

#### **Elementos de agrupación**

```html
<div>Contenedor genérico de bloque</div>
<span>Contenedor genérico en línea</span>
<p>Párrafo de texto</p>
<blockquote>Cita en bloque</blockquote>
<pre>Texto preformateado</pre>
```

### 3.2. Etiquetas de contenido textual

#### **Encabezados**

```html
<h1>Encabezado de nivel 1 (más importante)</h1>
<h2>Encabezado de nivel 2</h2>
<h3>Encabezado de nivel 3</h3>
<h4>Encabezado de nivel 4</h4>
<h5>Encabezado de nivel 5</h5>
<h6>Encabezado de nivel 6 (menos importante)</h6>
```

#### **Formato de texto**

```html
<strong>Texto importante (negrita semántica)</strong>
<b>Texto en negrita (solo visual)</b>
<em>Texto enfatizado (cursiva semántica)</em>
<i>Texto en cursiva (solo visual)</i>
<mark>Texto marcado/resaltado</mark>
<del>Texto eliminado</del>
<ins>Texto insertado</ins>
<sup>Texto en superíndice</sup>
<sub>Texto en subíndice</sub>
```

#### **Listas**

```html
<!-- Lista no ordenada -->
<ul>
    <li>Elemento 1</li>
    <li>Elemento 2</li>
    <li>Elemento 3</li>
</ul>

<!-- Lista ordenada -->
<ol>
    <li>Primer elemento</li>
    <li>Segundo elemento</li>
    <li>Tercer elemento</li>
</ol>

<!-- Lista de descripción -->
<dl>
    <dt>Término</dt>
    <dd>Descripción del término</dd>
</dl>
```
:pencil: Realizar actividad 2

### 3.3. Etiquetas para multimedia

#### **Imágenes**

```html
<img src="imagen.jpg" alt="Descripción de la imagen" width="300" height="200">

<!-- Imagen responsiva -->
<picture>
    <source media="(min-width: 800px)" srcset="imagen-grande.jpg">
    <source media="(min-width: 400px)" srcset="imagen-mediana.jpg">
    <img src="imagen-pequena.jpg" alt="Descripción">
</picture>
```

#### **Audio y video**

```html
<!-- Audio -->
<audio controls>
    <source src="audio.mp3" type="audio/mpeg">
    <source src="audio.ogg" type="audio/ogg">
    Tu navegador no soporta audio.
</audio>

<!-- Video -->
<video controls width="640" height="360">
    <source src="video.mp4" type="video/mp4">
    <source src="video.webm" type="video/webm">
    Tu navegador no soporta video.
</video>
```

#### **Enlaces**

```html
<a href="https://www.ejemplo.com">Enlace externo</a>
<a href="pagina.html">Enlace interno</a>
<a href="#seccion">Enlace a ancla</a>
<a href="mailto:correo@ejemplo.com">Enlace de correo</a>
<a href="tel:+34123456789">Enlace telefónico</a>
```
:pencil: realizar actividad 3

### 3.4. Etiquetas para formularios

```html
<form action="/procesar" method="post">
    <fieldset>
        <legend>Información personal</legend>
        
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="fecha">Fecha de nacimiento:</label>
        <input type="date" id="fecha" name="fecha">
        
        <label for="mensaje">Mensaje:</label>
        <textarea id="mensaje" name="mensaje" rows="4" cols="50"></textarea>
        
        <label for="pais">País:</label>
        <select id="pais" name="pais">
            <option value="es">España</option>
            <option value="fr">Francia</option>
            <option value="it">Italia</option>
        </select>
        
        <input type="checkbox" id="terminos" name="terminos">
        <label for="terminos">Acepto los términos y condiciones</label>
        
        <input type="radio" id="si" name="newsletter" value="si">
        <label for="si">Sí, quiero recibir newsletter</label>
        
        <input type="radio" id="no" name="newsletter" value="no">
        <label for="no">No, no quiero newsletter</label>
    </fieldset>
    
    <button type="submit">Enviar</button>
    <button type="reset">Limpiar</button>
</form>
```
:pencil: realizar actividad 4

### 3.5. Atributos globales

Estos atributos se pueden usar en cualquier **elemento HTML**:

```html
<div id="identificador-unico">Elemento con ID</div>
<div class="clase1 clase2">Elemento con clases</div>
<div style="color: red;">Elemento con estilo inline</div>
<div title="Información adicional">Elemento con tooltip</div>
<div data-valor="123">Elemento con atributo de datos</div>
<div contenteditable="true">Elemento editable</div>
<div draggable="true">Elemento arrastrable</div>
<div hidden>Elemento oculto</div>
<div lang="en">Elemento en inglés</div>
<div tabindex="1">Elemento con orden de tabulación</div>
```

### 3.6. Atributos específicos

Algunos atributos son específicos de ciertos elementos:

#### **Atributos de formularios**
```html
<input type="text" placeholder="Escribe aquí" maxlength="50" required>
<input type="number" min="0" max="100" step="5">
<input type="password" autocomplete="current-password">
<textarea readonly>Texto solo lectura</textarea>
<input type="checkbox" checked>
<select multiple size="4">...</select>
```

#### **Atributos de multimedia**
```html
<img src="imagen.jpg" alt="Texto alternativo" loading="lazy">
<video autoplay muted loop poster="poster.jpg">
<audio preload="metadata">
```

#### **Atributos de enlaces**
```html
<a href="documento.pdf" download>Descargar PDF</a>
<a href="enlace.html" target="_blank" rel="noopener">Abrir en nueva ventana</a>
```

## 4. Herramientas de diseño web

### 4.1. Editores de código

#### **Visual Studio Code**
- **Características**: Gratuito, extensible, integración Git
- **Extensiones útiles**: 
  - **Live Server** (ritwickdey.liveserver): La extensión ORIGINAL y más popular (68M+ descargas)
    * Crea un servidor local automático que recarga la página en tiempo real cuando guardas cambios
    * Ventajas: Muy útil para ver cambios inmediatos sin refrescar manualmente
    * Recomendación: ⭐⭐⭐⭐⭐ MUY RECOMENDADA - Esencial para principiantes
    * **NOTA**: Es la versión de Ritwick Dey, no confundir con otras variantes
  - **HTML CSS Support**: Mejora el autocompletado de CSS en archivos HTML
    * Ventajas: Ayuda con la sintaxis
    * Recomendación: ⭐⭐⭐⭐ RECOMENDADA - Ayuda sin interferir con el aprendizaje

#### **Sublime Text**
- **Características**: Rápido, personalizable, multiplataforma
- **Ventajas**: Excelente rendimiento con archivos grandes

### 4.2. Navegadores y herramientas de desarrollo

#### **Chrome DevTools**
```javascript
// Inspeccionar elementos
// Consola para JavaScript
console.log("Depuración");

// Network para analizar peticiones
// Performance para optimización
```

#### **Firefox Developer Tools**
- Inspector de CSS Grid
- Herramientas de accesibilidad
- Editor de CSS en vivo

#### **Safari Web Inspector**
- Simulador de dispositivos
- Timeline para rendimiento

### 4.3. Frameworks y librerías

#### **CSS Frameworks**
```html
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Tailwind CSS -->
<link href="https://cdn.tailwindcss.com" rel="stylesheet">

<!-- Bulma -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
```

#### **JavaScript Frameworks**
- **React**: Biblioteca para interfaces de usuario
- **Vue.js**: Framework progresivo
- **Angular**: Framework completo de Google

### 4.4. Herramientas de diseño visual

#### **Figma**
- Diseño colaborativo en la nube
- Prototipado interactivo
- Generación de código CSS

#### **Adobe XD**
- Diseño de experiencias de usuario
- Integración con Creative Cloud

#### **Sketch** (Solo macOS)
- Diseño de interfaces
- Amplio ecosistema de plugins