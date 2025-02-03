-- What is the total player salary per month?

-- A: Let's ask SQL Server and find out...

SELECT v.Descript
	, v.MonthlySalary
	INTO dbo.t_community1_myfc
FROM dbo.v_community1_myfc AS v;
