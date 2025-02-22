-- Sección 2:  
-- Prueba práctica SQL

CREATE DATABASE IF NOT EXISTS prueba_puntored;
USE prueba_puntored;
CREATE TABLE IF NOT EXISTS clientes (
	id INT PRIMARY KEY,
	nombre VARCHAR (50),
	apellido VARCHAR (50)
);

CREATE TABLE IF NOT EXISTS ventas (
	id INT PRIMARY KEY,
    cliente_id INT, 
    fecha DATE,
    monto DECIMAL(10,2),   
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Escribe una consulta para obtener los 5 clientes con mayor monto total de ventas en los últimos 6 meses.
SELECT c.id, CONCAT(c.nombre, ' ',  c.apellido) as Nombre_Completo, SUM(v.monto) as Monto_Total
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
WHERE v.fecha >= DATE_SUB((SELECT MAX(fecha) FROM ventas), INTERVAL 6 MONTH)
GROUP BY c.id
ORDER BY Monto_Total DESC
LIMIT 5;

-- Escribe una consulta para calcular el ticket promedio de ventas por cliente en el último año
SELECT c.id, CONCAT(c.nombre, ' ', c.apellido) as Nombre_Completo, AVG(v.monto) as Ticket_Promedio
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
WHERE YEAR(v.fecha) = (SELECT MAX(YEAR(fecha)) from ventas)
GROUP BY c.id;

-- Escribe una consulta para obtener el nombre completo de los clientes y su monto total de ventas.
SELECT c.id, CONCAT(c.nombre, ' ', c.apellido) as Nombre_Completo, COALESCE(SUM(v.monto), 0) as Monto_Total_Ventas
FROM clientes c
LEFT JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.id, c.nombre, c.apellido;

-- Escribe una consulta para obtener el ingreso promedio de ventas por mes.
SELECT YEAR(fecha) as Año, MONTH(fecha) as Mes, AVG(monto) as Ingreso_Promedio
FROM ventas
GROUP BY YEAR(fecha), MONTH(fecha)
ORDER BY Año DESC, Mes ASC;

-- Escribe una consulta para calcular el ranking de clientes por ventas en el último año
WITH VentasUltimoAño AS (
    SELECT c.id AS cliente_id, CONCAT(c.nombre, ' ', c.apellido) AS Nombre_Completo, COALESCE(SUM(v.monto), 0) AS Total_Ventas
    FROM clientes c
    LEFT JOIN ventas v ON c.id = v.cliente_id AND v.fecha >= DATE_SUB((SELECT MAX(fecha) FROM ventas), INTERVAL 1 YEAR)
    GROUP BY c.id, c.nombre, c.apellido
)
SELECT cliente_id, Nombre_Completo, Total_Ventas,
    DENSE_RANK() OVER (ORDER BY Total_Ventas DESC) AS Ranking
FROM VentasUltimoAño
ORDER BY Ranking;

/*Escribe una consulta para calcular el total de ventas por cliente y luego selecciona solo los clientes 
cuyo total de ventas es superior al promedio general.*/

WITH TotalVentasPorCliente AS (
    SELECT c.id AS cliente_id, CONCAT(c.nombre, ' ', c.apellido) AS Nombre_Completo, COALESCE(SUM(v.monto), 0) AS Total_Ventas
    FROM clientes c
    LEFT JOIN ventas v ON c.id = v.cliente_id
    GROUP BY c.id, c.nombre, c.apellido
),
PromedioGeneral AS (
    SELECT AVG(Total_Ventas) AS Promedio_Total
    FROM TotalVentasPorCliente
)
SELECT t.cliente_id, t.Nombre_Completo, t.Total_Ventas
FROM TotalVentasPorCliente t 
WHERE t.Total_Ventas > (SELECT AVG(Total_Ventas) FROM TotalVentasPorCliente)
ORDER BY t.Total_Ventas DESC;


