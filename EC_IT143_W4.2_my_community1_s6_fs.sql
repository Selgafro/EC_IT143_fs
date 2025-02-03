-- What is the total player salary per month?

-- A: Let's ask SQL Server and find out...

-- 1) Reload data

TRUNCATE TABLE dbo.t_community1_myfc;

INSERT INTO dbo.t_community1_myfc
	SELECT v.Descript
		, v.MonthlySalary
	FROM dbo.v_community1_myfc AS v;

	-- 2) Review results
SELECT t.*
FROM dbo.t_community1_myfc AS t;
