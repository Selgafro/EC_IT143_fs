/*
Searching for all person names where their middle name is G
*/
SELECT TOP (1000) [BusinessEntityID]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
  FROM [AdventureWorks2022].[Person].[Person]
  WHERE MiddleName = 'G'


/*
Copy the missing index details and modify its name
*/
USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX [<IX_MyIndex>]
ON [Person].[Person] ([MiddleName])
INCLUDE ([FirstName],[LastName])
GO