DROP VIEW IF EXISTS dbo.v_community2_simpsons;
GO

CREATE VIEW dbo.v_community2_simpsons
AS

/******************************************************************************************************************

NAME: dbo.v_community2_simpsons
PURPOSE: Creat the Total Amount Spent - Load View 

MODIFICATION LOG:
Ver		Date		Author				Description
-----	-----		----------			---------------------------------------
1.0		2/3/2025	FSelemani			1. Built this script for EC IT 143

RUNTIME:
1s

NOTES:
This script is a practice on step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

	SELECT Card_Member AS Member
	, SUM(Amount) AS 'Amount Spent'
	FROM dbo.Planet_Express
	WHERE Amount < 0
	GROUP BY Card_Member;