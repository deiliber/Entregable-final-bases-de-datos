# Entregable-final-bases-de-datos
# 🐾 PROYECTO: AVISTAMIENTO DE ANIMALES

## 📋 Descripción Técnica de la Base de Datos
La base de datos **AvistamientoDeAnimales** tiene como objetivo almacenar, organizar y consultar información detallada sobre diferentes especies de animales, sus tipos, alimentación, hábitats, características físicas y estados de conservación.

> 🛠️ **Información Técnica Clave:**
> * **Motor de Base de Datos:** Microsoft SQL Server
> * **Nombre de la Base de Datos:** `AvistamientoDeAnimales`
> * **Lenguaje Utilizado:** SQL
> * **Cantidad de Tablas:** 8
> * **Procedimientos Almacenados:** 2

La base de datos está estructurada de forma relacional mediante llaves primarias (`PRIMARY KEY`) y llaves foráneas (`FOREIGN KEY`). Adicionalmente, incluye registros de prueba, consultas de extracción de datos y procedimientos almacenados funcionales.

---

## 📖 Diccionario de Datos

A continuación se detalla la estructura, campos y tipos de datos de las ocho (8) tablas del sistema.

### 2.1. Tabla `tipoanimal`
*Almacena las clasificaciones o tipos generales de animales.*

| Campo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| **id_tipo** 🔑 | `INT` | Identificador único del tipo de animal (Primary Key). |
| nombre | `VARCHAR(30)` | Nombre de la categoría o tipo de animal. |

### 2.2. Tabla `alimentacion`
*Almacena los diferentes regímenes alimenticios.*

| Campo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| **id_alimentacion** 🔑 | `INT` | Identificador único del tipo de alimentación (Primary Key). |
| nombre | `VARCHAR(30)` | Nombre del tipo de alimentación (ej. Herbívoro, Carnívoro). |

### 2.3. Tabla `Habitad`
*Almacena los diferentes entornos o hábitats naturales.*

| Campo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| **id_habitad** 🔑 | `INT` | Identificador único del hábitat (Primary Key). |
| nombre | `VARCHAR(30)` | Nombre del ecosistema o hábitat. |

### 2.4. Tabla `Caracteristicas`
*Almacena rasgos físicos y comportamientos particulares.*

| Campo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| **id_caracteristica** 🔑 | `INT` | Identificador único de la característica (Primary Key). |
| descripcion | `VARCHAR(200)` | Detalle de la característica física o conductual. |

### 2.5. Tabla `EstadoConservacion`
*Registra las categorías de amenaza o estado de conservación mundial.*

| Campo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| **id_estado** 🔑 | `INT` | Identificador único del estado de conservación (Primary Key). |
| nombre | `VARCHAR(50)` | Nombre oficial del estado (ej. En peligro crítico, Preocupación menor). |

### 2.6. Tabla `Especie`
*Tabla principal que consolida el registro central de los animales.*

| Campo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| **id_especie** 🔑 | `INT` | Identificador único de la especie (Primary Key). |
| nombre | `VARCHAR(50)` | Nombre común o científico de la especie. |
| id_tipo 🔗 | `INT` | Relación con el tipo de animal (Foreign Key). |
| id_alimentacion 🔗 | `INT` | Relación con el tipo de alimentación (Foreign Key). |
| id_estado 🔗 | `INT` | Relación con su estado de conservación (Foreign Key). |
| fecha_registro | `DATE` | Fecha en la que se ingresó la especie al sistema. |
| observaciones | `VARCHAR(70)` | Notas adicionales sobre el animal. |

### 2.7. Tabla `EspecieHabitat`
*Tabla intermedia que gestiona la relación de muchos a muchos entre Especies y Hábitats.*

| Campo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| **id_especie** 🔑🔗 | `INT` | Identificador de la especie (Parte de la PK compuesta / FK). |
| **id_habitad** 🔑🔗 | `INT` | Identificador del hábitat (Parte de la PK compuesta / FK). |

### 2.8. Tabla `EspecieCaracteristica`
*Tabla intermedia que gestiona la relación de muchos a muchos entre Especies y Características.*

| Campo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| **id_especie** 🔑🔗 | `INT` | Identificador de la especie (Parte de la PK compuesta / FK). |
| **id_caracteristica** 🔑🔗 | `INT` | Identificador de la característica (Parte de la PK compuesta / FK). |

---

## 🔗 Explicación de las Relaciones

El ecosistema de datos mantiene su integridad gracias a los siguientes vínculos:

* **`tipoanimal` ➡️ `Especie`**: Relación de uno a muchos mediante el campo `id_tipo`. Un tipo de animal abarca múltiples especies.
* **`alimentacion` ➡️ `Especie`**: Relación de uno a muchos mapeada mediante `id_alimentacion`.
* **`EstadoConservacion` ➡️ `Especie`**: Relación de uno a muchos asociada a través de `id_estado`.
* **`Especie` 🔄 `Habitad`**: Relación de muchos a muchos resuelta mediante la tabla pivote `EspecieHabitat`.
* **`Especie` 🔄 `Caracteristicas`**: Relación de muchos a muchos resuelta mediante la tabla pivote `EspecieCaracteristica`.

*Nota: Las tablas relacionales compuestas utilizan claves primarias duplicadas/compuestas para blindar la unicidad de los registros.*

---

## ⚙️ Procedimientos Almacenados (Stored Procedures)

Para optimizar y encapsular las consultas frecuentes dentro del servidor de SQL Server, se desarrollaron:

1. 📥 **`usp_InsertarEspecie`**: Automatiza la inserción segura de nuevas especies en la base de datos solicitando parámetros obligatorios como nombre, tipo, alimentación y estado.
2. 📊 **`usp_TotalEspecies`**: Consulta dinámica que computa y retorna en tiempo real la cantidad total de especies registradas en la tabla principal.

---

## 🔄 Integración Modular (Nivel 1)

Actualmente, el proyecto se encuentra en **Nivel 1**, lo que significa que los submódulos están alineados conceptualmente pero trabajarán su conexión técnica en fases posteriores:

* **Submódulo de Clases (Backend):** Modela la lógica del negocio. La clase `Especie` replica los atributos exactos definidos en la tabla `Especie` (`nombre`, `id_tipo`, etc.).
* **Submódulo Frontend (Interfaz Visual):** Diseña las vistas donde el usuario interactuará con las tarjetas, filtros de búsqueda y listados basados en la estructura analizada de la base de datos.
* **Base de Datos:** Centraliza el almacenamiento permanente de la información que fluye entre las clases y la interfaz de usuario.
