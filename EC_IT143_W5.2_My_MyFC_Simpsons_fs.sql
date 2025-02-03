/*****************************************************************************************************************
NAME:    IT143 - Week 5.2 Assignments
PURPOSE: Translate all questions into SQL queries 

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     2/3/2025    FSELEMANI      1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

/*	Q1-MyQuestion: For past three months (Jan-Mar), how much did we spend for each player?
	A1: Using the MyFC database, add all player salaries from Jan - March
*/

SELECT 
	'Quaterly Expenses for Salary' AS Libelle	/* Creating a quaterly column */
	, SUM(mtd_salary) AS Total		/* Adding all the player salaries */
FROM dbo.tblPlayerFact		/* The table which stores player salaries */
WHERE as_of_date < '2019-04-30'		/* Filter all the player salaries to only show those from Jan-Mar */


/*	Q2-MyQuestion: Which player is highly paid in team U09? I want also to know the one with lowest annual salary. 
	A2: Join 2 tables and find the player the maximum paid salary from the U09 team.
*/

SELECT TOP 1 /* I need only one row with maximum salary */
	dbo.tblPlayerDim.pl_name AS FullName /* Player name */
	, MAX(dbo.tblPlayerFact.mtd_salary) AS MaximumSalary /* Finding the maximu salary */
FROM dbo.tblPlayerDim /* Table where fullname is coming from */
	INNER JOIN dbo.tblPlayerFact	/* Joined to the salary table, where we take the maximum salary */
		ON dbo.tblPlayerDim.pl_id = dbo.tblPlayerFact.pl_id	/* The join key */
WHERE t_id = 11		/* With a condition statement, selecting only the team U09 id, 11 */
GROUP BY dbo.tblPlayerDim.pl_name 
ORDER BY MaximumSalary DESC; /* Descendant order to show me the maximum from all players. */


/*	Q3-MyQuestion: I need to see all players with less than 1 million. 
	A3: Join 2 tables and find all the players with less than 1 million.
*/
SELECT /* I need only one row with maximum salary */
	dbo.tblPlayerDim.pl_name AS FullName /* Player name */
	, SUM(dbo.tblPlayerFact.mtd_salary) AS AnnualSalary /* Finding the maximu salary */
FROM dbo.tblPlayerDim /* Table where fullname is coming from */
	INNER JOIN dbo.tblPlayerFact	/* Joined to the salary table, where we take the maximum salary */
		ON dbo.tblPlayerDim.pl_id = dbo.tblPlayerFact.pl_id	/* The join key */
GROUP BY dbo.tblPlayerDim.pl_name
HAVING SUM(dbo.tblPlayerFact.mtd_salary) < 1000000 /* Show only salary less than 1 million. */
ORDER BY AnnualSalary DESC;


/*	Q4-AnotherStudent: I am in favor of Team 6 U14 and want to know more details about them. 
					Who are in team 6 and what are each of their salaries? Please include team 
					code to make it easy for me to view the team. 
	A4: Join 2 tables and find all the players and their salary in Team 6.
*/

SELECT 
	dbo.tblPlayerDim.t_id
	, dbo.tblPlayerDim.pl_name AS FullName /* Player name */
	, SUM(dbo.tblPlayerFact.mtd_salary) AS Salary /* Finding the maximu salary */
FROM dbo.tblPlayerDim /* Table where fullname is coming from */
	INNER JOIN dbo.tblPlayerFact	/* Joined to the salary table, where we take the maximum salary */
		ON dbo.tblPlayerDim.pl_id = dbo.tblPlayerFact.pl_id	/* The join key */
WHERE t_id = 6 /* Checking for only team id 6 */
GROUP BY dbo.tblPlayerDim.pl_name, dbo.tblPlayerDim.t_id
ORDER BY Salary;


/*	Q5-MyQuestion: Check the balance of Homer Simpson on his debit, credit, and bank account.
	A5: Join 2 tables (Planet_Express and FBS_Viza_Costmo) and find the balance.
*/
SELECT 
	FBS_Viza_Costmo.Member_Name
	, SUM(Planet_Express.Amount) AS BankAccount
	, SUM(FBS_Viza_Costmo.Debit) AS DebitCard
	, SUM(FBS_Viza_Costmo.Credit) AS CreditCard
FROM FBS_Viza_Costmo
	FULL JOIN Planet_Express
		ON FBS_Viza_Costmo.Member_Name = Planet_Express.Card_Member
WHERE Member_Name = 'Homer Simpson'
GROUP BY FBS_Viza_Costmo.Member_Name


/*	Q6-MyQuestion: Which account has Simpson's wife( Marge Simpson spent a lot of money in?
	A6: Join 2 tables (Planet_Express and FBS_Viza_Costmo) and find out the total expenses.
*/
SELECT 
	FVC.Member_Name AS MemberName
	, SUM(PE.Amount) AS BankAccount
	, SUM(FVC.Debit) AS DebitCard
	, SUM(FVC.Credit) AS CreditCard
FROM FBS_Viza_Costmo AS FVC
	FULL JOIN Planet_Express AS PE
		ON FVC.Member_Name = PE.Card_Member
WHERE Member_Name = 'Marge Simpson'
GROUP BY FVC.Member_Name


/*	Q7-MyQuestion: I want to see the date, name, credit, debit, and account of all the expenses for Jan 1989.
	A7: Join 2 tables (Planet_Express and FBS_Viza_Costmo) and find out the total expenses.
*/
SELECT 
	( SELECT PE.Date FROM Planet_Express AS PE
		UNION ALL
		SELECT FVC.Date FROM FBS_Viza_Costmo AS FVC)
	, FVC.Member_Name
	, SUM(PE.Amount) AS BankAccount
	, SUM(FVC.Debit) AS DebitCard 
	, SUM(FVC.Credit) AS CreditCard
FROM FBS_Viza_Costmo AS FVC
	FULL JOIN Planet_Express AS PE
		ON FVC.Member_Name = PE.Card_Member
WHERE PE.Date < '1989-02-01 00:00:00.0000000' AND FVC.Date < '1989-02-01 00:00:00.0000000'
GROUP BY FVC.Member_Name, PE.Date, FVC.Date


/*	Q8-AnotherStudent: Marge was a housewife since December 17, 1989 and she has spent money 
						before that date using another money source. What are the expenses 
						Marge spent on before her hire date?
	A8: Join 2 tables (Planet_Express and FBS_Viza_Costmo) and find out the total expenses.
*/
SELECT 
	FVC.Member_Name AS MemberName
	, SUM(PE.Amount) AS BankAccount
	, SUM(FVC.Debit) AS DebitCard
	, SUM(FVC.Credit) AS CreditCard
FROM FBS_Viza_Costmo AS FVC
	FULL JOIN Planet_Express AS PE
		ON FVC.Member_Name = PE.Card_Member
WHERE Member_Name = 'Marge Simpson' AND PE.Date < '1989-12-17' AND FVC.Date < '1989-12-17'
GROUP BY FVC.Member_Name