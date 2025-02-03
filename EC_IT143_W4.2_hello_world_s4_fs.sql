DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS
/******************************************************************************************************************

NAME: dbo.v_hello_world_load
PURPOSE: Creat the Hello World - Load View 

MODIFICATION LOG:
Ver		Date		Author				Description
-----	-----		----------			---------------------------------------
1.0		2/3/2025	FSelemani			1. Built this script for EC IT 143

RUNTIME:
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/
	SELECT 'Hello World' AS MyMessage
		, GETDATE() AS CurrentDateTime;

