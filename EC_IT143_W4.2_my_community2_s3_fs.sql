-- What is the total amount spent per each member at Planet Express?

-- A: Let's ask SQL Server and find out:

SELECT Card_Member AS Member
	, SUM(Amount) AS 'Amount Spent'
FROM dbo.Planet_Express
WHERE Amount < 0
GROUP BY Card_Member;