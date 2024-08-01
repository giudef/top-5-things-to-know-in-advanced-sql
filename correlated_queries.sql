-- Example of a query using a correlated subquery
/*
The following is an example of a query using a correlated subquery, as discussed in video 01_05.
Task: Write a query that outputs the first and last name, state, email address, 
and phone number of conference attendees who come from states that have no Online Retail Sales.
*/

-- Preview data if necessary
-- SELECT * FROM [Red30Tech].[dbo].[OnlineRetailSales$]
-- SELECT * FROM [Red30Tech].[dbo].[ConventionAttendees$]

SELECT [First name], [Last name], [State], [Email], [Phone Number]
	FROM [Red30Tech].[dbo].[ConventionAttendees$] c
	WHERE NOT EXISTS
		(SELECT o.[CustState] FROM [Red30Tech].[dbo].[OnlineRetailSales$] o
			WHERE o.[CustState] = c.[State])


SELECT [First name], [Last name], [State], [Email], [Phone Number]
	FROM [Red30Tech].[dbo].[ConventionAttendees$] c
	WHERE [State] NOT IN
		(SELECT DISTINCT [CustState] FROM [Red30Tech].[dbo].[OnlineRetailSales$])
