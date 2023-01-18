-- Etapa 1.3

-- 1)
/*
Cargar 5 registros en la tabla FACTURAS, 
tal como se detallan a continuación:

Primera factura
Letra: A
Número: 28
IDCliente: 14
IDArticulo: 335
Fecha: 2021-03-18
Monto: 1589.50

Segunda factura
Letra: A
Número: 39
IDCliente: 26
IDArticulo: 157
Fecha: 2021-04-12
Monto: 979.75

Tercera factura
Letra: B
Número: 8
IDCliente: 17
IDArticulo: 95
Fecha: 2021-04-25
Monto: 513.35

Cuarta factura
Letra: B
Número: 12
IDCliente: 5
IDArticulo: 411
Fecha: 2021-05-03
Monto: 2385.70

Quinta factura
Letra: B
Número: 19
IDCliente: 50
IDArticulo: 157
Fecha: 2021-05-26
Monto: 979.75
*/
USE LABORATORIO;
DESCRIBE FACTURAS;
INSERT INTO FACTURAS VALUES
('A', 28, 14, 335, '2021-03-18', 1589.50),
('A', 39, 26, 157, '2021-04-12', 979.75),
('B', 8, 17, 95, '2021-04-25', 513.35),
('B', 12, 5, 411, '2021-05-03', 2385.70),
('B', 19, 50, 157, '2021-05-26', 979.75);

SELECT * FROM FACTURAS;

-- 2)
/*
Cargar 4 registros en la tabla ARTÍCULOS, 
tal como se detallan a continuación:

Primer artículo
IDArticulo: 95
Nombre: Webcam con Micrófono Plug & Play
Precio: 513.35
Stock: 39

Segundo artículo
IDArticulo: 157
Nombre: Apple AirPods Pro
Precio: 979.75
Stock: 152

Tercer artículo
IDArticulo: 335
Nombre: Lavasecarropas Automático Samsung
Precio: 1589.50
Stock: 12

Cuarto artículo
IDArticulo: 411
Nombre: Gloria Trevi / Gloria / CD+DVD
Precio: 2385.70
Stock: 2

*/
DESCRIBE ARTICULOS;
INSERT INTO ARTICULOS VALUES
(95, "Webcam con Micrófono Plug & Play", 513.35, 39),
(157, "Apple AirPods Pro", 979.75, 152),
(335, "Lavasecarropas Automático Samsung", 1589.50, 12),
(411, " Gloria Trevi / Gloria / CD+DVD", 2585.70, 2);

SELECT * FROM ARTICULOS;

-- 3)
/*
Cargar 5 registros en la tabla CLIENTES, tal como se detallan a continuación

Primer cliente
IDCliente: 5
Nombre: Santiago
Apellido: González
CUIT: 23-24582359-9
Dirección: Uriburu 558 - 7ºA
Comentarios: VIP

Segundo cliente
IDCliente: 14
Nombre: Gloria
Apellido: Fernández
CUIT: 23-35965852-5
Dirección: Constitución 323
Comentarios: GBA

Tercer cliente
IDCliente: 17
Nombre: Gonzalo
Apellido: López
CUIT: 23-33587416-0
Dirección: Arias 2624
Comentarios: GBA

Cuarto cliente
IDCliente: 26
Nombre: Carlos
Apellido: García
CUIT: 23-42321230-9
Dirección: Pasteur 322 - 2ºC
Comentarios: VIP

Quinto cliente
IDCliente: 50
Nombre: Micaela
Apellido: Altieri
CUIT: 23-22885566-5
Dirección: Santamarina 1255
Comentarios: GBA
*/
DESCRIBE CLIENTES;
INSERT INTO CLIENTES VALUES
(5, "Santiago", "González", '23-24582359-9', "Uriburu 558-7°A", "VIP"),
(14, "Gloria", "Fernández", '23-35965852-5', "Constitución 323", "GBA"),
(17, "Gonzalo", "López", '23-33587416-0', "Arias 2624", "GBA"),
(26, "Carlos", "García", '23-42321230-9', "Pasteur 322 - 2ºC", "VIP"),
(50, "Micaela", "Altieri", '23-22885566-5', " Santamarina 1255", "GBA");

SELECT * FROM CLIENTES;