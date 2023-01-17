-- Desafio 3

-- Ejercicio 1
-- 1)
/*
Generar una lista en la que se muestren todos 
los artistas y las canciones de la tabla TOP 
SPOTIFY. El nombre de cada artista y el título 
de la canción deben mostrarse separados con 
un guión, en una columna llamada CANCIÓN. 
Utilizar la función CONCAT para llevar a cabo 
este ejercicio. Ordenar la lista resultante de
forma alfabética, por la columna CANCIÓN. 
Esta consulta, además, debe mostrar el 
campo GENERO
*/
USE bonus_track;
SELECT * from top_spotify;

SELECT CONCAT(titulo, " - ", artista) AS cancion, genero from top_spotify ORDER BY cancion;

-- 2)
/*
Modificar la consulta anterior para obtener el 
mismo resultado con la función
CONCAT_WS
*/
SELECT CONCAT_WS(" - ", titulo, artista) AS cancion, genero from top_spotify ORDER BY cancion;

-- 3)
/*
Modificar la consulta anterior para mostrar 
los géneros en mayúsculas.
*/
SELECT CONCAT_WS(" - ", titulo, artista) AS cancion, UPPER(genero) from top_spotify ORDER BY cancion;

-- 4)
/*
Agregar a la consulta anterior una columna
con el nombre AÑOS en la que se calcule la 
cantidad de años transcurridos desde que 
se lanzó cada una de las canciones al
año actual
*/
SELECT CONCAT_WS(" - ", titulo, artista) AS cancion, UPPER(genero) as genero, YEAR(curdate()) - ano as 'años' from top_spotify ORDER BY cancion;

-- 5)
/*
Generar una consulta que calcule la cantidad 
de registros que figuran en la tabla TOP 
SPOTIFY. El resultado debe mostrarse en 
una columna con el nombre CANCIONES
*/
SELECT COUNT(*) as canciones FROM top_spotify;

-- 6)
/*
Generar una consulta que muestre la cantidad de 
canciones lanzadas al mercado por año
*/
SELECT COUNT(*) as 'cantidad canciones lanzadas', ano as año from top_spotify GROUP BY ano;

-- 7)
/*
Modificar la consulta anterior para no mostrar 
aquellos años en los que se hayan lanzado menos 
de 50 canciones
*/
SELECT COUNT(*) as 'cantidad canciones lanzadas', ano as año from top_spotify GROUP BY ano HAVING COUNT(*) >= 50;

-- Ejercicio 2
-- 1)
/*
Utilizar la base de datos LIBRERIA y generar 
una lista en la que se muestren todos los 
autores y la provincia en la que nacieron. 
El apellido y el nombre de cada autor deben 
mostrarse separados con una coma y un 
espacio en una columna llamada AUTOR. 
Utilizar la función CONCAT para llevar a cabo 
este ejercicio. Ordenar alfabéticamente los 
apellidos resultantes. 
*/
USE LIBRERIA;
SELECT CONCAT(apellido, ', ', nombre) as autor, provincia FROM autores ORDER BY autor;

-- 2)
/*
Modificar la consulta anterior para obtener el 
mismo resultado con la función 
CONCAT_WS.
*/
SELECT CONCAT_WS(', ', apellido, nombre) as autor, provincia FROM autores ORDER BY autor;

-- 3)
/*
 Modificar la consulta anterior para mostrar 
los nombres de los autores en mayúsculas.
*/
SELECT CONCAT_WS(', ', apellido, UPPER(nombre)) as autor, provincia FROM autores ORDER BY autor;

-- 4)
/*
Modificar la consulta anterior para mostrar 
únicamente la inicial del nombre del autor 
y su apellido
*/
SELECT CONCAT_WS(', ', apellido, LEFT(nombre, 1)) as autor, provincia FROM autores ORDER BY autor;

-- 5)
/*
Generar una columna con el nombre INGRESO en la 
que se muestren todos los empleados y el año en el 
que ingresaron a trabajar a la empresa. El apellido y el 
nombre de cada empleado deben mostrarse separados 
con una coma y un espacio en una columna con el 
nombre EMPLEADO. Utilizar la función CONCAT para 
llevar a cabo este ejercicio. Ordenar el resultado de la 
consulta de mayor a menor según los años de ingreso 
de cada empleado.
*/
SELECT CONCAT(apellido, ', ', nombre) as empleado, fecha_ingreso as ingreso FROM empleados ORDER BY ingreso DESC;

-- Ejercicio 3
-- 1)
/*
 Modificar la consulta anterior para agregar 
una columna con el nombre ANTIGÜEDAD. 
Esta deberá calcular la cantidad de años de 
antigüedad de cada empleado dentro de la 
empresa al día de hoy
*/
SELECT CONCAT(apellido, ', ', nombre) as empleado, 
fecha_ingreso as ingreso,
TIMESTAMPDIFF(YEAR, fecha_ingreso, CURRENT_TIMESTAMP()) AS antiguedad
FROM empleados ORDER BY ingreso DESC;

-- 2)
/*
Generar una consulta que permita obtener 
el precio más bajo de la tabla LIBROS. El 
resultado se debe mostrar en una columna 
con el nombre MENOR PRECIO
*/
SELECT MIN(precio) AS 'menor precio' FROM libros;

-- 3)
/*
Modificar la consulta anterior para agregar 
una columna que calcule el precio más alto
de la tabla LIBROS. Mostrar el resultado en 
una columna con el nombre MAYOR PRECIO.
*/
SELECT MIN(precio) AS 'menor precio', MAX(precio) AS 'mayor precio' FROM libros;

-- 4)
/*
Modificar la consulta anterior para agregar 
una columna que calcule el precio promedio
de todos los libros. Mostrar el resultado en 
una columna con el nombre PRECIO 
PROMEDIO. El promedio resultante debe 
mostrar 2 decimales como máximo
*/
SELECT 
MIN(precio) AS 'menor precio', 
MAX(precio) AS 'mayor precio',
ROUND(AVG(precio), 2) AS 'precio promedio' 
FROM libros;

-- 5)
/*
Generar una consulta que permita obtener el precio 
más bajo, el más alto y el promedio de los libros 
pertenecientes a cada categoría
*/
SELECT
categoria, 
MIN(precio) AS 'menor precio', 
MAX(precio) AS 'mayor precio',
ROUND(AVG(precio), 2) AS 'precio promedio' 
FROM libros
GROUP BY categoria;

-- 6)
/*
Modificar la consulta anterior para no mostrar la 
categoría “SIN ASIGNAR”
*/
SELECT
categoria, 
MIN(precio) AS 'menor precio', 
MAX(precio) AS 'mayor precio',
ROUND(AVG(precio), 2) AS 'precio promedio' 
FROM libros
GROUP BY categoria
HAVING categoria <> 'Sin asignar';