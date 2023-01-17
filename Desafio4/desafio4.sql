-- Desafio 4

-- Ejercicio 1

-- 1)
/*
Generar una consulta de actualización para 
lograr que todos los títulos de las canciones
y los nombres de los artistas de la tabla 
TOP_SPOTIFY queden cargados en la tabla 
en mayúsculas.
*/
USE bonus_track;
SET sql_safe_updates = 0;
UPDATE top_spotify SET titulo = UPPER(titulo), artista = UPPER(artista);
SELECT * FROM top_spotify;

-- 2)
/*
Agregar a la tabla TOP_SPOTIFY una 
columna llamada PERMANENCIA. Completar 
la columna con la cantidad de años (al año 
actual) de permanencia de cada canción
dentro de la plataforma digital
*/

ALTER TABLE top_spotify ADD PERMANENCIA int;
UPDATE top_spotify SET PERMANENCIA = YEAR(curdate()) - ANO;
SELECT * FROM top_spotify ORDER BY ANO, PERMANENCIA;

-- 3)
/*
Crear una tabla nueva con el nombre 
ÚLTIMOS_LANZAMIENTOS a partir de la 
tabla TOP_SPOTIFY tomando todos los 
campos de la tabla original. Volcar en la 
tabla nueva todas aquellas canciones que 
tengan 3 años o menos de permanencia
en la plataforma digital. Una vez copiados 
los registros correspondientes en la tabla 
nueva, eliminarlos de la tabla original
(TOP_SPOTIFY).
*/
CREATE TABLE ULTIMOS_LANZAMIENTOS 
SELECT * FROM top_spotify WHERE PERMANENCIA <= 3;
DELETE FROM top_spotify WHERE PERMANENCIA <= 3;

SELECT * FROM top_spotify;
SELECT * FROM ULTIMOS_LANZAMIENTOS;

-- 4)
/*
Agregar el siguiente registro a la tabla 
TOP_SPOTIFY:
*/

INSERT INTO top_spotify VALUES (610, "GOD CONTROL", "MADONNA", "POP", 2018, 3);
SELECT * FROM top_spotify;

-- 5)
/*
Copiar a la tabla ÚLTIMOS_LANZAMIENTOS
todas aquellas canciones que tengan 3 años 
o menos de permanencia en la plataforma 
digital. Una vez copiados los registros en la 
tabla nueva, eliminarlos de la tabla original
(TOP_SPOTIFY).
*/
INSERT INTO ULTIMOS_LANZAMIENTOS (ID, TITULO, ARTISTA, GENERO, ANO, PERMANENCIA)
SELECT ID, TITULO, ARTISTA, GENERO, ANO, PERMANENCIA FROM top_spotify WHERE PERMANENCIA <= 3;
DELETE FROM top_spotify WHERE PERMANENCIA <= 3;

SELECT * FROM ULTIMOS_LANZAMIENTOS;
SELECT * FROM top_spotify;

-- Ejercicio 2
-- 1)
/*
Generar una consulta de actualización en 
la que se modifique el nombre del autor de 
apellido ECHEVERRÍA por Esteban. Tener 
en cuenta que se debe modificar el nombre 
de este autor y no su apellido.
*/
USE LIBRERIA;
SET sql_safe_updates = 0;
UPDATE autores SET nombre = "Esteban" WHERE apellido = "ECHEVERRIA";
SELECT * FROM autores where apellido= "echeverria";

-- 2)
/*
Agregar a la tabla EMPLEADOS una columna
con el nombre PERMANENCIA. Completar 
la columna con la antigüedad (expresada en 
años) de cada empleado, tomando como base 
la fecha de ingreso de cada uno de ellos
*/
ALTER TABLE empleados ADD COLUMN permanencia int;
SELECT * FROM empleados;
UPDATE empleados SET permanencia = TIMESTAMPDIFF(YEAR, fecha_ingreso, current_timestamp());
SELECT * FROM empleados;

-- 3)
/*
Agregar a la tabla LIBROS una columna con 
el nombre PRECIO_PÚBLICO. A continuación, 
completar la columna con el precio de venta 
al público de cada libro agregándole un 21%
en concepto de IVA a los precios originales. 
Mantener un máximo de 2 decimales.
*/
ALTER TABLE libros ADD COLUMN precio_publico double;
SELECT * FROM libros;
UPDATE libros SET precio_publico = ROUND(precio * 1.21, 2);
SELECT * FROM libros;

-- Ejercicio 3

-- 1)
/*
Generar una tabla nueva y nombrarla como 
EMPLEADOS_ANTERIORES, a partir de la 
tabla EMPLEADOS. Tomar todos los campos 
de la tabla original. Luego, volcar en la tabla 
nueva los empleados cuyos apellidos sean 
THOMAS, PEREIRA y DEVO. Una vez 
copiados estos 3 empleados en la tabla 
nueva, eliminarlos de la tabla original
(EMPLEADOS).
*/
CREATE TABLE empleados_anteriores
SELECT * FROM empleados WHERE apellido IN ("THOMAS", "PEREIRA", "DEVO");

SELECT * FROM empleados_anteriores;

DELETE FROM empleados WHERE apellido IN ("THOMAS", "PEREIRA", "DEVO");
SELECT * FROM empleados WHERE apellido IN ("THOMAS", "PEREIRA", "DEVO");

-- 2)
/*
Copiar a la tabla EMPLEADOS_ANTERIORES
al empleado de apellido CRUZ desde la tabla 
EMPLEADOS. Una vez copiado a la tabla 
nueva, eliminarlo de la original
*/
INSERT INTO empleados_anteriores
SELECT * FROM empleados WHERE apellido = "CRUZ";

SELECT * FROM empleados_anteriores;

DELETE FROM empleados WHERE apellido = "CRUZ";
SELECT * FROM empleados WHERE apellido = "CRUZ";