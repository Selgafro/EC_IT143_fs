CREATE PROCEDURE dbo.usp_community1_myfc
AS

/******************************************************************************************************************

NAME: dbo.v_community1_myfc
PURPOSE: Community 1 - Load user stored procedure 

MODIFICATION LOG:
Ver		Date		Author				Description
-----	-----		----------			---------------------------------------
1.0		2/3/2025	FSelemani			1. Built this script for EC IT 143

RUNTIME:
1s

NOTES:
This script is a practice on step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

	BEGIN

		-- 1) Reload data

		TRUNCATE TABLE dbo.t_community1_myfc;

		INSERT INTO dbo.t_community1_myfc
			SELECT v.Descript
				, v.MonthlySalary
			FROM dbo.v_community1_myfc AS v;

			-- 2) Review results
		SELECT t.*
		FROM dbo.t_community1_myfc AS t;
	END
GO