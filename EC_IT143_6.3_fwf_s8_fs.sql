-- Q: How to extract first name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from the combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

SELECT
	t.CustomerID
	, t.CustomerName
	, t.ContactName
	, dbo.udf_parse_FirstName(t.ContactName) AS ContactName_FirstName
	, '' AS ContactName_LastName -- How to extract last name from the Contact Name?
	, t.Address
	, t.City
	, t.Country
FROM [dbo].[t_w3_schools_customers] AS t
ORDER BY 1;

