DROP TABLE IF EXISTS dbo.t_community2_simpsons;
GO

CREATE TABLE dbo.t_community2_simpsons
	(Member VARCHAR(50) NOT NULL
	, [Amount Spent] INT NOT NULL
		DEFAULT 0
	, CONSTRAINT PK_t_community2_simpsons PRIMARY KEY CLUSTERED(Member ASC)
);
GO