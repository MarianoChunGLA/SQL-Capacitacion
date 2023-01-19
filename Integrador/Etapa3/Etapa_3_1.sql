-- Etapa 3.1
-- 1)
/*
Generar un backup de la base de datos 
LABORATORIO (completa) en un único 
archivo llamado BACKUP LABORATORIO 
BD. Este archivo de respaldo debe generarse 
en el Escritorio de Windows.
Finalizado el proceso, verificar que el archivo 
de respaldo se haya generado antes de 
continuar con los siguientes puntos
*/

-- *Generar backup*

-- 2)
/*
Eliminar la base de datos LABORATORIO.
*/
drop database laboratorio;

-- 3)
/*
Restaurar el archivo BACKUP 
LABORATORIO BD. Verificar, después de la 
restauración, que se haya generado la base 
de datos
*/
use laboratorio;

show tables;