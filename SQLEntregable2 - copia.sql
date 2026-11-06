CREATE DATABASE AvistamientoDeAnimales;

USE AvistamientoDeAnimales;

CREATE TABLE tipoanimal (
    id_tipo INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE alimentacion (
    id_alimentacion INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Habitad (
    id_habitad INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Caracteristicas (
    id_caracteristica INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE EstadoConservacion (
    id_estado INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Especie (
    id_especie INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL UNIQUE,
    id_tipo INT NOT NULL,
    id_alimentacion INT NOT NULL,
    id_estado INT NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT GETDATE(),

    FOREIGN KEY (id_tipo) REFERENCES tipoanimal(id_tipo),
    FOREIGN KEY (id_alimentacion)
        REFERENCES alimentacion(id_alimentacion),
    FOREIGN KEY (id_estado)
        REFERENCES EstadoConservacion(id_estado)
);

CREATE TABLE EspecieHabitat (
    id_especie INT NOT NULL,
    id_habitad INT NOT NULL,

    PRIMARY KEY (id_especie, id_habitad),

    FOREIGN KEY (id_especie) REFERENCES Especie(id_especie),
    FOREIGN KEY (id_habitad) REFERENCES Habitad(id_habitad)
);

CREATE TABLE EspecieCaracteristica (
    id_especie INT NOT NULL,
    id_caracteristica INT NOT NULL,

    PRIMARY KEY (id_especie, id_caracteristica),

    FOREIGN KEY (id_especie) REFERENCES Especie(id_especie),
    FOREIGN KEY (id_caracteristica)
        REFERENCES Caracteristicas(id_caracteristica)
);

ALTER TABLE Especie
ADD observaciones VARCHAR(70);

INSERT INTO tipoanimal (nombre)
VALUES

('Mamifero'),
('Ave'),
('Reptil'),
('Anfibio'),
('Pez'),
('Insecto'),
('Aracnido'),
('Crustaceo'),
('Molusco'),
('Equinodermo'),
('Anelido'),
('Porifero'),
('Cnidario'),
('Miriapodo'),
('Quelicerado'),
('Cefalopodo'),
('Gasteropodo'),
('Bivalvo'),
('Roedor'),
('Marsupial');


INSERT INTO alimentacion (nombre)
VALUES

('Carnivoro'),
('Herbivoro'),
('Omnivoro'),
('Insectivoro'),
('Frugivoro'),
('Granivoro'),
('Nectarivoro'),
('Piscivoro'),
('Detritivoro'),
('Filtrador'),
('Hematofago'),
('Carroñero'),
('Folivoro'),
('Malacofago'),
('Crustaceivoro'),
('Planctivoro'),
('Semillero'),
('Polinivoro'),
('Coprofago'),
('Generalista');


INSERT INTO Habitad (nombre)
VALUES


('Bosque tropical'),
('Bosque seco'),
('Selva'),
('Sabana'),
('Desierto'),
('Montaña'),
('Rio'),
('Lago'),
('Mar'),
('Oceano'),
('Humedal'),
('Manglar'),
('Pradera'),
('Paramo'),
('Cueva'),
('Zona urbana'),
('Bosque de niebla'),
('Arrecife'),
('Playa'),
('Pantano');


INSERT INTO Caracteristicas (descripcion)
VALUES


('Tiene pelaje'),
('Tiene plumas'),
('Tiene escamas'),
('Puede volar'),
('Vive en grupos'),
('Es nocturno'),
('Es diurno'),
('Es depredador'),
('Es herbivoro'),
('Es omnivoro'),
('Puede nadar'),
('Puede trepar arboles'),
('Tiene pico'),
('Tiene garras'),
('Tiene cola'),
('Tiene caparazon'),
('Produce veneno'),
('Tiene alas'),
('Tiene antenas'),
('Tiene branquias');


INSERT INTO EstadoConservacion (nombre)
VALUES


('Preocupacion menor'),
('Casi amenazado'),
('Vulnerable'),
('En peligro'),
('En peligro critico'),
('Extinto en estado silvestre'),
('Extinto'),
('Datos insuficientes'),
('No evaluado'),
('Amenazado'),
('Estable'),
('En recuperacion'),
('Poblacion reducida'),
('Protegido'),
('Proteccion especial'),
('Riesgo bajo'),
('Riesgo moderado'),
('Riesgo alto'),
('Riesgo muy alto'),
('Conservacion prioritaria');

INSERT INTO Especie
(nombre, id_tipo, id_alimentacion, id_estado, fecha_registro)
VALUES

('Jaguar', 1, 1, 3, '2026-01-01'),
('Oso de anteojos', 1, 3, 3, '2026-01-02'),
('Mono aullador', 1, 3, 1, '2026-01-03'),
('Perezoso', 1, 2, 1, '2026-01-04'),
('Tapir', 1, 2, 3, '2026-01-05'),
('Condor de los Andes', 2, 12, 4, '2026-01-06'),
('Aguila real', 2, 1, 2, '2026-01-07'),
('Tucan', 2, 5, 1, '2026-01-08'),
('Flamenco', 2, 10, 1, '2026-01-09'),
('Iguana verde', 3, 2, 1, '2026-01-10'),
('Tortuga marina', 3, 2, 3, '2026-01-11'),
('Caiman', 3, 1, 1, '2026-01-12'),
('Rana de cristal', 4, 4, 3, '2026-01-13'),
('Salamandra', 4, 4, 1, '2026-01-14'),
('Trucha', 5, 8, 1, '2026-01-15'),
('Mariposa monarca', 6, 7, 2, '2026-01-16'),
('Tarantula', 7, 1, 1, '2026-01-17'),
('Cangrejo azul', 8, 15, 1, '2026-01-18'),
('Pulpo comun', 9, 1, 1, '2026-01-19'),
('Delfin nariz de botella', 1, 8, 1, '2026-01-20');


INSERT INTO EspecieHabitat (id_especie, id_habitad)
VALUES

(1,1),
(2,6),
(3,3),
(4,3),
(5,4),
(6,14),
(7,6),
(8,1),
(9,11),
(10,3),
(11,9),
(12,7),
(13,1),
(14,6),
(15,7),
(16,13),
(17,1),
(18,12),
(19,9),
(20,9);


INSERT INTO EspecieCaracteristica
(id_especie, id_caracteristica)
VALUES

(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,2),
(7,2),
(8,2),
(9,2),
(10,3),
(11,3),
(12,3),
(13,3),
(14,3),
(15,20),
(16,18),
(17,17),
(18,16),
(19,11),
(20,11);

UPDATE Especie
SET observaciones = 'Especie de interes para la aplicacion'
WHERE id_especie = 1;

UPDATE Especie
SET observaciones = 'Registrar informacion de conservacion'
WHERE id_especie = 2;

--------------------------------------------
--                CONSULTA                --
--------------------------------------------

-- =========================================
-- ¿Cuantas especies hay por tipo de animal?
-- =========================================

SELECT
    t.nombre AS tipo_animal,
    COUNT(e.id_especie) AS total_especies
FROM tipoanimal t
INNER JOIN Especie e
    ON t.id_tipo = e.id_tipo
GROUP BY t.nombre;

-- =========================================
-- ¿Que tipos tienen mas de una especie?  --
-- =========================================

SELECT
    t.nombre AS tipo_animal,
    COUNT(e.id_especie) AS total_especies
FROM tipoanimal t
INNER JOIN Especie e
    ON t.id_tipo = e.id_tipo
GROUP BY t.nombre
HAVING COUNT(e.id_especie) > 1;

-- =========================================
-- ¿Cuantas especies hay por alimentacion?
-- =========================================

SELECT
    a.nombre AS alimentacion,
    COUNT(e.id_especie) AS total_especies
FROM alimentacion a
INNER JOIN Especie e
    ON a.id_alimentacion = e.id_alimentacion
GROUP BY a.nombre;

-- =========================================
-- ¿Que especies se registraron en enero de 2026?
-- =========================================

SELECT
    nombre,
    fecha_registro
FROM Especie
WHERE fecha_registro >= '2026-01-01'
  AND fecha_registro < '2026-02-01';

-- =========================================
-- ¿Cuantas especies tiene cada estado?
-- =========================================

SELECT
    ec.nombre AS estado_conservacion,
    COUNT(e.id_especie) AS total_especies
FROM EstadoConservacion ec
LEFT JOIN Especie e
    ON ec.id_estado = e.id_estado
GROUP BY ec.nombre;

-- =========================================
-- ¿Cuantas especies hay por habitat?
-- =========================================

SELECT
    h.nombre AS habitat,
    COUNT(eh.id_especie) AS total_especies
FROM Habitad h
LEFT JOIN EspecieHabitat eh
    ON h.id_habitad = eh.id_habitad
GROUP BY h.nombre;

-- =========================================
-- ¿Cuantas especies hay en promedio por tipo?
-- =========================================

SELECT
    AVG(total_especies) AS promedio_especies_por_tipo
FROM (
    SELECT
        t.id_tipo,
        COUNT(e.id_especie) AS total_especies
    FROM tipoanimal t
    LEFT JOIN Especie e
        ON t.id_tipo = e.id_tipo
    GROUP BY t.id_tipo
) AS resumen;

-- =========================================
-- ¿Cuantas especies hay en total?
-- =========================================

SELECT
    COUNT(*) AS total_especies
FROM Especie;

--------------------------------------------
--       PROCEDIMIENTOS ALMACENADOS       --
--------------------------------------------

CREATE PROCEDURE usp_InsertarEspecie
    @nombre VARCHAR(50),
    @id_tipo INT,
    @id_alimentacion INT,
    @id_estado INT
AS
BEGIN

    INSERT INTO Especie
    (nombre, id_tipo, id_alimentacion, id_estado)
    VALUES
    (@nombre, @id_tipo, @id_alimentacion, @id_estado)

END;
GO


EXEC usp_InsertarEspecie 'Leon', 1, 1, 2;
GO


CREATE PROCEDURE usp_TotalEspecies
AS
BEGIN

    SELECT COUNT(*) AS total_especies
    FROM Especie

END;
GO

-- EJECUTAR

EXEC usp_TotalEspecies;
GO