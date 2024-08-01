/*
Create a query that returns the categroy, number, name an In Stock of items of products 
that have less than the average amount of products left in stock
*/

-- SELECT * FROM [Red30Tech].[dbo].[Inventory$]
SELECT [ProdCategory], [ProdNumber], [ProdName], [In Stock], (SELECT AVG([In Stock]) avgs FROM [Red30Tech].[dbo].[Inventory$]) avgs
	FROM [Red30Tech].[dbo].[Inventory$] 
	WHERE [In Stock] < (SELECT AVG([In Stock]) avgs FROM [Red30Tech].[dbo].[Inventory$])