-- Desafio 2

-- Ejercicio 1

-- 1) Import externo realizado sobre Top_Spotify.csv

-- 2) 
SELECT * FROM top_spotify;

-- 3)
SELECT ARTISTA, TITULO, GENERO FROM top_spotify;

-- 4)
SELECT ARTISTA, TITULO, GENERO FROM top_spotify ORDER BY GENERO ASC;

-- 5)
SELECT ARTISTA, TITULO, GENERO FROM top_spotify ORDER BY GENERO ASC, ARTISTA ASC;

-- Ejercicio 2

-- 1)
SELECT ARTISTA, TITULO, GENERO FROM top_spotify ORDER BY ARTISTA ASC, TITULO ASC LIMIT 10;

-- 2)
SELECT ARTISTA, TITULO, GENERO FROM top_spotify ORDER BY ARTISTA ASC, TITULO ASC LIMIT 5 OFFSET 10;

-- 3)
SELECT * FROM top_spotify WHERE ARTISTA = "Madonna";

-- 4)
SELECT * FROM top_spotify WHERE GENERO = "Pop" ORDER BY TITULO ASC;

-- 5)
SELECT * FROM top_spotify WHERE GENERO = "Pop" AND ANO = 2015 ORDER BY ARTISTA ASC, TITULO ASC;

-- 6)
SELECT * FROM top_spotify WHERE GENERO = "Dance Pop" AND ANO < 2011 ORDER BY TITULO ASC;

-- Ejercicio 3
USE LIBRERIA;
-- 1)
SELECT * FROM AUTORES WHERE ciudad = "Buenos Aires";

-- 2)
SELECT * FROM LIBROS WHERE precio > 30 ORDER BY precio DESC;

-- 3)
SELECT * FROM AUTORES WHERE provincia <> 'BA' ORDER BY provincia ASC;

-- 4)
SELECT * FROM LIBROS WHERE categoria = "Cuentos" AND precio < 20 ORDER BY titulo ASC;

-- 5)
SELECT * FROM LIBROS WHERE categoria IN ("Novelas", "Ensayos") ORDER BY titulo ASC;

-- 6)
SELECT * FROM LIBROS WHERE precio BETWEEN 20 AND 35 ORDER BY precio ASC;

-- 7)
SELECT * FROM AUTORES WHERE nombre IN ("Jorge Luis", "Victoria", "Ernesto", "Adolfo") ORDER BY nombre ASC;

-- 8)
SELECT * FROM LIBROS WHERE titulo LIKE("%mundo%") ORDER BY titulo ASC;

-- 9)
SELECT * FROM LIBROS WHERE titulo LIKE("de%") ORDER BY titulo ASC;

-- 10)
SELECT * FROM LIBROS WHERE precio IS NULL ORDER BY titulo ASC;

