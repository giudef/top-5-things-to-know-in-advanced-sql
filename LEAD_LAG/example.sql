/*
The following is an exmaple of a query using LAG() and LEAD(), as discussed in video 04_02.
Task: Write a query using LAG() and LEAD() to show the Session Name and Start Time of the previous Red30 Tech session conducted in Room 102,
as well as what the next session will be.
*/

-- Preview data if necessary
-- SELECT * FROM [Red30Tech].[dbo].[SessionInfo$]
-- WHERE [Room Name] = 'Room 102' 
-- ORDER BY [Start Date] ASC

SELECT [Start Date], [End Date], [Session Name],
	--1 offset
	LAG([Session Name],1) OVER (ORDER BY [Start Date]) as [PreviousSessionName],
	LAG([Start Date],1) OVER (ORDER BY [Start Date]) as [PreviousSessionStartDate],
	LEAD([Session Name],1) OVER (ORDER BY [Start Date]) as [NextSessionName],
	LEAD([Start Date],1) OVER (ORDER BY [Start Date]) as [NextSessionStartDate]
	FROM [Red30Tech].[dbo].[SessionInfo$]
	WHERE [Room Name] = 'Room 102' 
	ORDER BY [Start Date] ASC
