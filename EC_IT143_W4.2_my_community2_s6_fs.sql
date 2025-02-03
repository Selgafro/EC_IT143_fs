-- What is the total amount spent per each member at Planet Express?

-- A: Let's ask SQL Server and find out:

-- 1) Reload data

TRUNCATE TABLE dbo.t_community2_simpsons

INSERT INTO dbo.t_community2_simpsons
	SELECT v.Member
		, v.[Amount Spent]
	FROM dbo.v_community2_simpsons AS v;

-- Review results

SELECT *
FROM dbo.t_community2_simpsons
