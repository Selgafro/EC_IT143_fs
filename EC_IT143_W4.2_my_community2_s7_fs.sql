CREATE PROCEDURE dbo.usp_community2_simpsons
AS

/******************************************************************************************************************

NAME: dbo.v_community2_simpsons
PURPOSE: Creat the Total Amount Spent - User stored procedure 

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

		TRUNCATE TABLE dbo.t_community2_simpsons

		INSERT INTO dbo.t_community2_simpsons
			SELECT v.Member
				, v.[Amount Spent]
			FROM dbo.v_community2_simpsons AS v;

		-- Review results

		SELECT *
		FROM dbo.t_community2_simpsons
	END;
GO