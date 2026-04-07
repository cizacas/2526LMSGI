# Gestión de la información en formatos de intercambio de datos
- [Gestión de la información en formatos de intercambio de datos](#gestión-de-la-información-en-formatos-de-intercambio-de-datos)
  - [1. Introducción](#1-introducción)
  - [2. Resultado de aprendizaje y criterios de evaluación](#2-resultado-de-aprendizaje-y-criterios-de-evaluación)
  - [3. Sistemas de almacenamiento de información](#3-sistemas-de-almacenamiento-de-información)
    - [3.1 Documentos de intercambio](#31-documentos-de-intercambio)
    - [3.2 Bases de datos relacionales](#32-bases-de-datos-relacionales)
    - [3.3 Bases de datos nativas](#33-bases-de-datos-nativas)
    - [3.4 Comparativa rápida](#34-comparativa-rápida)
  - [4. Ventajas e inconvenientes de los formatos de intercambio](#4-ventajas-e-inconvenientes-de-los-formatos-de-intercambio)
  - [5. Tecnologías de almacenamiento según el tipo de información](#5-tecnologías-de-almacenamiento-según-el-tipo-de-información)
  - [6. Lenguajes y herramientas de consulta y manipulación](#6-lenguajes-y-herramientas-de-consulta-y-manipulación)
    - [6.1 SQL](#61-sql)
    - [6.2 XPath](#62-xpath)
    - [6.3 XQuery](#63-xquery)
    - [6.4 JSONPath y consultas sobre documentos JSON](#64-jsonpath-y-consultas-sobre-documentos-json)
    - [6.5 Herramientas recomendadas](#65-herramientas-recomendadas)
  - [7. Consulta y manipulación de información](#7-consulta-y-manipulación-de-información)
  - [8. Importación y exportación entre sistemas](#8-importación-y-exportación-entre-sistemas)
    - [8.1 De base de datos relacional a XML o JSON](#81-de-base-de-datos-relacional-a-xml-o-json)
    - [8.2 De XML o JSON a base de datos relacional](#82-de-xml-o-json-a-base-de-datos-relacional)
    - [8.3 Problemas habituales en la conversión](#83-problemas-habituales-en-la-conversión)
  - [9. Almacenamiento nativo y gestión de información](#9-almacenamiento-nativo-y-gestión-de-información)
    - [9.1 Bases de datos XML nativas](#91-bases-de-datos-xml-nativas)
    - [9.2 Bases de datos documentales JSON](#92-bases-de-datos-documentales-json)
  - [10. Caso práctico integrado](#10-caso-práctico-integrado)
  - [11. Relación entre contenidos y criterios de evaluación](#11-relación-entre-contenidos-y-criterios-de-evaluación)
  - [12. Conclusiones](#12-conclusiones)
  - [13. Actividades propuestas](#13-actividades-propuestas)
  - [14. Referencias](#14-referencias)

## 1. Introducción

En los sistemas actuales la información rara vez permanece aislada. Una aplicación web consume datos de una API, un ERP exporta ficheros para otra plataforma, una tienda online sincroniza productos con un marketplace y un sistema académico genera informes a partir de su base de datos. En todos estos casos intervienen dos ideas clave: el almacenamiento de la información y su intercambio entre sistemas distintos.

Los formatos de intercambio de datos, como XML y JSON, permiten representar la información de forma estructurada, portable y comprensible por diferentes aplicaciones. Sin embargo, esos formatos no sustituyen siempre a una base de datos tradicional. En muchos escenarios conviven con sistemas relacionales y con bases de datos nativas orientadas a documentos.

En esta unidad se estudia cómo gestionar información en formatos de intercambio, qué tecnologías de almacenamiento resultan más adecuadas según las características de los datos y qué lenguajes y herramientas permiten consultar, manipular, importar y exportar esa información.

## 2. Resultado de aprendizaje y criterios de evaluación

**RA6. Gestiona la información en formatos de intercambio de datos analizando y utilizando tecnologías de almacenamiento y lenguajes de consulta.**

Este resultado de aprendizaje implica que el alumnado debe ser capaz de:

- Identificar los principales métodos de almacenamiento utilizados en documentos de intercambio de datos.
- Analizar las ventajas e inconvenientes de almacenar información en formatos de intercambio.
- Seleccionar tecnologías eficientes de almacenamiento en función de las características de la información.
- Reconocer lenguajes y herramientas para el tratamiento y almacenamiento de información.
- Utilizar lenguajes de consulta y manipulación sobre documentos de intercambio.
- Trabajar con sistemas gestores de bases de datos relacionales para almacenar y recuperar información.
- Crear documentos de intercambio a partir de información almacenada en bases de datos relacionales.
- Identificar las características de los distintos sistemas de almacenamiento.
- Gestionar información almacenada en bases de datos nativas mediante herramientas específicas.

## 3. Sistemas de almacenamiento de información

Al diseñar una solución informática no basta con decidir qué datos se guardan. También es necesario decidir **cómo** se almacenan, **dónde** se consultan y **qué formato** facilita mejor su intercambio.

### 3.1 Documentos de intercambio

Los documentos de intercambio son ficheros estructurados que permiten transportar información entre programas, servicios o plataformas. Los formatos más habituales son:

- **XML**: muy utilizado cuando se necesita una estructura jerárquica clara, validación mediante DTD o XSD, y compatibilidad con tecnologías como XPath, XQuery o XSLT.
- **JSON**: formato ligero, muy usado en APIs web, aplicaciones JavaScript y servicios REST.
- **CSV**: formato simple orientado a datos tabulares, útil para importaciones y exportaciones rápidas.

Ejemplo de documento XML:

```xml
<productos>
  <producto id="P01">
    <nombre>Teclado mecánico</nombre>
    <precio>89.95</precio>
    <stock>12</stock>
  </producto>
</productos>
```

Ejemplo equivalente en JSON:

```json
{
  "productos": [
    {
      "id": "P01",
      "nombre": "Teclado mecánico",
      "precio": 89.95,
      "stock": 12
    }
  ]
}
```

### 3.2 Bases de datos relacionales

Las bases de datos relacionales almacenan la información en tablas relacionadas entre sí mediante claves primarias y claves ajenas. Son adecuadas cuando se necesita:

- integridad de datos
- consistencia transaccional
- consultas complejas
- relaciones claras entre entidades

Ejemplos: MySQL, MariaDB, PostgreSQL, SQL Server y SQLite.

Ejemplo de estructura relacional:

```sql
CREATE TABLE producto (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INTEGER NOT NULL
);
```

### 3.3 Bases de datos nativas

Una base de datos nativa está diseñada para almacenar directamente un tipo concreto de documento o estructura de datos, sin necesidad de transformarlo previamente al modelo tabular tradicional.

Podemos destacar dos grupos:

- **Bases de datos XML nativas**: almacenan documentos XML completos y permiten consultarlos con XPath o XQuery. Un ejemplo habitual en entornos educativos es BaseX.
- **Bases de datos documentales JSON**: almacenan documentos JSON y suelen usarse en modelos NoSQL. Un ejemplo muy extendido es MongoDB.

Este tipo de sistemas resulta útil cuando:

- la información es jerárquica o semiestructurada
- los documentos no tienen siempre la misma estructura
- interesa conservar el documento completo tal y como se recibe

### 3.4 Comparativa rápida

| Sistema | Estructura principal | Ventaja destacada | Inconveniente habitual | Uso típico |
|---|---|---|---|---|
| XML | Jerárquica | Muy validable y extensible | Más verboso | Intercambio empresarial, documentos complejos |
| JSON | Jerárquica ligera | Muy simple y popular en web | Menor expresividad formal que XML | APIs, servicios web, aplicaciones cliente |
| Relacional | Tablas y relaciones | Gran integridad y potencia en consultas | Menos natural para datos muy anidados | Gestión transaccional |
| Nativa XML | Documentos XML | Consulta directa del documento | Menor implantación general | Repositorios XML |
| Documental JSON | Documentos JSON | Flexibilidad de esquema | Riesgo de inconsistencia si se diseña mal | Aplicaciones NoSQL |

## 4. Ventajas e inconvenientes de los formatos de intercambio

**Ventajas:**

- Facilitan la comunicación entre sistemas heterogéneos.
- Son legibles por personas y por máquinas.
- Permiten serializar y transportar datos por red o entre aplicaciones.
- Pueden validarse y transformarse con herramientas estándar.
- Favorecen la interoperabilidad entre tecnologías distintas.

**Inconvenientes:**

- No siempre ofrecen el mejor rendimiento para grandes volúmenes de datos.
- Pueden duplicar información si no existe un diseño adecuado.
- En XML el tamaño del documento puede crecer mucho por la verbosidad de las etiquetas.
- En JSON y formatos flexibles puede aparecer falta de homogeneidad si no se define un esquema claro.
- No sustituyen por sí solos funciones propias de un SGBD, como transacciones, control de concurrencia o integridad referencial.

La idea fundamental es que un formato de intercambio no se elige porque sea mejor en todo, sino porque resuelve mejor un problema concreto de interoperabilidad.

## 5. Tecnologías de almacenamiento según el tipo de información

La elección de la tecnología debe responder a las características de los datos y al uso previsto:

- Si la información es **tabular y muy estructurada**, suele ser preferible una base de datos relacional.
- Si la información es **jerárquica**, con documentos extensos y necesidad de validación, XML puede ser una buena opción.
- Si se trabaja con **servicios web y aplicaciones cliente**, JSON suele ser la alternativa más práctica.
- Si los documentos tienen **estructura variable** y se quiere conservar el documento completo, puede interesar una base de datos nativa o documental.
- Si el objetivo principal es **transferir datos entre aplicaciones**, XML, JSON o CSV suelen ser más adecuados que una base de datos como formato final de intercambio.

No existe una tecnología universalmente mejor. La eficiencia depende de factores como el volumen de datos, la frecuencia de consulta, la complejidad de la estructura, la necesidad de validación y los requisitos de integración con otros sistemas.

## 6. Lenguajes y herramientas de consulta y manipulación

### 6.1 SQL

SQL es el lenguaje estándar para consultar y manipular bases de datos relacionales.

Ejemplo:

```sql
SELECT nombre, precio
FROM producto
WHERE stock > 0
ORDER BY precio DESC;
```

Con SQL se pueden realizar operaciones de:

- consulta (`SELECT`)
- inserción (`INSERT`)
- modificación (`UPDATE`)
- borrado (`DELETE`)
- definición de estructuras (`CREATE`, `ALTER`, `DROP`)

### 6.2 XPath

XPath permite localizar nodos dentro de un documento XML.

Ejemplo de XML:

```xml
<catalogo>
  <producto id="P01">
    <nombre>Monitor</nombre>
    <precio>199</precio>
  </producto>
  <producto id="P02">
    <nombre>Ratón</nombre>
    <precio>25</precio>
  </producto>
</catalogo>
```

Ejemplos de expresiones XPath:

- `/catalogo/producto` selecciona todos los productos.
- `/catalogo/producto[nombre='Ratón']` selecciona el producto cuyo nombre es Ratón.
- `//producto[precio > 100]/nombre` selecciona el nombre de los productos con precio superior a 100.

### 6.3 XQuery

XQuery amplía las posibilidades de XPath y está pensado para consultar y construir resultados a partir de documentos XML.

Ejemplo:

```xquery
for $p in /catalogo/producto
where $p/precio > 100
return <destacado>{ $p/nombre }</destacado>
```

Resultado esperado:

```xml
<destacado>Monitor</destacado>
```

### 6.4 JSONPath y consultas sobre documentos JSON

JSONPath es una sintaxis frecuente para navegar por documentos JSON, aunque no existe un estándar único tan consolidado como XPath en XML.

Ejemplo de JSON:

```json
{
  "catalogo": {
    "productos": [
      { "id": "P01", "nombre": "Monitor", "precio": 199 },
      { "id": "P02", "nombre": "Ratón", "precio": 25 }
    ]
  }
}
```

Ejemplos de rutas:

- `$.catalogo.productos[*]` selecciona todos los productos.
- `$.catalogo.productos[?(@.precio > 100)]` filtra los productos con precio superior a 100.

En la práctica, muchas consultas sobre JSON también se realizan con herramientas del propio lenguaje de programación o del gestor documental empleado.

### 6.5 Herramientas recomendadas

- **VS Code** para editar XML, JSON, XQuery y scripts.
- **DBeaver** para trabajar con bases de datos relacionales mediante interfaz gráfica.
- **SQLite** para ejemplos sencillos y portables.
- **BaseX** para almacenar y consultar XML de forma nativa.
- **MongoDB Compass** para explorar documentos JSON en MongoDB.

> Para un desarrollo completo de XPath, XQuery y JSONPath con ejemplos paso a paso y ejercicios, consulta los apuntes específicos: [Consultas en documentos de intercambio — XPath, XQuery y JSONPath](ConsultasXPathXQueryJSONPath.md)

## 7. Consulta y manipulación de información

Gestionar información no consiste solo en almacenarla. También implica recuperarla, filtrarla, combinarla y transformarla.

Operaciones habituales:

- buscar elementos concretos
- filtrar por condiciones
- ordenar resultados
- agrupar información
- construir nuevos documentos a partir de los existentes

Ejemplo en SQL:

```sql
SELECT categoria, COUNT(*) AS total
FROM producto
GROUP BY categoria;
```

Ejemplo en XPath:

```xpath
//producto[@id='P01']/nombre
```

Ejemplo en XQuery construyendo un nuevo documento:

```xquery
<productos-caros>
{
  for $p in /catalogo/producto
  where $p/precio > 100
  return $p
}
</productos-caros>
```

Estas operaciones permiten preparar la información para informes, sincronizaciones, integraciones o exportaciones.

## 8. Importación y exportación entre sistemas

La interoperabilidad entre sistemas exige saber convertir la información de un modelo a otro.

### 8.1 De base de datos relacional a XML o JSON

Es habitual generar documentos de intercambio a partir de consultas SQL.

Ejemplo conceptual:

```sql
SELECT id, nombre, precio
FROM producto;
```

Ese resultado puede exportarse a JSON:

```json
[
  { "id": 1, "nombre": "Monitor", "precio": 199.00 },
  { "id": 2, "nombre": "Ratón", "precio": 25.00 }
]
```

O a XML:

```xml
<productos>
  <producto id="1">
    <nombre>Monitor</nombre>
    <precio>199.00</precio>
  </producto>
  <producto id="2">
    <nombre>Ratón</nombre>
    <precio>25.00</precio>
  </producto>
</productos>
```

Muchos gestores y herramientas permiten exportar directamente resultados a CSV, JSON o XML.

### 8.2 De XML o JSON a base de datos relacional

El proceso inverso suele implicar:

1. Leer el documento.
2. Identificar su estructura.
3. Mapear cada dato a tablas y columnas.
4. Insertar la información con sentencias SQL o con herramientas ETL.

Por ejemplo, un JSON de pedidos puede dividirse en varias tablas:

- tabla `pedido`
- tabla `cliente`
- tabla `linea_pedido`

Esto obliga a transformar una estructura anidada en un modelo relacional normalizado.

### 8.3 Problemas habituales en la conversión

- pérdida de jerarquía al pasar de XML o JSON a tablas
- dificultad para representar listas o estructuras anidadas
- diferencias entre tipos de datos
- duplicidades si no se identifican bien claves y relaciones
- inconsistencias al importar documentos incompletos o mal formados

Por eso es importante diseñar reglas de transformación claras y validar los documentos antes de cargarlos en el sistema destino.

## 9. Almacenamiento nativo y gestión de información

### 9.1 Bases de datos XML nativas

Las bases de datos XML nativas almacenan directamente documentos XML completos y permiten operar sobre ellos sin convertirlos a tablas.

Ventajas:

- mantienen la estructura original del documento
- permiten consultas con XPath y XQuery
- resultan adecuadas para documentos jerárquicos complejos

Ejemplo de uso en BaseX:

```xquery
for $libro in doc("biblioteca.xml")//libro
where $libro/precio > 20
return $libro/titulo
```

### 9.2 Bases de datos documentales JSON

Las bases de datos documentales, como MongoDB, almacenan documentos JSON o BSON. Son útiles cuando el esquema puede evolucionar y cuando cada documento representa una entidad completa.

Ejemplo de documento:

```json
{
  "_id": 1,
  "cliente": "Ana",
  "lineas": [
    { "producto": "Teclado", "cantidad": 1 },
    { "producto": "Ratón", "cantidad": 2 }
  ]
}
```

Consulta típica en MongoDB:

```javascript
db.pedidos.find({ "cliente": "Ana" })
```

Aunque este módulo se centra en formatos de intercambio, conviene entender que los sistemas nativos permiten almacenar esos documentos con mayor naturalidad que el modelo relacional en determinados contextos.

## 10. Caso práctico integrado

El caso práctico trabaja con una **tienda online** con productos, clientes y pedidos. Los archivos están disponibles en la carpeta `ejercicios/Tema5/caso_practico/`.

| Archivo | Paso | Descripción |
|---|---|---|
| [`tienda_crear.sql`](../ejercicios/Tema5/caso_practico/tienda_crear.sql) | 1 y 2 | Crea las tablas e inserta los datos en SQLite |
| [`consultas_sql.sql`](../ejercicios/Tema5/caso_practico/consultas_sql.sql) | 3 | Consultas SQL: SELECT, JOIN, GROUP BY |
| [`productos.xml`](../ejercicios/Tema5/caso_practico/productos.xml) | 4 | Exportación de productos a XML |
| [`pedidos.json`](../ejercicios/Tema5/caso_practico/pedidos.json) | 4 | Exportación de pedidos a JSON (estructura anidada) |
| [`consultas_xquery.xq`](../ejercicios/Tema5/caso_practico/consultas_xquery.xq) | 5 | 8 consultas XQuery para ejecutar en BaseX |
| [`README.md`](../ejercicios/Tema5/caso_practico/README.md) | — | Guía paso a paso completa |

**Secuencia de trabajo:**

1. Abrir DBeaver, crear una conexión SQLite y ejecutar `tienda_crear.sql`.
2. Consultar la base de datos con las sentencias de `consultas_sql.sql`.
3. Exportar los productos a `productos.xml` (o usar el archivo ya preparado).
4. Revisar `pedidos.json` y comparar la estructura anidada frente al modelo relacional.
5. Cargar `productos.xml` en BaseX y ejecutar las consultas de `consultas_xquery.xq`.
6. Reflexionar sobre qué operaciones son más naturales en cada sistema.

Con este recorrido se cubren prácticamente todos los criterios de evaluación del RA6.

## 11. Relación entre contenidos y criterios de evaluación

| Contenido de la unidad | Criterios relacionados |
|---|---|
| Sistemas de almacenamiento de información | a, b, c, h |
| Lenguajes de consulta y manipulación | d, e |
| Consulta y manipulación de información | e |
| Importación y exportación relacional | f, g |
| Herramientas de tratamiento en sistemas nativos | d, i |
| Almacenamiento nativo | c, h, i |

## 12. Conclusiones

La gestión de información en formatos de intercambio exige comprender que el dato puede vivir en distintos entornos: documentos XML o JSON, bases relacionales y sistemas nativos. Cada uno responde mejor a unas necesidades concretas.

El profesional de desarrollo de aplicaciones no solo debe saber crear documentos de intercambio, sino también decidir qué tecnología de almacenamiento es más adecuada, consultar la información con el lenguaje correcto y transformar los datos para integrarlos entre sistemas distintos.

En consecuencia, dominar SQL, XPath, XQuery y las herramientas de importación, exportación y gestión documental constituye una competencia esencial dentro del módulo de Lenguaje de Marcas y Sistemas de Gestión de Información.

## 13. Actividades propuestas

1. Elabora una tabla comparativa entre XML, JSON, CSV, bases de datos relacionales y bases de datos nativas.
2. Diseña una base de datos relacional sencilla para una biblioteca o tienda.
3. Exporta una tabla a formato CSV y otra a formato JSON.
4. Crea un documento XML con información de productos y realiza consultas XPath sobre él.
5. Construye una consulta XQuery que genere un nuevo XML con los productos de precio superior a un valor dado.
6. Importa un conjunto de datos desde JSON o XML a una base relacional identificando los posibles problemas de transformación.
7. Carga un documento XML en BaseX o un documento JSON en MongoDB Compass y realiza varias consultas.
8. Explica qué sistema utilizarías en cada uno de estos casos: facturación, catálogo web, API REST y archivo documental.

## 14. Referencias

- [W3C XPath](https://www.w3.org/TR/xpath-31/)
- [W3C XQuery](https://www.w3.org/TR/xquery-31/)
- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [BaseX Documentation](https://docs.basex.org/)
- [MongoDB Manual](https://www.mongodb.com/docs/)