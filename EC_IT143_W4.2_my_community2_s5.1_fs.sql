-- What is the total amount spent per each member at Planet Express?

-- A: Let's ask SQL Server and find out:

SELECT v.Member
	, v.[Amount Spent]
	INTO dbo.t_community2_simpsons
FROM dbo.v_community2_simpsons AS v;