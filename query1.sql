USE [PuntoVenta]
GO

CREATE DATABASE [Red30Tech]
USE [Red30Tech]

SELECT top (5) *  FROM [Red30Tech].[dbo].[OnlineRetailSales$]

-- Write a query that uses a sclar subquery to identify orders whose Order Total is higher than the average total price of all other orders

SELECT *, (SELECT AVG([Order Total]) FROM [Red30Tech].[dbo].[OnlineRetailSales$]) AS avg_total 
	FROM [Red30Tech].[dbo].[OnlineRetailSales$] ors
	WHERE ors.[Order Total] >=
		(SELECT AVG([Order Total]) FROM [Red30Tech].[dbo].[OnlineRetailSales$])
