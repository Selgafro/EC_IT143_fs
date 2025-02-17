-- Q: How to extract first name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from the combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

WITH 
	s1 -- Use a Common Table Expression and compare FirstName to FirstName2
	AS(SELECT 
			t.ContactName
			, LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1)  AS FirstName
			, dbo.udf_parse_FirstName(t.ContactName) AS FirstName2
		FROM [dbo].[t_w3_schools_customers] AS t)
		SELECT
			s1.*
			FROM s1
			WHERE s1.FirstName <> s1.FirstName2; -- Expected result is 0 rows