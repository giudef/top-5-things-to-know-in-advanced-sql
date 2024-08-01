/*
Write a query using rank or dense_rank that returns the registration information
for the first three conference attendees that registered from each state

*/

WITH rnkPerState AS (
SELECT *, DENSE_RANK() OVER (PARTITION BY State ORDER BY [Registration Date]) as rnk
	FROM [Red30Tech].[dbo].[ConventionAttendees$]
)
SELECT *
	FROM rnkPerState
	WHERE rnk in (1,2,3)

WITH rnkPerState AS (
SELECT *, RANK() OVER (PARTITION BY State ORDER BY [Registration Date]) as rnk
	FROM [Red30Tech].[dbo].[ConventionAttendees$]
)
SELECT *
	FROM rnkPerState
	WHERE rnk in (1,2,3)