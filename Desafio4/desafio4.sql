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
