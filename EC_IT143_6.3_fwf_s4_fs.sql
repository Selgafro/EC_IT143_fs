-- Q: How to extract first name from Contact Name?

-- A: Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from the combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT 
	t.ContactName
	, LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1)  AS FirstName
FROM [dbo].[t_w3_schools_customers] AS t
ORDER BY 1;