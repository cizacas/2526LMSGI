# Consultas en documentos de intercambio: XPath, XQuery y JSONPath

- [Consultas en documentos de intercambio: XPath, XQuery y JSONPath](#consultas-en-documentos-de-intercambio-xpath-xquery-y-jsonpath)
  - [1. Introducción](#1-introducción)
  - [2. El documento de trabajo](#2-el-documento-de-trabajo)
  - [3. XPath — Localización de nodos en XML](#3-xpath--localización-de-nodos-en-xml)
    - [3.1 ¿Qué es XPath?](#31-qué-es-xpath)
    - [3.2 Tipos de nodos](#32-tipos-de-nodos)
    - [3.3 Rutas absolutas y relativas](#33-rutas-absolutas-y-relativas)
    - [3.4 El operador `//` — buscar en cualquier nivel](#34-el-operador---buscar-en-cualquier-nivel)
    - [3.5 Seleccionar atributos con `@`](#35-seleccionar-atributos-con-)
    - [3.6 Predicados — filtrar resultados con `[ ]`](#36-predicados--filtrar-resultados-con--)
    - [3.7 Operadores en predicados](#37-operadores-en-predicados)
    - [3.8 Funciones XPath más útiles](#38-funciones-xpath-más-útiles)
    - [3.9 Ejes de XPath](#39-ejes-de-xpath)
    - [3.10 Dónde se usa XPath en la práctica](#310-dónde-se-usa-xpath-en-la-práctica)
    - [3.11 Cómo practicar XPath](#311-cómo-practicar-xpath)
  - [4. XQuery — Consultar y construir documentos XML](#4-xquery--consultar-y-construir-documentos-xml)
    - [4.1 ¿Qué es XQuery?](#41-qué-es-xquery)
    - [4.2 La expresión FLWOR](#42-la-expresión-flwor)
    - [4.3 La cláusula `for`](#43-la-cláusula-for)
    - [4.4 La cláusula `let`](#44-la-cláusula-let)
    - [4.5 La cláusula `where`](#45-la-cláusula-where)
    - [4.6 La cláusula `order by`](#46-la-cláusula-order-by)
    - [4.7 La cláusula `return`](#47-la-cláusula-return)
    - [4.8 Construcción de nuevo XML en el `return`](#48-construcción-de-nuevo-xml-en-el-return)
    - [4.9 Funciones XQuery útiles](#49-funciones-xquery-útiles)
    - [4.10 Actividad guiada — usar BaseX paso a paso](#410-actividad-guiada--usar-basex-paso-a-paso)
      - [Parte A. Si el equipo permite instalación normal](#parte-a-si-el-equipo-permite-instalación-normal)
      - [Parte B. Si el equipo NO permite instalación (modo recomendado en aula)](#parte-b-si-el-equipo-no-permite-instalación-modo-recomendado-en-aula)
      - [Parte C. Cargar XML y lanzar consultas (igual para ambos modos)](#parte-c-cargar-xml-y-lanzar-consultas-igual-para-ambos-modos)
      - [Parte D. Criterio de éxito de la actividad](#parte-d-criterio-de-éxito-de-la-actividad)
  - [5. JSONPath — Consultas sobre documentos JSON](#5-jsonpath--consultas-sobre-documentos-json)
    - [5.1 ¿Qué es JSONPath?](#51-qué-es-jsonpath)
    - [5.2 El documento JSON de trabajo](#52-el-documento-json-de-trabajo)
    - [5.3 Operadores básicos](#53-operadores-básicos)
    - [5.4 Filtros con `?()`](#54-filtros-con-)
    - [5.5 Operadores de comparación en filtros](#55-operadores-de-comparación-en-filtros)
    - [5.6 Comodines](#56-comodines)
    - [5.7 Funciones habituales en herramientas JSONPath](#57-funciones-habituales-en-herramientas-jsonpath)
    - [5.8 Comparativa XPath vs JSONPath](#58-comparativa-xpath-vs-jsonpath)
    - [5.9 Cómo practicar JSONPath](#59-cómo-practicar-jsonpath)
  - [6. Resumen comparativo](#6-resumen-comparativo)
  - [7. Ejercicios propuestos](#7-ejercicios-propuestos)
    - [Ejercicios XPath](#ejercicios-xpath)
    - [Ejercicios XQuery](#ejercicios-xquery)
    - [Ejercicios JSONPath](#ejercicios-jsonpath)
  - [8. Referencias](#8-referencias)

---

## 1. Introducción

Cuando trabajamos con documentos XML o JSON no basta con saber crearlos: también necesitamos **extraer información concreta** de ellos, filtrar datos según condiciones y, en algunos casos, construir nuevos documentos a partir de los existentes.

Para eso existen los **lenguajes de consulta orientados a documentos**:

- **XPath**: permite localizar nodos dentro de un documento XML.
- **XQuery**: extiende XPath y permite hacer consultas completas, similares en concepto a SQL pero sobre XML.
- **JSONPath**: es el equivalente de XPath para documentos JSON.

Estos lenguajes son clave dentro del módulo de Lenguaje de Marcas y Sistemas de Gestión de Información porque permiten gestionar la información almacenada en formatos de intercambio de datos.


## 2. El documento de trabajo

A lo largo de este tema usaremos este documento XML. Guárdalo como `catalogo.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo>
  <producto id="P01" disponible="true">
    <nombre>Monitor Full HD</nombre>
    <categoria>Periféricos</categoria>
    <precio>199.95</precio>
    <stock>15</stock>
  </producto>
  <producto id="P02" disponible="true">
    <nombre>Teclado mecánico</nombre>
    <categoria>Periféricos</categoria>
    <precio>89.95</precio>
    <stock>12</stock>
  </producto>
  <producto id="P03" disponible="true">
    <nombre>Ratón inalámbrico</nombre>
    <categoria>Periféricos</categoria>
    <precio>29.95</precio>
    <stock>30</stock>
  </producto>
  <producto id="P04" disponible="false">
    <nombre>SSD 1TB</nombre>
    <categoria>Almacenamiento</categoria>
    <precio>119.00</precio>
    <stock>0</stock>
  </producto>
  <producto id="P05" disponible="true">
    <nombre>Auriculares Bluetooth</nombre>
    <categoria>Audio</categoria>
    <precio>79.90</precio>
    <stock>20</stock>
  </producto>
</catalogo>
```

## 3. XPath — Localización de nodos en XML

### 3.1 ¿Qué es XPath?

XPath (XML Path Language) es un lenguaje que permite **navegar y seleccionar partes de un documento XML**. Funciona con rutas, de forma parecida a cómo se navega por carpetas en un sistema de archivos.

Forma parte del estándar W3C y se usa directamente en XSLT, XQuery, BaseX y muchas otras herramientas.

XPath no genera documentos nuevos: simplemente **selecciona** nodos o valores.

### 3.2 Tipos de nodos

Un documento XML se entiende como un árbol de nodos:

| Tipo de nodo | Ejemplo | Descripción |
|---|---|---|
| Documento | (el propio archivo) | El nodo raíz que lo contiene todo |
| Elemento | `<producto>` | Etiqueta XML |
| Atributo | `id="P01"` | Atributos de un elemento |
| Texto | `Monitor Full HD` | El contenido textual de un elemento |
| Comentario | `<!-- comentario -->` | Comentarios XML |

### 3.3 Rutas absolutas y relativas

Una **ruta absoluta** parte siempre desde la raíz del documento con `/`:

```xpath
/catalogo/producto/nombre
```
Esto selecciona todos los elementos `<nombre>` que sean hijos de `<producto>`, que a su vez es hijo de `<catalogo>`.

Una **ruta relativa** parte desde el nodo actual (contexto):

```xpath
producto/nombre
```

> **Nota:** En la práctica, cuando escribimos expresiones XPath independientes en BaseX o en una herramienta online, siempre usamos rutas absolutas o `//` para buscar desde cualquier nivel.

### 3.4 El operador `//` — buscar en cualquier nivel

El operador `//` busca en **todos los descendientes** del nodo, sin importar el nivel de profundidad:

```xpath
//nombre
```
Esto selecciona **todos** los elementos `<nombre>` del documento, estén donde estén.

```xpath
//producto/precio
```
Selecciona todos los `<precio>` que sean hijos directos de cualquier `<producto>` del documento.

### 3.5 Seleccionar atributos con `@`

Para acceder al valor de un atributo se usa `@` seguido del nombre del atributo:

```xpath
//producto/@id
```
Devuelve todos los atributos `id` de los elementos `<producto>`.

```xpath
//producto/@disponible
```
Devuelve todos los atributos `disponible`.

### 3.6 Predicados — filtrar resultados con `[ ]`

Los predicados permiten filtrar los nodos que se seleccionan. Se escriben entre corchetes `[ ]` a continuación del nodo que queremos filtrar.

**Filtrar por posición:**

```xpath
//producto[1]
```
Selecciona el primer `<producto>`.

```xpath
//producto[last()]
```
Selecciona el último `<producto>`.

```xpath
//producto[position() <= 3]
```
Selecciona los tres primeros productos.

**Filtrar por valor de un hijo:**

```xpath
//producto[nombre='Ratón inalámbrico']
```
Selecciona el producto cuyo `<nombre>` es exactamente "Ratón inalámbrico".

```xpath
//producto[precio < 100]
```
Selecciona los productos con precio inferior a 100.

**Filtrar por valor de un atributo:**

```xpath
//producto[@disponible='true']
```
Selecciona los productos cuyo atributo `disponible` es "true".

```xpath
//producto[@id='P03']
```
Selecciona el producto con `id` igual a "P03".

**Filtrar por existencia de un elemento:**

```xpath
//producto[stock]
```
Selecciona los productos que tienen el elemento `<stock>` (sea cual sea su valor).

**Combinar filtros:**

```xpath
//producto[precio > 50 and precio < 150]
```
Selecciona productos con precio entre 50 y 150.

```xpath
//producto[@disponible='true' and precio > 100]
```
Selecciona productos disponibles con precio superior a 100.

### 3.7 Operadores en predicados

| Operador | Significado | Ejemplo |
|---|---|---|
| `=` | Igual | `[nombre='Monitor Full HD']` |
| `!=` | Distinto | `[@disponible!='false']` |
| `<` | Menor que | `[precio < 50]` — en XPath dentro de XSLT usar `&lt;` |
| `>` | Mayor que | `[precio > 100]` |
| `<=` | Menor o igual | `[stock <= 10]` |
| `>=` | Mayor o igual | `[stock >= 20]` |
| `and` | Y lógico | `[precio > 50 and precio < 200]` |
| `or` | O lógico | `[categoria='Audio' or categoria='Almacenamiento']` |
| `not()` | Negación | `[not(@disponible='false')]` |

> **Importante:** Cuando usas XPath dentro de un atributo XSLT (por ejemplo en `xsl:if test="..."`) y necesitas el operador `<`, debes escribirlo como `&lt;` porque el archivo XSLT es XML y `<` dentro de un atributo no está permitido. Cuando usas XPath en BaseX o en herramientas externas puedes escribir `<` directamente.

### 3.8 Funciones XPath más útiles

XPath incluye un conjunto de funciones incorporadas:

**Funciones de nodo:**

| Función | Descripción | Ejemplo |
|---|---|---|
| `count()` | Número de nodos | `count(//producto)` → 5 |
| `last()` | Posición del último nodo | `//producto[last()]` |
| `position()` | Posición del nodo actual | `//producto[position()=2]` |
| `name()` | Nombre del nodo actual | `name(//producto[1])` → producto |

**Funciones de texto:**

| Función | Descripción | Ejemplo |
|---|---|---|
| `text()` | Texto del nodo | `//nombre/text()` |
| `contains()` | Contiene un texto | `//nombre[contains(.,'Teclado')]` |
| `starts-with()` | Empieza por un texto | `//nombre[starts-with(.,'Mon')]` |
| `string-length()` | Longitud del texto | `string-length(//nombre[1])` |
| `normalize-space()` | Elimina espacios extras | `normalize-space(//nombre[1])` |
| `concat()` | Une textos | `concat(//nombre[1],'-',//precio[1])` |
| `substring()` | Extrae parte del texto | `substring(//nombre[1],1,5)` |
| `upper-case()` | Convierte a mayúsculas (XPath 2.0+) | `upper-case(//nombre[1])` |
| `lower-case()` | Convierte a minúsculas (XPath 2.0+) | `lower-case(//nombre[1])` |

**Funciones numéricas:**

| Función | Descripción | Ejemplo |
|---|---|---|
| `sum()` | Suma de nodos | `sum(//precio)` |
| `round()` | Redondea al entero más cercano | `round(199.95)` → 200 |
| `floor()` | Redondea hacia abajo | `floor(199.95)` → 199 |
| `ceiling()` | Redondea hacia arriba | `ceiling(199.01)` → 200 |

**Funciones booleanas:**

| Función | Descripción | Ejemplo |
|---|---|---|
| `true()` | Valor verdadero | `[@disponible=true()]` |
| `false()` | Valor falso | `[@disponible=false()]` |
| `not()` | Negación | `not(precio > 100)` |

**Ejemplos usando funciones:**

```xpath
count(//producto)
```
Devuelve 5 (el número total de productos).

```xpath
sum(//precio)
```
Devuelve la suma de todos los precios.

```xpath
//producto[contains(nombre,'Teclado')]
```
Selecciona los productos cuyo nombre contiene la palabra "Teclado".

```xpath
//producto[starts-with(@id,'P0')]
```
Selecciona los productos cuyo `id` empieza por "P0".

```xpath
//nombre/text()
```
Devuelve los textos de todos los elementos `<nombre>`.

### 3.9 Ejes de XPath

Además de las rutas normales, XPath permite navegar el árbol usando **ejes**, que especifican la dirección de la búsqueda respecto al nodo actual:

| Eje | Descripción | Ejemplo |
|---|---|---|
| `child::` | Hijos directos (por defecto) | `child::nombre` = `nombre` |
| `parent::` | Padre del nodo actual | `//nombre/parent::producto` |
| `ancestor::` | Todos los ancestros | `//nombre/ancestor::catalogo` |
| `descendant::` | Todos los descendientes | `/catalogo/descendant::nombre` |
| `following-sibling::` | Hermanos que vienen después | `//producto[1]/following-sibling::producto` |
| `preceding-sibling::` | Hermanos que vienen antes | `//producto[3]/preceding-sibling::producto` |
| `self::` | El propio nodo | `//producto/self::producto[@id='P01']` |
| `attribute::` | Atributos del nodo | `//producto/attribute::id` = `//producto/@id` |

> Los ejes se usan normalmente en expresiones avanzadas. En el día a día, las rutas directas y `//` suelen ser suficientes.

### 3.10 Dónde se usa XPath en la práctica

Dentro del módulo de LMSGI, XPath aparece en:

- **XSLT**: en los atributos `match`, `select` y `test` de las instrucciones XSLT como `xsl:value-of`, `xsl:for-each`, `xsl:if`, etc.
- **XQuery**: XPath es la base sobre la que se construyen las consultas XQuery.
- **BaseX**: la herramienta que usaremos acepta directamente expresiones XPath.

### 3.11 Cómo practicar XPath

**Online (sin instalar nada):**
- [XPath Tester - FreeFormatter](https://www.freeformatter.com/xpath-tester.html): pega el XML arriba y la expresión XPath abajo.
- [CodeBeautify XPath Tester](https://codebeautify.org/Xpath-Tester): similar.

**En VS Code:**
- Instala la extensión **XSLT/XPath** de DeltaXML.
- Al posicionarte en una expresión XPath dentro de un archivo XSL, puedes ver la evaluación.

**En BaseX:**
- Carga el XML como base de datos y escribe expresiones XPath directamente en el editor.

- Vamos a descargas y elegimos la opción `windows installer`


## 4. XQuery — Consultar y construir documentos XML

### 4.1 ¿Qué es XQuery?

XQuery es un lenguaje de consulta para XML diseñado por el W3C. Piensa en él como el **SQL del XML**: permite hacer consultas, filtrar datos, ordenar resultados y construir nuevos documentos a partir de los existentes.

XQuery usa XPath internamente, así que todo lo que has aprendido en el apartado anterior sirve aquí.

La herramienta que usaremos en clase para ejecutar XQuery es **BaseX**.

### 4.2 La expresión FLWOR

La construcción fundamental de XQuery es la expresión **FLWOR** (se pronuncia "flower"). El nombre viene de sus cláusulas:

| Cláusula | Significado | Obligatoria |
|---|---|---|
| `for` | Itera sobre una colección de nodos | No siempre |
| `let` | Asigna un valor a una variable | No |
| `where` | Filtra los resultados | No |
| `order by` | Ordena los resultados | No |
| `return` | Define qué se devuelve | **Sí** |

La única cláusula obligatoria es `return`. Una consulta mínima válida puede ser simplemente:

```xquery
return "Hola"
```

Pero lo habitual es combinar varias cláusulas:

```xquery
for $variable in expresión-xpath
where condición
order by criterio
return resultado
```

### 4.3 La cláusula `for`

`for` recorre un conjunto de nodos y en cada iteración asigna el nodo actual a una variable (las variables en XQuery empiezan siempre con `$`).

```xquery
for $p in //producto
return $p
```

Esto recorre todos los elementos `<producto>` y los devuelve tal cual. El resultado es el XML completo de cada producto.

```xquery
for $p in //producto
return $p/nombre
```

Ahora devuelve solo el elemento `<nombre>` de cada producto.

> **Nota:** Para que `//producto` funcione, el XML debe estar cargado en la base de datos activa de BaseX o debes referenciarlo con `doc("catalogo.xml")//producto`.

### 4.4 La cláusula `let`

`let` asigna un valor a una variable, pero **no itera**: asigna de una vez toda la colección o el resultado de una expresión.

```xquery
let $todos := //producto
return count($todos)
```

Esto devuelve el número total de productos (5).

```xquery
let $total := sum(//precio)
return $total
```

Devuelve la suma de todos los precios.

También puedes combinar `for` y `let`:

```xquery
for $p in //producto
let $resumen := concat($p/nombre, " - ", $p/precio, "€")
return $resumen
```

Devuelve una línea de texto para cada producto con nombre y precio.

### 4.5 La cláusula `where`

`where` filtra los nodos igual que un predicado `[ ]` en XPath. La diferencia es que en `where` puedes poner condiciones más legibles.

```xquery
for $p in //producto
where $p/precio > 100
return $p/nombre
```

Devuelve el nombre de los productos con precio superior a 100.

```xquery
for $p in //producto
where $p/@disponible = 'true'
return $p/nombre
```

Devuelve los nombres de los productos disponibles.

Puedes combinar condiciones con `and` y `or`:

```xquery
for $p in //producto
where $p/precio > 50 and $p/@disponible = 'true'
return $p/nombre
```

> **Diferencia entre `where` y predicado `[ ]`:** La expresión `for $p in //producto[precio > 100]` y la expresión `for $p in //producto where $p/precio > 100` producen el mismo resultado. Usar `where` suele ser más legible en condiciones complejas.

### 4.6 La cláusula `order by`

`order by` ordena los resultados antes de devolverlos.

**Orden ascendente (por defecto):**

```xquery
for $p in //producto
order by $p/precio
return $p/nombre
```

**Orden descendente:**

```xquery
for $p in //producto
order by $p/precio descending
return $p/nombre
```

**Ordenar por texto:**

```xquery
for $p in //producto
order by $p/nombre ascending
return $p/nombre
```

**Ordenar por número (conversión de tipo):**

Si el precio está almacenado como texto en el XML, es buena práctica convertirlo:

```xquery
for $p in //producto
order by xs:decimal($p/precio) ascending
return concat($p/nombre/text(), " - ", $p/precio/text(), " €")
```

### 4.7 La cláusula `return`

`return` define qué se devuelve en cada iteración. Puede ser:

- un nodo del XML: `return $p`
- un subelemento: `return $p/nombre`
- un valor de texto: `return $p/nombre/text()`
- un texto construido: `return concat($p/nombre, ": ", $p/precio)`
- un nuevo elemento XML (ver apartado siguiente)

```xquery
for $p in //producto
return $p/nombre/text()
```

Devuelve solo el texto de los nombres, sin etiquetas XML.

### 4.8 Construcción de nuevo XML en el `return`

Una de las capacidades más potentes de XQuery es que en el `return` puedes **construir nuevos elementos XML** mezclando etiquetas fijas con valores extraídos del documento.

Las llaves `{ }` dentro del XML del `return` indican que lo que hay dentro se evalúa como XQuery:

```xquery
for $p in //producto
where $p/precio > 80
return
  <destacado>
    <nombre>{ $p/nombre/text() }</nombre>
    <precio>{ $p/precio/text() } €</precio>
  </destacado>
```

Resultado:

```xml
<destacado>
  <nombre>Monitor Full HD</nombre>
  <precio>199.95 €</precio>
</destacado>
<destacado>
  <nombre>Teclado mecánico</nombre>
  <precio>89.95 €</precio>
</destacado>
<destacado>
  <nombre>SSD 1TB</nombre>
  <precio>119.00 €</precio>
</destacado>
```

**Añadir atributos dinámicos:**

```xquery
for $p in //producto
return
  <item id="{ $p/@id }">{ $p/nombre/text() }</item>
```

Resultado:

```xml
<item id="P01">Monitor Full HD</item>
<item id="P02">Teclado mecánico</item>
...
```

**Envolver todo en un elemento raíz:**

```xquery
<resultado>
{
  for $p in //producto
  where $p/@disponible = 'true'
  order by xs:decimal($p/precio)
  return
    <producto>
      <nombre>{ $p/nombre/text() }</nombre>
      <precio>{ $p/precio/text() }</precio>
    </producto>
}
</resultado>
```

### 4.9 Funciones XQuery útiles

XQuery tiene acceso a todas las funciones de XPath y además añade otras:

| Función | Descripción | Ejemplo |
|---|---|---|
| `count()` | Número de elementos | `count(//producto)` |
| `sum()` | Suma | `sum(//precio)` |
| `avg()` | Media | `avg(//precio)` |
| `min()` | Mínimo | `min(//precio)` |
| `max()` | Máximo | `max(//precio)` |
| `distinct-values()` | Valores únicos | `distinct-values(//categoria)` |
| `doc()` | Carga un documento XML | `doc("catalogo.xml")//producto` |
| `string()` | Convierte a texto | `string($p/precio)` |
| `xs:decimal()` | Convierte a número decimal | `xs:decimal($p/precio)` |
| `xs:integer()` | Convierte a entero | `xs:integer($p/stock)` |
| `string-join()` | Une textos con separador | `string-join(//nombre, ', ')` |

**Ejemplo con `distinct-values` para obtener categorías:**

```xquery
distinct-values(//categoria)
```

Devuelve: `Periféricos Almacenamiento Audio` (sin repetidos).

**Ejemplo con `avg` y `max`:**

```xquery
let $media := avg(//precio)
let $maximo := max(//precio)
return
  <estadisticas>
    <precio-medio>{ $media }</precio-medio>
    <precio-maximo>{ $maximo }</precio-maximo>
  </estadisticas>
```

**Ejemplo: contar por categoría usando `distinct-values`:**

```xquery
for $cat in distinct-values(//categoria)
let $total := count(//producto[categoria = $cat])
return
  <categoria nombre="{ $cat }" total="{ $total }"/>
```

### 4.10 Actividad guiada — usar BaseX paso a paso

En muchos equipos del aula el alumnado no tendrá permisos de administrador para instalar programas o cambiar variables de entorno del sistema. Por eso se propone esta actividad con dos modos de uso.

#### Parte A. Si el equipo permite instalación normal

**Instalación:**
1. Descarga BaseX desde [basex.org](https://basex.org/download/).
2. Elige la opción `windows installer`.
3. Ejecuta `BaseX.exe` (interfaz gráfica).

#### Parte B. Si el equipo NO permite instalación (modo recomendado en aula)

1. Descarga BaseX en formato ZIP (portable). Descomprimir y mover a la carpeta `basex` que crearemos dentro de `AulaBaseX`, desde la estructura **basex**
2. Descarga un JDK en ZIP. Ir a [Eclipse Adoptium](https://adoptium.net/temurin/releases/
).
    - La última versión 25-LTS el `.ZIP`
    - Descomprimir y mover a la carpeta `jdk` que crearemos dentro de `AulaBaseX` el contenido de la versión descargada.
3. Crea esta estructura en una carpeta del alumno, por ejemplo `AulaBaseX`:

```text
AulaBaseX/
  basex/
  jdk/
  abrir-basex.cmd
  verificar-java.cmd
```

4. Crea el archivo `abrir-basex.cmd` con este contenido:

```bat
@echo off
setlocal
set "JAVA_HOME=%~dp0jdk"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "JAVA_TOOL_OPTIONS="
start "" "%~dp0basex\bin\BaseXGUI.bat"
```

5. Crea el archivo `verificar-java.cmd` con este contenido:

```bat
@echo off
setlocal
set "JAVA_HOME=%~dp0jdk"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "JAVA_TOOL_OPTIONS="
echo JAVA_HOME=%JAVA_HOME%
where java
java -version
pause
```

6. Ejecuta primero `verificar-java.cmd` para comprobar que BaseX usará el Java portable del alumno.
7. Ejecuta `abrir-basex.cmd` para abrir BaseX.

> Este método evita errores típicos de instalador en aulas, por ejemplo conflictos con `JAVA_TOOL_OPTIONS` o con rutas antiguas de Java del sistema.

#### Parte C. Cargar XML y lanzar consultas (igual para ambos modos)

**Cargar un documento XML:**
1. Menú `Database > New`.
2. Escribe un nombre para la base de datos, por ejemplo `tienda`.
3. Haz clic en el botón de la carpeta y selecciona `catalogo.xml`.
4. Haz clic en `OK`.

**Ejecutar una consulta:**
1. Menú `Editor > New` o `Ctrl+E`.
2. Escribe la expresión XPath o la consulta XQuery.
3. Pulsa `F5` o el botón Run (triángulo verde).
4. El resultado aparece en el panel inferior.

**Alternativa sin crear base de datos (usando `doc()`):**
Si no quieres crear una base de datos, puedes cargar el archivo con `doc()`:

```xquery
for $p in doc("C:/ruta/catalogo.xml")//producto
return $p/nombre
```

> Ajusta la ruta al lugar donde hayas guardado el archivo. En Windows usa `/` o `\\` como separador.

#### Parte D. Criterio de éxito de la actividad

La actividad se considera superada cuando el alumno:

1. Abre BaseX (instalado o portable).
2. Carga `catalogo.xml`.
3. Ejecuta al menos 3 consultas XPath correctas.
4. Ejecuta al menos 3 consultas XQuery correctas.
5. Entrega una captura del resultado en BaseX.



## 5. JSONPath — Consultas sobre documentos JSON

### 5.1 ¿Qué es JSONPath?

JSONPath es una sintaxis de consulta para documentos JSON equivalente a lo que XPath hace para XML. Fue propuesto por Stefan Goessner en 2007 y la RFC 9535 lo estandarizó en 2024.

Permite **navegar y seleccionar valores** dentro de un documento JSON usando rutas.

> **Nota:** A diferencia de XPath o XQuery, JSONPath no tiene una única herramienta estándar de uso universal. En la práctica se usa en herramientas como Postman, jq, MongoDB, VS Code con extensiones, o librerías de distintos lenguajes de programación.

### 5.2 El documento JSON de trabajo

Guarda este JSON como `catalogo.json`:

```json
{
  "catalogo": {
    "productos": [
      {
        "id": "P01",
        "nombre": "Monitor Full HD",
        "categoria": "Periféricos",
        "precio": 199.95,
        "stock": 15,
        "disponible": true
      },
      {
        "id": "P02",
        "nombre": "Teclado mecánico",
        "categoria": "Periféricos",
        "precio": 89.95,
        "stock": 12,
        "disponible": true
      },
      {
        "id": "P03",
        "nombre": "Ratón inalámbrico",
        "categoria": "Periféricos",
        "precio": 29.95,
        "stock": 30,
        "disponible": true
      },
      {
        "id": "P04",
        "nombre": "SSD 1TB",
        "categoria": "Almacenamiento",
        "precio": 119.00,
        "stock": 0,
        "disponible": false
      },
      {
        "id": "P05",
        "nombre": "Auriculares Bluetooth",
        "categoria": "Audio",
        "precio": 79.90,
        "stock": 20,
        "disponible": true
      }
    ]
  }
}
```

### 5.3 Operadores básicos

| Operador | Descripción | Ejemplo |
|---|---|---|
| `$` | Raíz del documento | `$` |
| `.` | Acceso a campo hijo | `$.catalogo` |
| `..` | Descendiente a cualquier nivel | `$..nombre` |
| `[]` | Subíndice o filtro | `$.catalogo.productos[0]` |
| `[*]` | Todos los elementos de un array | `$.catalogo.productos[*]` |
| `[n]` | Elemento en posición n (empieza en 0) | `$.catalogo.productos[0]` |
| `[n,m]` | Elementos en posición n y m | `$.catalogo.productos[0,2]` |
| `[n:m]` | Rango desde n hasta m (excluido) | `$.catalogo.productos[0:3]` |

**Ejemplos básicos:**

```jsonpath
$.catalogo.productos
```
Selecciona todo el array de productos.

```jsonpath
$.catalogo.productos[0]
```
Selecciona el primer producto (índice 0).

```jsonpath
$.catalogo.productos[*].nombre
```
Selecciona el campo `nombre` de todos los productos.

```jsonpath
$..nombre
```
Selecciona todos los campos `nombre` del documento, a cualquier nivel.

```jsonpath
$.catalogo.productos[0:3]
```
Selecciona los tres primeros productos (índices 0, 1 y 2).

### 5.4 Filtros con `?()`

Los filtros permiten seleccionar solo los elementos que cumplen una condición. Se escriben con `?()` dentro de los corchetes. Dentro del filtro, `@` referencia el elemento actual del array:

```jsonpath
$.catalogo.productos[?(@.precio > 100)]
```
Selecciona los productos con precio superior a 100.

```jsonpath
$.catalogo.productos[?(@.disponible == true)]
```
Selecciona los productos disponibles.

```jsonpath
$.catalogo.productos[?(@.stock == 0)]
```
Selecciona los productos sin stock.

```jsonpath
$.catalogo.productos[?(@.categoria == 'Periféricos')]
```
Selecciona los productos de la categoría Periféricos.

**Para acceder a un campo concreto del resultado filtrado:**

```jsonpath
$.catalogo.productos[?(@.precio > 100)].nombre
```
Selecciona solo el nombre de los productos con precio superior a 100.

### 5.5 Operadores de comparación en filtros

| Operador | Significado | Ejemplo |
|---|---|---|
| `==` | Igual | `[?(@.disponible == true)]` |
| `!=` | Distinto | `[?(@.stock != 0)]` |
| `<` | Menor que | `[?(@.precio < 50)]` |
| `>` | Mayor que | `[?(@.precio > 100)]` |
| `<=` | Menor o igual | `[?(@.stock <= 5)]` |
| `>=` | Mayor o igual | `[?(@.precio >= 80)]` |

### 5.6 Comodines

El comodín `*` selecciona todos los elementos o campos:

```jsonpath
$.catalogo.productos[*]
```
Todos los productos.

```jsonpath
$.catalogo.productos[*].nombre
```
El nombre de cada producto.

```jsonpath
$.catalogo.productos[0].*
```
Todos los campos del primer producto.

### 5.7 Funciones habituales en herramientas JSONPath

No todos los evaluadores soportan las mismas funciones, pero en herramientas como jsonpath-plus o Postman puedes encontrar:

| Función | Descripción | Ejemplo |
|---|---|---|
| `length()` | Longitud de un array o string | `$.catalogo.productos.length()` |
| `size()` | Número de elementos | `$.catalogo.productos.size()` |
| `keys()` | Claves de un objeto | `$.catalogo.productos[0].keys()` |

> **Consejo:** Si en una herramienta no funciona `length()`, prueba con `$.catalogo.productos[*]` y cuenta el resultado a mano, o usa un lenguaje de programación.

### 5.8 Comparativa XPath vs JSONPath

| Concepto | XPath | JSONPath |
|---|---|---|
| Raíz del documento | `/` | `$` |
| Separador de niveles | `/` | `.` |
| Todos los descendientes | `//nombre` | `$..nombre` |
| Todos los elementos de lista | `//producto` | `$.productos[*]` |
| Posición (primer elemento) | `[1]` (empieza en 1) | `[0]` (empieza en 0) |
| Filtro por condición | `[precio > 100]` | `[?(@.precio > 100)]` |
| Elemento actual en filtro | `.` | `@` |
| Atributos | `@id` | no existe (todo son campos) |

> **Importante:** En XPath los índices empiezan en **1** (`//producto[1]` es el primero). En JSONPath empiezan en **0** (`$.productos[0]` es el primero).

### 5.9 Cómo practicar JSONPath

**Online (sin instalar nada):**
- [JSONPath Online Evaluator](https://jsonpath.com/): muy visual, el más recomendado para clase.
- [JSONPath Tester - CodeBeautify](https://codebeautify.org/jsonpath-tester): similar.

**En VS Code:**
- La extensión **REST Client** permite hacer peticiones y aplicar JSONPath.

**En Postman:**
- Las aserciones de tests usan JSONPath con la librería `pm.response.json()`.


## 6. Resumen comparativo

| Característica | XPath | XQuery | JSONPath |
|---|---|---|---|
| Formato objetivo | XML | XML | JSON |
| Herramienta de clase | BaseX, VS Code, XSLT | BaseX | jsonpath.com |
| ¿Itera y filtra? | Sí (rutas y predicados) | Sí (FLWOR) | Sí (filtros) |
| ¿Construye nuevo documento? | No | **Sí** | No |
| ¿Ordenar resultados? | No directamente | `order by` | No directamente |
| ¿Funciones de agregación? | `sum()`, `count()` | `sum()`, `avg()`, `max()`, `min()` | Depende del evaluador |
| Sintaxis de filtro | `[precio > 100]` | `where $p/precio > 100` | `[?(@.precio > 100)]` |
| Es estándar W3C | Sí | Sí | RFC 9535 (2024) |


## 7. Ejercicios propuestos

Usa el documento `catalogo.xml` para los ejercicios de XPath y XQuery, y `catalogo.json` para los de JSONPath.

### Ejercicios XPath

1. Selecciona todos los elementos `<producto>`.
2. Selecciona todos los `<nombre>` del documento.
3. Obtén el nombre del primer producto.
4. Obtén el nombre del último producto.
5. Selecciona los productos con precio inferior a 50.
6. Selecciona los productos disponibles (`@disponible='true'`).
7. Selecciona el nombre de los productos de la categoría "Periféricos".
8. Obtén el precio máximo usando `max()`.
9. Calcula la suma de todos los precios con `sum()`.
10. Selecciona los productos cuyo nombre contiene la palabra "Bluetooth".

### Ejercicios XQuery

Ejecuta las siguientes consultas en BaseX con `catalogo.xml` cargado como base de datos:

1. Muestra los nombres de todos los productos.
2. Muestra los nombres de los productos con precio superior a 80.
3. Muestra nombre y precio de los productos disponibles, ordenados por precio ascendente.
4. Calcula el precio medio de todos los productos.
5. Genera un XML con los productos sin stock (stock = 0):
   ```xml
   <sin-stock>
     <producto>...</producto>
   </sin-stock>
   ```
6. Lista las categorías sin repetidos usando `distinct-values()`.
7. Construye un XML que incluya, para cada categoría, cuántos productos tiene.
8. Genera un XML de resumen con el precio total del inventario (precio × stock de cada producto).

### Ejercicios JSONPath

Usa [jsonpath.com](https://jsonpath.com/) con `catalogo.json`:

1. Selecciona todos los productos.
2. Selecciona solo los nombres de todos los productos.
3. Obtén el primer producto.
4. Obtén los productos en posición 1 y 3 (segundo y cuarto).
5. Filtra los productos con precio superior a 100.
6. Filtra los productos disponibles (`disponible == true`).
7. Obtén el nombre de los productos con stock igual a 0.
8. Selecciona todo de los productos de categoría "Audio".
9. Obtén el `id` y el `nombre` de los productos con precio entre 50 y 120.
10. Usa `$..nombre` y compara el resultado con `$.catalogo.productos[*].nombre`.


## 8. Referencias

- [XPath 3.1 - W3C](https://www.w3.org/TR/xpath-31/)
- [XQuery 3.1 - W3C](https://www.w3.org/TR/xquery-31/)
- [JSONPath - RFC 9535](https://datatracker.ietf.org/doc/rfc9535/)
- [XPath Tester online](https://www.freeformatter.com/xpath-tester.html)
- [JSONPath online](https://jsonpath.com/)
- [BaseX Documentation](https://docs.basex.org/)
- [BaseX XQuery Tutorial](https://docs.basex.org/wiki/XQuery_Tutorial)
