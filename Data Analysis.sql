-- =============================================
-- Proyecto: Retail Sales Intelligence Dashboard
-- Autor: Renzo Joel Cueva Cornejo
-- Descripción: Limpieza y transformación de datos de ventas retail
-- Herramientas: SQL Server / Power BI
-- Fecha: 2026
-- =============================================
USE RetailSales
-- EXPLORACION DE DATOS 
SELECT *
FROM RetailSales;

-- LIMPIEZA Y TRANSFORMACION DE DATOS 

SELECT
    [Transaction ID] AS Transaction_ID,
    CAST([Date] AS DATE) AS Fecha,
    [Customer ID] AS Customer_ID,
    Gender,
    Age,
    [Product Category] AS Product_Category,
    Quantity,
    [Price per Unit] AS Price
FROM RetailSales;

--DETECCION DE LOS DUPLICADOS

SELECT
    [Transaction ID],
    COUNT(*) AS Repeticiones
FROM RetailSales
GROUP BY [Transaction ID]
HAVING COUNT(*) > 1;

--TABLA FINAL LIMPIA PARA EL ANALISIS

SELECT TOP 10 *
FROM RetailSales_Final;

--KPIS Y ANALISIS DE NEGOCIOS

-- Total ventas
SELECT COUNT(DISTINCT Customer_ID) AS Total_Clientes
FROM RetailSales_Final;

-- Número de clientes
SELECT COUNT(DISTINCT Customer_ID) AS Clientes
FROM RetailSales_Final;

--Ticket promedio

SELECT
    AVG(Total_Amount) AS Ticket_Promedio
FROM RetailSales_Final;



