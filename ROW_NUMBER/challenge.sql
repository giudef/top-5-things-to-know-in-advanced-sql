/*
Write a query using row_number that returns: OrderNum, Orderdate, CustName, ProdCategory, ProdName, Order Total
for the three orders with the highest Order Totals from each ProdCategory purchased by Boehm Inc
*/

WITH ROW_NUM AS (
SELECT  OrderNum, Orderdate, CustName, ProdCategory, ProdName, [Order Total],
	ROW_NUMBER() OVER (PARTITION BY ProdCategory ORDER BY [Order Total] DESC) ranked
FROM [Red30Tech].[dbo].[OnlineRetailSales$] 
WHERE CustName ='Boehm Inc.' )

SELECT *
	FROM ROW_NUM
	WHERE ranked <= 3
	ORDER BY [ProdCategory], [Order Total]
