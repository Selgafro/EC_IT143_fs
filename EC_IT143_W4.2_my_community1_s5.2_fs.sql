DROP TABLE IF EXISTS dbo.t_community1_myfc;
GO

CREATE TABLE dbo.t_community1_myfc
	(Descript VARCHAR(50) NOT NULL
	, MonthlySalary INT NOT NULL
		DEFAULT 0
	, CONSTRAINT PK_t_community1_myfc PRIMARY KEY CLUSTERED(Descript ASC)
);
GO