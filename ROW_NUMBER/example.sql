/*
	Example of a query using ROW_NUMBER
	Task: Write a query using ROW_NUMBER to return each customer's most recent order
*/

-- SELECT * FROM [Red30Tech].[dbo].[OnlineRetailSales$]

SELECT CUSTNAME, COUNT(DISTINCT OrderNum)
FROM [Red30Tech].[dbo].[OnlineRetailSales$]
GROUP BY CUSTNAME

go

WITH ROW_NUMBERS AS (
SELECT OrderNum, OrderDate, CustName, ProdName, Quantity, 
	ROW_NUMBER() OVER(PARTITION BY CustName ORDER BY OrderDate DESC) as ROW_NUM
FROM [Red30Tech].[dbo].[OnlineRetailSales$] 
)
SELECT * FROM ROW_NUMBERS WHERE ROW_NUM = 1

GO

SELECT * 
	FROM (SELECT OrderNum, OrderDate, CustName, ProdName, Quantity, 
		ROW_NUMBER() OVER(PARTITION BY CustName ORDER BY OrderDate DESC) as ROW_NUM
		FROM [Red30Tech].[dbo].[OnlineRetailSales$] ) as d
	WHERE d.ROW_NUM = 1
