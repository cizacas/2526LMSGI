# EXPRESIONES REGULARES

## Índice
- [EXPRESIONES REGULARES](#expresiones-regulares)
  - [Índice](#índice)
  - [Introducción](#introducción)
  - [Crear expresiones regulares](#crear-expresiones-regulares)
    - [Cuantificadores para una expresión regular](#cuantificadores-para-una-expresión-regular)
    - [Metacaracteres en una expresión regular](#metacaracteres-en-una-expresión-regular)
    - [Ejemplos de expresiones regulares](#ejemplos-de-expresiones-regulares)
  - [Uso en XSD (XML Schema)](#uso-en-xsd-xml-schema)
    - [La etiqueta xs:pattern](#la-etiqueta-xspattern)
    - [Ejemplos de patrones en XSD](#ejemplos-de-patrones-en-xsd)
      - [1. DNI español (8 dígitos y una letra mayúscula)](#1-dni-español-8-dígitos-y-una-letra-mayúscula)
      - [2. Teléfono español de 9 dígitos empezando por 6, 7, 8 o 9](#2-teléfono-español-de-9-dígitos-empezando-por-6-7-8-o-9)
      - [3. Matrícula española formato antiguo (NNNN LLL)](#3-matrícula-española-formato-antiguo-nnnn-lll)
      - [4. Código de producto con letras y números](#4-código-de-producto-con-letras-y-números)
      - [5. Varios patrones (AND lógico)](#5-varios-patrones-and-lógico)

## Introducción 

Las expresiones regulares son un gran aliado a la hora de buscar y reemplazar contenido textual que simplifica enormemente la búsqueda y sustitución de términos variables.

¿Qué es una expresión regular?

Podemos definir una expresión regular como una secuencia de carácteres que forman una __secuencia o patrón__ que puede ser automatizada de alguna manera.

Por ejemplo, dentro de un texto queremos eliminar todas las palabras que sean «la» podemos usar un patrón para eliminarlas. Una expresión regular nos va a permitir buscar o reemplazar una secuencia. 

En el contexto de XSD (XML Schema), las expresiones regulares se utilizan sobre todo para **restringir el contenido de tipos simples**, es decir, para validar que el valor de un elemento o atributo **sigue un formato concreto** (DNI, código postal, teléfono, matrículas, etc.).


## Crear expresiones regulares
Para crear una expresión regular haremos uso de los cuantificadores y metacaracteres. 

### Cuantificadores para una expresión regular

Tenemos caracteres especiales que nos van a indicar el número de repeticiones de la expresión, la siguiente tabla muestra los caracteres: 

| Cuantificador | Descripción | 
| ------------- | ------------- |
|n+|Encuentra cualquier string con al menos un «n»|
|n*|Encuentra cero o más ocurrencias de n|
|n?|Encuentra en el string la aparición de n cero o una vez|
|n{x}|Encuentra la secuencia de n tantas veces como indica x|
|n{x,}|Encuentra una secuencia de X tantas veces como indica n|

### Metacaracteres en una expresión regular

| Metacaracter | Descripción | 
| ------------- | ------------- |
|\||símbolo para indicar OR|
|.|Encuentra cualquier carácter|
|^|Sirve para hacer match al principio de la cadena|
|$|Hace match al final de una cadena|
|\d|Encuentra dígitos|
|\s|Busca un espacio|
|\b|Hace match al principio de una palabra|
|\uxxxx|Encuentra el carácter Unicode especificado por el número hexadecimal xxxx|

### Ejemplos de expresiones regulares

| Metacaracter | Descripción |
| ------------- | ------------- |
|[abc]|Establece la definición de la expresión, por ejemplo, la expresión escrita haría match con a, b o c|
|[abc][vz]|Establece una definición en la se hace match con a, b o c y a continuación va seguido por v o por z|
|[^abc]|Cuando el símbolo ^aparece al principio de una expresión después de [, niega el patrón definido. En este caso hace match para todo menos para la a, la b o la c|
|[e-f]|Cuando hacemos uso de -, definimos rangos. En este caso buscamos hacer match de una letra entre la e y la f|
|Y\|X|Establece un OR, encuentra la Y o la X|
|HO|Encuentra HO|

## Uso en XSD (XML Schema)

En XML Schema (XSD) se usan expresiones regulares para **validar el contenido textual** de elementos y atributos mediante restricciones sobre tipos simples.

La idea básica es:

- Definimos un `xs:simpleType` basado en un tipo simple (normalmente `xs:string`).
- Añadimos una restricción (`xs:restriction`).
- Dentro de esa restricción usamos una o varias etiquetas `xs:pattern` para indicar la **expresión regular** que debe cumplir el valor.

### La etiqueta xs:pattern

Estructura típica:

```xml
<xs:simpleType name="NombreTipo">
  <xs:restriction base="xs:string">
    <xs:pattern value="expresion_regular"/>
  </xs:restriction>
  </xs:simpleType>
```

Puntos importantes:

- El atributo `value` contiene la expresión regular.
- Se suele usar `^` y `$` para indicar que **toda la cadena** debe cumplir el patrón.
- Podemos definir el tipo por nombre (`name="NombreTipo"`) y luego reutilizarlo en varios elementos/atributos.

Uso dentro de un elemento sin nombre de tipo:

```xml
<xs:element name="codigoPostal">
  <xs:simpleType>
    <xs:restriction base="xs:string">
      <xs:pattern value="^[0-9]{5}$"/>
    </xs:restriction>
  </xs:simpleType>
</xs:element>
```

En este ejemplo, `codigoPostal` **debe tener exactamente 5 dígitos**.

> Nota: dentro del XML hay que respetar las reglas de escape de atributos (por ejemplo, si se usan comillas dobles fuera, no se pueden usar sin escapar dentro de la expresión).

### Ejemplos de patrones en XSD

#### 1. DNI español (8 dígitos y una letra mayúscula)

```xml
<xs:simpleType name="TipoDNI">
  <xs:restriction base="xs:string">
    <xs:pattern value="^[0-9]{8}[A-Z]$"/>
  </xs:restriction>
</xs:simpleType>

<xs:element name="dni" type="TipoDNI"/>
```

- `[0-9]{8}`: exactamente 8 dígitos.
- `[A-Z]`: una letra mayúscula.

#### 2. Teléfono español de 9 dígitos empezando por 6, 7, 8 o 9

```xml
<xs:simpleType name="TipoTelefono">
  <xs:restriction base="xs:string">
    <xs:pattern value="^[6789][0-9]{8}$"/>
  </xs:restriction>
</xs:simpleType>
```

- `^[6789]`: la cadena empieza por 6, 7, 8 o 9.
- `[0-9]{8}`: le siguen 8 dígitos más (total 9).

#### 3. Matrícula española formato antiguo (NNNN LLL)

```xml
<xs:simpleType name="TipoMatriculaAntigua">
  <xs:restriction base="xs:string">
    <xs:pattern value="^[0-9]{4}\s[A-Z]{3}$"/>
  </xs:restriction>
</xs:simpleType>
```

- `[0-9]{4}`: cuatro dígitos.
- `\s`: un espacio en blanco.
- `[A-Z]{3}`: tres letras mayúsculas.

#### 4. Código de producto con letras y números

Ejemplo de código tipo `PROD-2026-A1`:

```xml
<xs:simpleType name="TipoCodigoProducto">
  <xs:restriction base="xs:string">
    <xs:pattern value="^PROD-[0-9]{4}-[A-Z][0-9]$"/>
  </xs:restriction>
</xs:simpleType>
```

- Empieza por `PROD-`.
- Año de 4 cifras: `[0-9]{4}`.
- Un guion `-`.
- Una letra mayúscula `[A-Z]` y un dígito `[0-9]`.

#### 5. Varios patrones (AND lógico)

Se pueden definir **varios patrones** dentro de la misma restricción. El valor será válido **solo si cumple todos** (se comporta como un AND):

```xml
<xs:simpleType name="TipoCodigoSeguro">
  <xs:restriction base="xs:string">
    <!-- Longitud exactamente 10 caracteres -->
    <xs:pattern value="^.{10}$"/>
    <!-- Solo mayúsculas y dígitos -->
    <xs:pattern value="^[A-Z0-9]+$"/>
  </xs:restriction>
</xs:simpleType>
```

En este caso:

- Primer patrón: obliga a que la longitud sea 10.
- Segundo patrón: obliga a que solo haya letras mayúsculas y dígitos.

De esta forma, combinando expresiones regulares con `xs:pattern`, XSD permite construir **validaciones muy precisas** sobre el contenido textual de los documentos XML.
