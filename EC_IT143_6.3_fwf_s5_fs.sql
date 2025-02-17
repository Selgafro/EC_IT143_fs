CREATE FUNCTION [dbo].[udf_parse_FirstName]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)
/***************************************************************************************************
NAME:	dbo.udf_parse_FirstName
PURPOSE: Parse First Name combined name

MODIFICATION LOG:
Ver			Date			  Author			Description
------	------------	------------------		------------------------------------------------
1.0		  17/2/2025		     FSELEMANI			1. Built this script for EC IT440

RUNTIME:
1s

NOTES:
Adapted from the following:
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

**************************************************************************************************/

	BEGIN
		DECLARE @v_first_name AS VARCHAR(100);

		SET @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') - 1);

		RETURN @v_first_name;

	END;

GO
