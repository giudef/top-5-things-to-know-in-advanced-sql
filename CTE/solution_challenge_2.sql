/*
Challenge 2
Use the inventory table to write a cte that returns 
 ProdCategory, ProdNumber, ProdName, In Stock of items that have less than the average amount of products left in stock
*/

-- SELECT  * FROM [Red30Tech].[dbo].[Inventory$]

WITH AVG_STOCK (avgs) AS (
	SELECT AVG([In Stock]) avgs
		FROM [Red30Tech].[dbo].[Inventory$]
)

SELECT [ProdCategory], [ProdNumber], [ProdName], [In Stock]
	FROM [Red30Tech].[dbo].[Inventory$] i, AVG_STOCK
	WHERE i.[In Stock] < avgs