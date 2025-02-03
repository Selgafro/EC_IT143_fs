DROP VIEW IF EXISTS dbo.v_community1_myfc;
GO

CREATE VIEW dbo.v_community1_myfc
AS
/******************************************************************************************************************

NAME: dbo.v_community1_myfc
PURPOSE: Creat the Hello World - Load View 

MODIFICATION LOG:
Ver		Date		Author				Description
-----	-----		----------			---------------------------------------
1.0		2/3/2025	FSelemani			1. Built this script for EC IT 143

RUNTIME:
1s

NOTES:
This script is a practice on step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

	SELECT TOP 1 'Total Player Salary Per Month' AS Description
		, SUM(mtd_salary) AS MonthlySalary
	FROM [tblPlayerFact]
	GROUP BY as_of_date