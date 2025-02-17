-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an after update trigger?

-- Q3: Did it work?
-- A3: Well, lets see... yup

-- Remove stuff if it is already there
DELETE FROM dbo.t_hello_world
	WHERE MyMessage IN ('Hello world2', 'Hello World3', 'Hello World4');

-- Load test rows
INSERT INTO dbo.t_hello_world(MyMessage)
VALUES('Hello World2'), ('Hello World3');

-- See if the trigger worked
SELECT
	t.*
FROM dbo.t_hello_world AS t;

-- Try it again
UPDATE dbo.t_hello_world SET MyMessage = 'Hello World4'
WHERE MyMessage = 'Hello World3';

-- See if the trigger worked
SELECT 
	t.*
FROM dbo.t_hello_world AS t;

-- Q4: How to keep track of who last modified a record?
-- A4: This works for server user and the initial INSERT...

ALTER TABLE dbo.t_hello_world
ADD LastModifiedBy VARCHAR(50) DEFAULT SUSER_NAME();
