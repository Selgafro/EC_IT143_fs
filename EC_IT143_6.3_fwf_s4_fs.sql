CREATE TRIGGER trg_hello_world_last_mod ON dbo.t_hello_world
AFTER UPDATE
AS

/***************************************************************************************************
NAME:	dbo.trg_hello_world_last_mod
PURPOSE: Hello World - Last Modified Trigger

MODIFICATION LOG:
Ver			Date			  Author			Description
------	------------	------------------		------------------------------------------------
1.0		  17/2/2025		     FSELEMANI			1. Built this script for EC IT440

RUNTIME:
1s

NOTES:
Keep track of the last modified date for each row in the table

**************************************************************************************************/

	UPDATE dbo.t_hello_world
		SET
			LastModified = GETDATE()
	WHERE MyMessage IN
	(
		SELECT DISTINCT
			MyMessage
		FROM Inserted
	);