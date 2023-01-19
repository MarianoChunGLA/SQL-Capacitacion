-- Etapa 3.2

-- 1)
/*
Utilizar la tabla CLIENTES_NEPTUNO y 
generar una consulta que muestre las 
columnas IDCLIENTE y NOMBRECOMPANIA. 
En el resultado de la consulta, se debe 
mostrar una nueva columna llamada 
UBICACION que concatene las columnas 
DIRECCION, CIUDAD y PAIS, separando 
los valores de estos campos por un guión. 
Para este primer ejercicio, utilizar la función 
CONCAT
*/
use laboratorio;
select idcliente, nombrecompania, concat(direccion, ' - ', ciudad, ' - ', pais) as Ubicacion from clientes_neptuno; 

-- 2)
/*
Repetir el ejercicio anterior, utilizando la 
función CONCAT_WS.
*/
select idcliente, nombrecompania, concat_ws(' - ', direccion, ciudad, pais) as Ubicacion from clientes_neptuno; 

-- 3)
/*
Modificar el ejercicio anterior para mostrar en 
mayúsculas los valores cargados en el campo 
NOMBRECOMPANIA. Esta columna debe 
mostrarse con el nombre EMPRESA
*/
select idcliente, upper(nombrecompania) as empresa, concat_ws(' - ', direccion, ciudad, pais) as Ubicacion from clientes_neptuno; 

-- 4)
/*
Modificar el ejercicio anterior para mostrar los 
valores cargados en el campo IDCLIENTE en 
minúsculas. Esta columna debe mostrarse 
con el nombre CODIGO
*/
select lower(idcliente) as codigo, upper(nombrecompania) as empresa, concat_ws(' - ', direccion, ciudad, pais) as Ubicacion from clientes_neptuno; 

-- 5)
/*
Utilizar la tabla NACIMIENTOS y generar una 
consulta que muestre la columna FECHA. En 
el resultado de la consulta, se debe mostrar 
una nueva columna con el nombre SEXO que 
muestre la inicial de los datos cargados en el 
campo SEXO y otra columna con el nombre 
TIPO que muestre la inicial de los datos 
cargados en el campo TIPO_PARTO.
*/
select * from nacimientos;
select fecha as FECHA, left(sexo, 1) as SEXO, left(tipo_parto, 1) as TIPO from nacimientos;

-- 6)
/*
Utilizar la tabla CLIENTES_NEPTUNO y 
genera una consulta que muestre todos los 
campos de la tabla. Agregar una nueva 
columna a la consulta con el nombre 
CODIGO. La misma, debe concatenar la 
primera letra del campo CIUDAD y la 
primera y las 2 últimas letras del campo 
PAIS. Los datos de esta nueva columna se 
deben mostrar en mayúsculas
*/
select *, upper(concat(left(ciudad,1), left(pais,1), right(pais, 2))) as CODIGO from clientes_neptuno;


-- 7)
/*
Utilizar la tabla NACIMIENTOS y generar una consulta 
que muestre las 5 primeras columnas de la tabla. 
Agregar una nueva columna a la consulta con el 
nombre MES que tome el mes de nacimiento de los 
bebés del campo FECHA. Ordenar el resultado de 
menor a mayor por los valores de la columna MES.
*/
select SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART, substring(fecha,4,2) as MES from nacimientos order by MES asc;

-- 8)
/*
Utilizar la tabla NACIMIENTOS y generar una consulta 
que muestre las siguientes columnas: SEXO, FECHA y 
TIPO_PARTO. En el resultado de la consulta, se debe 
mostrar una nueva columna llamada NACIONALIDAD
donde se reemplazan los valores Chilena de la 
columna NACIONALIDAD original por Ciudadana.
*/
select SEXO, FECHA, TIPO_PARTO, replace(NACIONALIDAD, 'Chilena', 'Ciudadana') as NACIONALIDAD from nacimientos;



