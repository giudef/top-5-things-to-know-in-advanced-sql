 /*
	Write a query using lag and lead that returns
	- order date, quanityt
 */

 WITH TotalQtyDay AS (
	SELECT [OrderDate], SUM([Quantity]) Qty
  	FROM [Red30Tech].[dbo].[OnlineRetailSales$]
	WHERE  [ProdCategory] = 'Drones'
	GROUP BY [OrderDate]
 )
 SELECT *
	, LAG([Qty], 1) OVER (ORDER BY [OrderDate]) as [Prev1Qty]
	, LAG([Qty], 2) OVER (ORDER BY [OrderDate]) as [Prev2Qty]
	, LAG([Qty], 3) OVER (ORDER BY [OrderDate]) as [Prev3Qty]
	, LAG([Qty], 4) OVER (ORDER BY [OrderDate]) as [Prev4Qty]
	, LAG([Qty], 5) OVER (ORDER BY [OrderDate]) as [Prev5Qty]
	FROM TotalQtyDay
	
---------------------------------------------------------------------------------------------------

-- LEAD() Solution:
WITH ORDERS_BY_DAYS AS(
					SELECT ORDERDATE, SUM(QUANTITY) AS QUANTITY_BY_DAY
					FROM [Red30Tech].[dbo].[OnlineRetailSales$]
					WHERE ProdCategory = 'Drones'
					GROUP BY ORDERDATE
					)

SELECT ORDERDATE, QUANTITY_BY_DAY,

LEAD([QUANTITY_BY_DAY],1) OVER (ORDER BY [ORDERDATE] DESC) AS LastDATEQuantity_1,
LEAD([QUANTITY_BY_DAY],2) OVER (ORDER BY [ORDERDATE] DESC) AS LastDATEQuantity_2,
LEAD([QUANTITY_BY_DAY],3) OVER (ORDER BY [ORDERDATE] DESC) AS LastDATEQuantity_3,
LEAD([QUANTITY_BY_DAY],4) OVER (ORDER BY [ORDERDATE] DESC) AS LastDATEQuantity_4,
LEAD([QUANTITY_BY_DAY],5) OVER (ORDER BY [ORDERDATE] DESC) AS LastDATEQuantity_5

FROM ORDERS_BY_DAYS