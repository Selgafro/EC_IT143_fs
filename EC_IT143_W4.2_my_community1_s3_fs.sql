-- What is the total player salary per month?

-- A: Let's ask SQL Server and find out...

SELECT TOP 1 'Total Player Salary Per Month' AS Description
	, SUM(mtd_salary) AS MonthlySalary
FROM [tblPlayerFact]
GROUP BY as_of_date