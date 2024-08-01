-- MULTIPLE ROW SUBQUERY
/* Two Trees Olive Oil wants to know the session name, start date, end date, and room that their employees will
be delievering their presentation in. Write a query that useas a multiple row subquery to extract this information
*/

-- Preview data
--SELECT * FROM [Red30Tech].[dbo].[SpeakerInfo$]
--SELECT * FROM [Red30Tech].[dbo].[SessionInfo$]

SELECT [Speaker Name], [Session Name], [Start Date], [End Date], [Room Name]
	FROM [Red30Tech].[dbo].[SessionInfo$] SI
	WHERE SI.[Speaker Name] in
		(SELECT [Name]
			FROM [Red30Tech].[dbo].[SpeakerInfo$]
				WHERE [Organization] = 'Two Trees Olive Oil' )

SELECT [Speaker Name], [Session Name], [Start Date], [End Date], [Room Name]
	FROM [Red30Tech].[dbo].[SessionInfo$] as  ses
	INNER JOIN (SELECT [Name] FROM [Red30Tech].[dbo].[SpeakerInfo$]
				WHERE [Organization] = 'Two Trees Olive Oil' ) as speak
	ON ses.[Speaker Name] = speak.[Name]