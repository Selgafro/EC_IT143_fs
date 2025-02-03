DROP TABLE IF EXISTS dbo.t_hello_world;
GO

CREATE TABLE dbo_t_hello_world
	(MyMessage	VARCHAR(25) NOT NULL
	, CurrentDateTime DATETIME NOT NULL
		DEFAULT GETDATE()
	, CONSTRAINT PK_t_hello_world PRIMARY KEY CLUSTERED(MyMessage ASC)
);
GO