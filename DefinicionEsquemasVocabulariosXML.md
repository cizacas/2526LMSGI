# Definición de esquemas y vocabularios XML - DTD y XSD
- [Definición de esquemas y vocabularios XML - DTD y XSD](#definición-de-esquemas-y-vocabularios-xml---dtd-y-xsd)
  - [Introducción](#introducción)
  - [¿Por qué definir esquemas y vocabularios?](#por-qué-definir-esquemas-y-vocabularios)
  - [Tecnologías para la definición de esquemas](#tecnologías-para-la-definición-de-esquemas)
  - [DTD (Document Type Definition)](#dtd-document-type-definition)
    - [Referencias](#referencias)
    - [¿Qué es un DTD?](#qué-es-un-dtd)
    - [Cómo referenciar un DTD en un documento XML](#cómo-referenciar-un-dtd-en-un-documento-xml)
      - [DTD interno (incluido en el propio XML)](#dtd-interno-incluido-en-el-propio-xml)
    - [Uso de standalone="yes" con DTD interno](#uso-de-standaloneyes-con-dtd-interno)
      - [Ejemplo:](#ejemplo)
      - [DTD externo (archivo separado)](#dtd-externo-archivo-separado)
    - [Uso de standalone="no" con DTD externo](#uso-de-standaloneno-con-dtd-externo)
      - [Ejemplo:](#ejemplo-1)
    - [Definición de elementos en DTD](#definición-de-elementos-en-dtd)
      - [Sintaxis básica](#sintaxis-básica)
      - [Tabla: Valores de tipoContenido en un elemento](#tabla-valores-de-tipocontenido-en-un-elemento)
    - [Ejemplos de definición de elementos](#ejemplos-de-definición-de-elementos)
    - [Definición de atributos en DTD](#definición-de-atributos-en-dtd)
      - [Sintaxis básica](#sintaxis-básica-1)
      - [Tabla: Principales valores de tipoAtributo](#tabla-principales-valores-de-tipoatributo)
      - [Tabla: Principales valores de valorAtributo](#tabla-principales-valores-de-valoratributo)
    - [Ejemplos de definición de atributos](#ejemplos-de-definición-de-atributos)
  - [XSD (XML Schema Definition)](#xsd-xml-schema-definition)
    - [Referencias](#referencias-1)
    - [¿Qué es un XSD?](#qué-es-un-xsd)
    - [¿Cómo referenciar un XSD en un XML?](#cómo-referenciar-un-xsd-en-un-xml)
      - [Sin asociar a un espacio de nombres](#sin-asociar-a-un-espacio-de-nombres)
      - [Ejemplo XML:](#ejemplo-xml)
      - [Ejemplo de XSD (persona.xsd) que valida el XML anterior:](#ejemplo-de-xsd-personaxsd-que-valida-el-xml-anterior)
      - [Asociado a un espacio de nombres](#asociado-a-un-espacio-de-nombres)
      - [Ejemplo XML](#ejemplo-xml-1)
      - [Ejemplo de XSD (persona.xsd) que valida el XML anterior con espacio de nombres:](#ejemplo-de-xsd-personaxsd-que-valida-el-xml-anterior-con-espacio-de-nombres)
    - [Definición de elementos simples](#definición-de-elementos-simples)
    - [Definición de elementos complejos](#definición-de-elementos-complejos)
    - [Definición de atributos](#definición-de-atributos)
    - [Tipos de datos](#tipos-de-datos)
    - [Restricciones sobre los datos](#restricciones-sobre-los-datos)
    - [Otras reglas y estructuras en XSD](#otras-reglas-y-estructuras-en-xsd)
      - [Orden de elementos: sequence y all](#orden-de-elementos-sequence-y-all)
      - [Crear nuevos tipos de datos: complexType y simpleType](#crear-nuevos-tipos-de-datos-complextype-y-simpletype)
      - [Crear nuevos tipos de contenido: complexContent y simpleContent](#crear-nuevos-tipos-de-contenido-complexcontent-y-simplecontent)
      - [Restricciones y extensiones de datos](#restricciones-y-extensiones-de-datos)
    - [Referencias especiales y XSD índices](#referencias-especiales-y-xsd-índices)
      - [Ejemplo de claves e índices](#ejemplo-de-claves-e-índices)
    - [Herramientas de validación](#herramientas-de-validación)
      - [Ejemplo de validación con xmllint](#ejemplo-de-validación-con-xmllint)
  - [Conclusión](#conclusión)

## Introducción
La definición de esquemas y vocabularios XML es fundamental para garantizar la correcta estructuración, intercambio y validación de información entre sistemas. Los esquemas permiten establecer reglas sobre la sintaxis y la estructura de los documentos XML, mientras que los vocabularios definen los términos y elementos que se pueden utilizar.

## ¿Por qué definir esquemas y vocabularios?
- Permite describir la información transmitida y sus reglas.
- Facilita la interoperabilidad entre aplicaciones.
- Ayuda a validar la estructura y el contenido de los documentos.

## Tecnologías para la definición de esquemas
- **DTD (Document Type Definition):** Define la estructura básica de un documento XML.
- **XML Schema (XSD):** Permite definir tipos de datos, restricciones y estructuras complejas.

## DTD (Document Type Definition)
### Referencias
- [W3Schools DTD Tutorial](https://www.w3schools.com/xml/xml_dtd.asp)

### ¿Qué es un DTD?
Un DTD (Definición de Tipo de Documento) especifica la estructura y las reglas que debe cumplir un documento XML. Permite definir qué elementos y atributos pueden aparecer, en qué orden y con qué valores.

### Cómo referenciar un DTD en un documento XML

#### DTD interno (incluido en el propio XML)
Si el DTD va dentro del propio documento XML que valida la definición se realiza de la siguiente manera:
```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE nombreElementoRaiz [
... Declaraciones del DTD ...
]>
```

### Uso de standalone="yes" con DTD interno
Cuando se utiliza un DTD interno y el documento XML no depende de recursos externos, es recomendable añadir el atributo `standalone="yes"` en la cabecera. Esto indica que el documento es independiente y no necesita DTDs externos para su validación.

#### Ejemplo:
```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE persona [
  <!ELEMENT persona (nombre, edad)>
  <!ELEMENT nombre (#PCDATA)>
  <!ELEMENT edad (#PCDATA)>
]>
<persona>
  <nombre>Juan</nombre>
  <edad>30</edad>
</persona>
```

#### DTD externo (archivo separado)
Si tenemos el DTD definido en otro documento diferente al del XML, vamos en otro archivo de texto pero dentro de nuestro propio equipo la referencia que debemos escribir en el XML es la siguiente:
```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE nombreElementoRaiz SYSTEM “dirección del archivo .dtd”>
```
### Uso de standalone="no" con DTD externo
Cuando se utiliza un DTD externo y el documento XML depende de recursos externos, es recomendable añadir el atributo `standalone="no"` en la cabecera. Esto indica que el documento necesita DTDs externos para su validación.
#### Ejemplo:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE persona SYSTEM "persona.dtd">
<persona>
  <nombre>Juan</nombre>
  <edad>30</edad>
</persona>
```
Y el archivo persona.dtd:
```dtd
<!ELEMENT persona (nombre, edad)>
<!ELEMENT nombre (#PCDATA)>
<!ELEMENT edad (#PCDATA)>
```

### Definición de elementos en DTD
La declaración de un elemento se realiza con `<!ELEMENT>`.

#### Sintaxis básica
```dtd
<!ELEMENT nombreElemento tipoContenido>
```

#### Tabla: Valores de tipoContenido en un elemento

| Valor         | Significado                                      |
|-------------- |--------------------------------------------------|
| EMPTY         | El elemento no puede tener contenido              |
| ANY           | Puede contener cualquier tipo de contenido        |
| (#PCDATA)     | Contenido textual (Parsed Character Data)         |
| (hijo1, hijo2)| Secuencia de elementos hijos                      |
| (hijo1 | hijo2) | Uno u otro elemento hijo (alternativa)         |
| (hijo1*)      | Cero o más repeticiones del elemento hijo         |
| (hijo1+)      | Una o más repeticiones del elemento hijo          |
| (hijo1?)      | Cero o una vez el elemento hijo                   |

### Ejemplos de definición de elementos
```dtd
<!ELEMENT libro (titulo, autor, anio)>
<!ELEMENT titulo (#PCDATA)>
<!ELEMENT autor (#PCDATA)>
<!ELEMENT anio (#PCDATA)>
```
En este ejemplo, el elemento `libro` debe contener los elementos hijos `titulo`, `autor` y `anio`, y el contenido de cada uno de estos elementos es texto (usando `#PCDATA`). No se definen atributos, solo la estructura y el tipo de contenido de los elementos.

Ejemplo de documento XML que cumple este DTD:
```xml
<libro>
  <titulo>Cien años de soledad</titulo>
  <autor>Gabriel García Márquez</autor>
  <anio>1967</anio>
</libro>
```

```dtd
<!ELEMENT lista (item*)>
<!ELEMENT item (#PCDATA)>
<!ELEMENT vacio EMPTY>
```
En este ejemplo:
- El elemento `lista` puede contener cero o más elementos `item` (`item*`).
- Cada `item` contiene texto.
- El elemento `vacio` no puede tener contenido (valor `EMPTY`).

Ejemplo de documento XML que cumple este DTD:
```xml
<lista>
  <item>Uno</item>
  <item>Dos</item>
  <item>Tres</item>
</lista>
<vacio/>
```

### Definición de atributos en DTD
La declaración de un atributo se realiza con `<!ATTLIST>`.

#### Sintaxis básica
```dtd
<!ATTLIST nombreElemento nombreAtributo tipoAtributo valorAtributo>
```

#### Tabla: Principales valores de tipoAtributo

| Valor      | Significado                                 |
|------------|---------------------------------------------|
| CDATA      | Cualquier cadena de caracteres              |
| ID         | Identificador único en el documento         |
| IDREF      | Referencia a un ID definido en el documento |
| IDREFS     | Lista de referencias a IDs                  |
| NMTOKEN    | Token válido como nombre                    |
| NMTOKENS   | Lista de tokens válidos                     |
| (v1|v2|v3) | Enumeración de valores permitidos           |

#### Tabla: Principales valores de valorAtributo

| Valor     | Significado                                  |
|-----------|----------------------------------------------|
| #REQUIRED | El atributo es obligatorio                   |
| #IMPLIED  | El atributo es opcional                      |
| #FIXED    | El atributo tiene un valor fijo              |
| "valor"   | Valor por defecto si no se especifica        |

### Ejemplos de definición de atributos
```dtd
<!ELEMENT libro (titulo, autor, anio)>
<!ATTLIST libro genero (novela|poesia|ensayo) "novela">
<!ELEMENT titulo (#PCDATA)>
<!ELEMENT autor (#PCDATA)>
<!ELEMENT anio (#PCDATA)>
```
En este ejemplo, el elemento `libro` tiene un atributo `genero` que puede tomar los valores "novela", "poesia" o "ensayo", y su valor por defecto es "novela".

Ejemplo de documento XML que cumple este DTD:
```xml
<libro genero="poesia">
  <titulo>Veinte poemas de amor y una canción desesperada</titulo>
  <autor>Pablo Neruda</autor>
  <anio>1924</anio>
</libro>
```
En este ejemplo, el atributo `genero` toma el valor "poesia", uno de los permitidos por el DTD. Si se omite el atributo, su valor por defecto sería "novela".

```dtd
<!ELEMENT usuario (#PCDATA)>
<!ATTLIST usuario
  id ID #REQUIRED
  ref IDREF #IMPLIED
  tipo (admin|editor|lector) #FIXED "lector"
  activo CDATA "si"
>
```
En este ejemplo:
- El atributo `id` es un identificador único y obligatorio (`ID #REQUIRED`).
- El atributo `ref` es una referencia opcional a otro identificador (`IDREF #IMPLIED`).
- El atributo `tipo` solo puede ser "admin", "editor" o "lector" y siempre tendrá el valor fijo "lector" (`#FIXED`).
- El atributo `activo` es de tipo texto y su valor por defecto es "si".


Ejemplo de documento XML que cumple este DTD:

```xml
<usuario id="u001" activo="no">María López</usuario>
<usuario id="u002" ref="u001">Juan Pérez</usuario>
```
En el primer usuario, el atributo `id` es obligatorio, `activo` toma el valor "no" (diferente del valor por defecto), y `tipo` es siempre "lector" (por ser #FIXED). En el segundo usuario, `ref` referencia a otro usuario y `activo` toma el valor por defecto "si".

:computer: Actividad 1 y Actividad 2

## XSD (XML Schema Definition)

### Referencias
- [W3Schools XSD Tutorial](https://www.w3schools.com/xml/schema_intro.asp)

### ¿Qué es un XSD?
Un XSD (XML Schema Definition) es un lenguaje basado en XML que permite definir la estructura, los tipos de datos y las restricciones de los elementos y atributos de un documento XML. Es más potente y flexible que DTD.
Mediante XSD podemos definir los siguientes aspectos de un documento XML:
* Los elementos y atributos que pueden aparecer en el documento XML.
* El número exacto y el orden en el que deben aparecer los elemento hijos de un elemento concreto.
* Los tipos de datos que contienen tanto los elementos finales como los atributos.
* Valores por defecto o fijos tanto para los elementos finales como para los atributos.

### ¿Cómo referenciar un XSD en un XML?
En el caso de los `XSD` son documentos siempre externos al propio documento XML, no como en los DTD que admitían la opción de ser declarados de forma interna. Sin embargo sí que disponemos de dos opciones diferentes a la hora de referenciar el documento.

#### Sin asociar a un espacio de nombres
Si no asociamos el XSD a un espacio de nombres concreto la definición de las cabeceras se reduce sensiblemente, pero aun así nos veremos obligados a incluir dentro del elemento raíz varios atributos, tanto en el `XML` como en el `XSD`. Dichos atributos son los siguientes:

**Dentro del `XML`:**

* __xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"__. Es obligatorio siempre que se valide contra un XSD.
* __xsi:noNamespaceSchemaLocation__. Indica la ubicación del archivo que contiene el `XSD`.
Por lo tanto la definición del primer elemento quedaría de la siguiente forma:

```xml
<elementoRaiz
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ArchivoXSD">

```
#### Ejemplo XML:
```xml
<persona xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:noNamespaceSchemaLocation="persona.xsd">
  <nombre>Juan</nombre>
  <edad>30</edad>
</persona>
```

**Dentro del `XSD`:**

* __xmlns:xs="http://www.w3.org/2001/XMLSchema"__. Es obligatorio en todo documento XSD. (En alguna documentación podéis encontrar que se utilizar el prefijo “xsd” en lugar de “xs”, lo único importante es que se utilice el mismo en todo el documento XSD).
Por lo tanto la definición del elemento “schema” (que es siempre el primer elemento en todo documento XSD) quedaría de la siguiente forma:

```xsd
<xs:schema
xmlns:xs="http://www.w3.org/2001/XMLSchema">
```
#### Ejemplo de XSD (persona.xsd) que valida el XML anterior:
```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="persona">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="nombre" type="xs:string"/>
        <xs:element name="edad" type="xs:integer"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>
```

#### Asociado a un espacio de nombres
Si asociamos el `XSD` a un espacio de nombres concreto nos veremos obligados a incluir dentro del elemento raíz varios atributos,
tanto en el `XML` como en el `XSD`. Dichos atributos son los siguientes:

**Dentro del `XML`:**
* __xmlns__. Especifica cual será el espacio de nombres por defecto.
* __xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"__. Es obligatorio siempre que se valide contra un XSD.
* __xsi:schemaLocation__. Define dos cosas (ambos valores deben estar separados por un espacio en blanco), el espacio de nombres por defecto usado y la ubicación del archivo que contiene el XSD.

Por lo tanto la definición del primer elemento quedaría de la siguiente forma:

```xml
<elementoRaiz
xmlns="EspacioDeNombresPorDefecto"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="EspacioDeNombresPorDefecto ArchivoXSD">
```
#### Ejemplo XML

```xml
<persona xmlns="http://ejemplo.com/persona"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://ejemplo.com/persona persona.xsd">
  <nombre>Juan</nombre>
  <edad>30</edad>
</persona>
```

**Dentro del `XSD`:**

* __xmlns:xs="http://www.w3.org/2001/XMLSchema"__. Es obligatorio en todo documento XSD. (En alguna documentación podéis encontrar que se utilizar el prefijo “xsd” en lugar de “xs”, lo único importante es que se utilice el mismo en todo el documento XSD).
* __targetNamespace__. Es donde se indica el espacio de nombres definido para este esquema. Se puede usar el de por defecto.
* __xmlns__. Es donde se indica el espacio de nombres por defecto usado.
* __elementFormDefault="qualified"__. Indica que todos los elementos usados por el XMl que se declararon en este esquema deben estar calificados para el espacio de nombres.

Por lo tanto la definición del elemento **“schema”** (que es siempre el primer elemento en todo documento XSD) quedaría de la siguiente forma:

```xsd
<xs:schema
xmlns:xs="http://www.w3.org/2001/XMLSchema"
targetNamespace="EspacioDeNombresDefinidoParaElEsquema"
xmlns="EspacioDeNombresPorDefecto"
elementFormDefault="qualified">
```
#### Ejemplo de XSD (persona.xsd) que valida el XML anterior con espacio de nombres:

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
           targetNamespace="http://ejemplo.com/persona"
           xmlns="http://ejemplo.com/persona"
           elementFormDefault="qualified">
  <xs:element name="persona">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="nombre" type="xs:string"/>
        <xs:element name="edad" type="xs:integer"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>
```

### Definición de elementos simples
Los elemento simples (o finales) son aquellos que solo contienen datos en el XML

```xml
<xs:element name="nombre" type="xs:string"/>
<xs:element name="edad" type="xs:integer"/>
```

### Definición de elementos complejos
Se entiende por elemento complejo a todo aquel elemento de un documento XML que cumple alguna de las siguientes características:
* __El elemento tiene algún atributo__, independientemente de si es un elemento vacío o además contiene texto.
* __El elemento contiene a otros elementos__, independientemente de si tiene o no atributos.

```xml
<xs:element name="persona">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="nombre" type="xs:string"/>
      <xs:element name="edad" type="xs:integer"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

Este fragmento define un elemento complejo llamado `persona` que debe contener, en orden, los elementos hijo `nombre` (texto) y `edad` (entero). Valida un XML como:

```xml
<persona>
  <nombre>Juan</nombre>
  <edad>30</edad>
</persona>
```

### Definición de atributos
*Los atributos* solo pueden pertenecer a `elementos complejos`, ya que la mera presencia de un atributo convierte al elemento en complejo.

A la hora de declarar los atributos hay que tener en cuenta que es muy importante la posición de la declaración dentro del elemento complejo. Los atributos hay que declararlos siempre al final, es decir, antes de cerrar el `complexType` y fuera del `sequence` en el caso de los elementos que contengan a otros elementos.

```xml
<xs:element name="libro">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="titulo" type="xs:string"/>
      <xs:element name="autor" type="xs:string"/>
      <xs:element name="anio" type="xs:integer"/>
    </xs:sequence>
    <xs:attribute name="genero" type="xs:string" default="novela"/>
  </xs:complexType>
</xs:element>
```

### Tipos de datos
XSD define tipos de datos simples (string, integer, date, boolean, etc.) y permite crear tipos personalizados.

| Tipo XSD      | Descripción                |
|---------------|---------------------------|
| xs:string     | Cadena de texto           |
| xs:integer    | Número entero             |
| xs:decimal    | Número decimal            |
| xs:boolean    | Valor verdadero/falso     |
| xs:date       | Fecha (YYYY-MM-DD)        |
| xs:time       | Hora (hh:mm:ss)           |
| xs:ID         | Identificador único       |
| xs:IDREF      | Referencia a un ID        |

### Restricciones sobre los datos
Se pueden establecer restricciones usando <xs:restriction>.

| Restricción           | Descripción                                         |
|---------------------- |-----------------------------------------------------|
| minInclusive          | Valor mínimo permitido (incluido)                   |
| maxInclusive          | Valor máximo permitido (incluido)                   |
| minExclusive          | Valor mínimo permitido (excluido)                   |
| maxExclusive          | Valor máximo permitido (excluido)                   |
| length                | Longitud exacta permitida para cadenas              |
| minLength             | Longitud mínima permitida para cadenas              |
| maxLength             | Longitud máxima permitida para cadenas              |
| pattern               | Expresión regular que debe cumplir el valor         |
| enumeration           | Lista de valores permitidos                         |
| whiteSpace            | Cómo tratar los espacios en blanco                  |
| totalDigits           | Número total de dígitos permitidos (números)        |
| fractionDigits        | Número de dígitos decimales permitidos (números)    |

```xml
<xs:element name="edad">
  <xs:simpleType>
    <xs:restriction base="xs:integer">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="120"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>

```
Este fragmento define el elemento `edad` como un número entero que solo puede tomar valores entre 0 y 120, ambos incluidos. Así, cualquier valor fuera de ese rango no será válido según el esquema XSD.

### Otras reglas y estructuras en XSD

#### Orden de elementos: sequence y all
- `<xs:sequence>`: Los elementos deben aparecer en el orden definido.
- `<xs:all>`: Los elementos pueden aparecer en cualquier orden, pero solo una vez cada uno.

Ejemplo con sequence:
```xml
<xs:complexType>
  <xs:sequence>
    <xs:element name="nombre" type="xs:string"/>
    <xs:element name="edad" type="xs:integer"/>
  </xs:sequence>
</xs:complexType>

```
Este fragmento define un tipo complejo (complexType) que contiene dos elementos hijos: `nombre` (de tipo texto) y `edad` (de tipo entero). El uso de `<xs:sequence>` indica que ambos elementos deben aparecer en ese orden dentro del elemento que use este tipo.

Ejemplo con all:
```xml
<xs:complexType>
  <xs:all>
    <xs:element name="nombre" type="xs:string"/>
    <xs:element name="edad" type="xs:integer"/>
  </xs:all>
</xs:complexType>
```
Este fragmento define un tipo complejo (`complexType`) que contiene dos elementos hijos: `nombre` (de tipo texto) y `edad` (de tipo entero). El uso de `<xs:all>` indica que ambos elementos deben aparecer una sola vez cada uno, pero pueden aparecer en cualquier orden dentro del elemento que use este tipo. Es decir, tanto `<nombre><edad></edad></nombre>` como `<edad><nombre></nombre></edad>` serían válidos.

#### Crear nuevos tipos de datos: complexType y simpleType
- `<xs:complexType>`: Define un tipo de dato que puede tener elementos y/o atributos.
- `<xs:simpleType>`: Define un tipo de dato basado en un tipo simple, con posibles restricciones.

Ejemplo de complexType:
```xml
<xs:complexType name="PersonaType">
  <xs:sequence>
    <xs:element name="nombre" type="xs:string"/>
    <xs:element name="edad" type="xs:integer"/>
  </xs:sequence>
</xs:complexType>
```
Este fragmento define un nuevo tipo complejo llamado `PersonaType`. Este tipo está compuesto por dos elementos: `nombre` (de tipo texto) y `edad` (de tipo entero). El uso de `<xs:sequence>` indica que, cuando se utilice este tipo en un elemento, los elementos `nombre` y `edad` deben aparecer en ese orden exacto. Este tipo puede ser reutilizado para definir elementos que representen personas en el esquema XSD.

Ejemplo de simpleType:
```xml
<xs:simpleType name="EdadLimitada">
  <xs:restriction base="xs:integer">
    <xs:minInclusive value="0"/>
    <xs:maxInclusive value="120"/>
  </xs:restriction>
</xs:simpleType>
```
Este fragmento define un nuevo tipo de dato simple llamado `EdadLimitada`. Está basado en el tipo entero (`xs:integer`), pero restringido para que solo acepte valores entre 0 y 120, ambos incluidos. Así, cualquier elemento o atributo que use este tipo solo podrá tener valores dentro de ese rango, lo que permite controlar y validar automáticamente los datos en el XML.

#### Crear nuevos tipos de contenido: complexContent y simpleContent
- `<xs:complexContent>`: Permite derivar tipos complejos a partir de otros tipos complejos, añadiendo o restringiendo elementos o atributos.
- `<xs:simpleContent>`: Permite derivar tipos complejos a partir de tipos simples, añadiendo atributos.

Ejemplo de complexContent (extensión):
```xml
<xs:complexType name="EmpleadoType">
  <xs:complexContent>
    <xs:extension base="PersonaType">
      <xs:sequence>
        <xs:element name="departamento" type="xs:string"/>
      </xs:sequence>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
```
Este fragmento define un nuevo tipo complejo llamado `EmpleadoType` que extiende el tipo `PersonaType`. Utilizando `<xs:complexContent>` y `<xs:extension>`, se heredan todos los elementos de `PersonaType` (por ejemplo, `nombre` y `edad`) y se añade un nuevo elemento llamado `departamento` (de tipo texto). Así, cualquier elemento que use `EmpleadoType` tendrá los campos de persona más el campo adicional de departamento. Esto permite reutilizar y ampliar estructuras de datos en XSD de forma ordenada y jerárquica.

Ejemplo de simpleContent (extensión):
```xml
<xs:complexType name="PrecioType">
  <xs:simpleContent>
    <xs:extension base="xs:decimal">
      <xs:attribute name="moneda" type="xs:string"/>
    </xs:extension>
  </xs:simpleContent>
</xs:complexType>
```
Este fragmento define un tipo complejo llamado `PrecioType` que utiliza `<xs:simpleContent>` para extender un tipo simple (`xs:decimal`). Esto significa que el elemento que use este tipo contendrá un valor decimal (por ejemplo, un precio) y, además, podrá tener un atributo adicional llamado `moneda` (de tipo texto, como "EUR" o "USD"). Es útil para representar datos que son principalmente un valor simple pero requieren información adicional mediante atributos.

#### Restricciones y extensiones de datos
- `<xs:restriction>`: Restringe un tipo de dato existente (por ejemplo, limitar el rango de valores).
- `<xs:extension>`: Extiende un tipo de dato existente añadiendo elementos o atributos.

Ejemplo de restricción:
```xml
<xs:simpleType name="CodigoPostal">
  <xs:restriction base="xs:string">
    <xs:pattern value="[0-9]{5}"/>
  </xs:restriction>
</xs:simpleType>
```
Este fragmento define un tipo de dato simple llamado `CodigoPostal`, basado en cadenas de texto (`xs:string`). Utiliza una restricción de patrón (`<xs:pattern>`) para que solo sean válidos los valores que consistan exactamente en 5 dígitos numéricos (del 0 al 9). Así, solo se aceptarán códigos postales con ese formato, como "28013" o "12345".

Ejemplo de extensión:
```xml
<xs:complexType name="ProductoType">
  <xs:complexContent>
    <xs:extension base="xs:string">
      <xs:attribute name="codigo" type="xs:string"/>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
```
Este fragmento define un tipo complejo llamado `ProductoType` que extiende el tipo simple `xs:string` (una cadena de texto). Gracias a `<xs:complexContent>` y `<xs:extension>`, permite que el elemento que use este tipo contenga un valor textual y, además, tenga un atributo adicional llamado `codigo` (también de tipo texto). Es útil para representar, por ejemplo, un nombre de producto junto con un código identificador como atributo.

### Referencias especiales y XSD índices
- **Referencias:** Se pueden usar atributos de tipo xs:ID y xs:IDREF para relacionar elementos.
- **Índices:** XSD permite definir claves y referencias con <xs:key>, <xs:keyref> y <xs:unique>.

#### Ejemplo de claves e índices
```xml
<xs:element name="biblioteca">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="libro" maxOccurs="unbounded">
        <xs:complexType>
          <xs:attribute name="id" type="xs:ID" use="required"/>
          <xs:attribute name="titulo" type="xs:string" use="required"/>
        </xs:complexType>
      </xs:element>
      <xs:element name="prestamo" maxOccurs="unbounded">
        <xs:complexType>
          <xs:attribute name="libroId" type="xs:IDREF" use="required"/>
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
  <xs:key name="claveLibro">
    <xs:selector xpath="libro"/>
    <xs:field xpath="@id"/>
  </xs:key>
  <xs:keyref name="refLibro" refer="claveLibro">
    <xs:selector xpath="prestamo"/>
    <xs:field xpath="@libroId"/>
  </xs:keyref>
</xs:element>
```
Este fragmento define la estructura de una biblioteca:
- El elemento `biblioteca` puede contener muchos elementos `libro` y muchos elementos `prestamo`.
- Cada `libro` tiene dos atributos obligatorios: `id` (identificador único, tipo xs:ID) y `titulo` (texto).
- Cada `prestamo` tiene un atributo obligatorio `libroId` (referencia a un id de libro, tipo xs:IDREF).
- `<xs:key>` define que el atributo `id` de cada `libro` debe ser único dentro de la biblioteca (clave primaria).
- `<xs:keyref>` define que el atributo `libroId` de cada `prestamo` debe corresponder a un `id` existente en algún `libro` (clave foránea o referencia).
Así, se garantiza la integridad referencial entre los préstamos y los libros.

:computer: Actividad 3 y Actividad 4

### Herramientas de validación
  - **XMLLINT**: Tipo: Software gratuito (open source)  
    - Página web: https://xmlsoft.org/xmllint.html
  - **Oxygen**: Tipo: Software de pago (requiere licencia)  
    - Página web: https://www.oxygenxml.com/
  - **XMLSPY**: Tipo: Software de pago (requiere licencia)  
    - Página web: https://www.altova.com/xmlspy
  - **Validadores ONLINE**: Tipo: Gratuitos (la mayoría)  
    - Ejemplo: https://www.freeformatter.com/xml-validator-xsd.html
  - **Validador W3C**: Tipo: Gratuito (estándar oficial)  
    - Página web: https://validator.w3.org/
  - **Visual studio code**:  Utiliza la extensión `XML de Red Hat`, que valida XML y XSD directamente en el editor sin instalar programas externos.

#### Ejemplo de validación con xmllint
```bash
xmllint --noout --schema persona.xsd persona.xml
```

## Conclusión
Definir esquemas y vocabularios XML es esencial para asegurar la calidad, interoperabilidad y validez de los documentos en el intercambio de información entre sistemas.

