# Entregable-final-bases-de-datos
PROYECTO: AVISTAMIENTO DE ANIMALES

1. Descripción técnica de la base de datos

La base de datos AvistamientoDeAnimales tiene como objetivo almacenar, organizar y consultar información sobre diferentes especies de animales, sus tipos, alimentación, hábitats, características y estados de conservación.

Información técnica:

Motor de base de datos: Microsoft SQL Server.

Nombre de la base de datos: AvistamientoDeAnimales.

Cantidad de tablas: 8.

Lenguaje utilizado: SQL.

Procedimientos almacenados: 2.

La base de datos está organizada mediante tablas relacionadas entre sí por medio de llaves primarias (PRIMARY KEY) y llaves foráneas (FOREIGN KEY).

También cuenta con registros de ejemplo, consultas para obtener información y procedimientos almacenados para insertar especies y consultar el total de especies registradas.

2. Diccionario de datos básico

A continuación, se describen las ocho tablas que componen la base de datos y la función de cada una.

2.1. Tabla tipoanimal

Almacena los diferentes tipos de animales.

Campo

Tipo de dato

Descripción

id_tipo

INT

Identificador del tipo de animal.

nombre

VARCHAR(30)

Nombre del tipo de animal.

2.2. Tabla alimentacion

Almacena los diferentes tipos de alimentación de los animales.

Campo

Tipo de dato

Descripción

id_alimentacion

INT

Identificador de alimentación.

nombre

VARCHAR(30)

Nombre de la alimentación.

2.3. Tabla Habitad

Almacena los diferentes hábitats donde pueden vivir las especies.

Campo

Tipo de dato

Descripción

id_habitad

INT

Identificador del hábitat.

nombre

VARCHAR(30)

Nombre del hábitat.

2.4. Tabla Caracteristicas

Almacena las características físicas y comportamentales de los animales.

Campo

Tipo de dato

Descripción

id_caracteristica

INT

Identificador de la característica.

descripcion

VARCHAR(200)

Descripción de la característica.

2.5. Tabla EstadoConservacion

Almacena los diferentes estados de conservación de las especies.

Campo

Tipo de dato

Descripción

id_estado

INT

Identificador del estado.

nombre

VARCHAR(50)

Nombre del estado de conservación.

2.6. Tabla Especie

Es la tabla principal de la base de datos. Almacena la información de las especies registradas.

Campo

Tipo de dato

Descripción

id_especie

INT

Identificador de la especie.

nombre

VARCHAR(50)

Nombre de la especie.

id_tipo

INT

Identificador del tipo de animal.

id_alimentacion

INT

Identificador de alimentación.

id_estado

INT

Identificador del estado de conservación.

fecha_registro

DATE

Fecha de registro de la especie.

observaciones

VARCHAR(70)

Información adicional de la especie.

2.7. Tabla EspecieHabitat

Permite relacionar las especies con sus diferentes hábitats.

Campo

Tipo de dato

Descripción

id_especie

INT

Identificador de la especie.

id_habitad

INT

Identificador del hábitat.

2.8. Tabla EspecieCaracteristica

Permite relacionar las especies con sus características.

Campo

Tipo de dato

Descripción

id_especie

INT

Identificador de la especie.

id_caracteristica

INT

Identificador de la característica.

3. Explicación de las relaciones

La base de datos utiliza relaciones para conectar la información de las diferentes tablas.

tipoanimal - Especie: un tipo de animal puede tener varias especies registradas. La relación se realiza mediante el campo id_tipo.

alimentacion - Especie: una alimentación puede estar asociada con diferentes especies mediante id_alimentacion.

EstadoConservacion - Especie: un estado de conservación puede estar relacionado con diferentes especies mediante id_estado.

Especie - Habitad: estas tablas se relacionan mediante EspecieHabitat, permitiendo asociar diferentes especies con diferentes hábitats.

Especie - Caracteristicas: estas tablas se relacionan mediante EspecieCaracteristica, permitiendo asociar diferentes características a las especies.

Las relaciones se establecen mediante llaves primarias y foráneas. Las tablas EspecieHabitat y EspecieCaracteristica utilizan llaves primarias compuestas para identificar las relaciones entre sus registros.

4. Integración con los otros submódulos

El proyecto AvistamientoDeAnimales está compuesto por diferentes submódulos que trabajan con un mismo objetivo: desarrollar una aplicación relacionada con el registro y consulta de información sobre especies animales.

Como el proyecto se encuentra en el Nivel 1, los submódulos están relacionados conceptualmente, pero todavía no están conectados técnicamente.

Relación con el submódulo de clases

Las clases representan los elementos principales del proyecto. Por ejemplo, una clase Especie puede representar la información almacenada en la tabla Especie, utilizando atributos como nombre, tipo de animal, alimentación y estado de conservación.

De esta manera, las clases y las tablas comparten información y representan los mismos elementos del sistema, aunque todavía no existe una conexión directa entre ellas.

Relación con el submódulo de Frontend

El frontend representa la parte visual de la aplicación, donde los usuarios pueden consultar y visualizar la información de las especies.

Las vistas pueden mostrar información como el nombre del animal, su alimentación, hábitat, características y estado de conservación.

La información que se muestra en estas vistas corresponde a los datos que se encuentran organizados en la base de datos.

Relación general entre los submódulos

Los tres submódulos cumplen funciones diferentes, pero se complementan entre sí:

Base de datos: almacena y organiza la información de las especies.

Clases: representan los elementos y la información que utiliza el sistema.

Frontend: permite que los usuarios interactúen con la aplicación y visualicen la información.

Aunque actualmente no existe una conexión técnica entre los submódulos, sus estructuras están relacionadas y pueden integrarse posteriormente para formar una aplicación completa.

5. Procedimientos almacenados

La base de datos cuenta con dos procedimientos almacenados:

usp_InsertarEspecie: permite registrar una nueva especie mediante parámetros de entrada como el nombre, el tipo de animal, la alimentación y el estado de conservación.

usp_TotalEspecies: permite consultar la cantidad total de especies registradas en la tabla Especie.

Estos procedimientos facilitan la ejecución de operaciones dentro de la base de datos.

Nombre del proyecto: AvistamientoDeAnimales.

Motor: Microsoft SQL Server.

Total de tablas: 8.

Total de procedimientos almacenados: 2.
