/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Simpsons_au.sql
PURPOSE: Answer four stakeholder questions for the Simpsons community dataset using T-SQL joins and aggregations.

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   --------------   -------------------------------------------------------------------------------
1.0     11/24/2026   Aniekan Umana    1. Built this script for EC IT143 W5.2 My Communities Analysis - Create Answers


RUNTIME: 
0m 1s

NOTES: 
Answers three questions authored by Aniekan Umana and one question authored by a classmate from W4.3/W4.4.
******************************************************************************************************************/

USE EC_IT143_DA;
GO

-- Q1 (Author: Aniekan Umana): Which employees spent the highest total amount on Planet Express credit card purchases?
-- A1: Join Family_Data and [Planet Express] on employee name, sum Amount, and sort descending.
SELECT fd.Name AS EmployeeName,
       fd.Department,
       COUNT(pe.Amount) AS TransactionCount,
       SUM(pe.Amount) AS TotalPlanetExpressSpend
  FROM dbo.Family_Data AS fd
       INNER JOIN dbo.[Planet Express] AS pe
               ON fd.Name = pe.Card_Member
 GROUP BY fd.Name,
          fd.Department
 ORDER BY TotalPlanetExpressSpend DESC;
GO

-- Q2 (Author: Aniekan Umana): How much total debit spending did each active employee incur on the FBS Viza Costmo card?
-- A2: Join Family_Data and FBS_Viza_Costmo where Status = 'Active', summing Debit transactions per employee.
SELECT fd.Name AS EmployeeName,
       fd.Job_Title,
       fd.Status,
       SUM(fvc.Debit) AS TotalVizaDebitSpend
  FROM dbo.Family_Data AS fd
       INNER JOIN dbo.FBS_Viza_Costmo AS fvc
               ON fd.Name = fvc.Member_Name
 WHERE fd.Status = 'Active'
 GROUP BY fd.Name,
          fd.Job_Title,
          fd.Status
 ORDER BY TotalVizaDebitSpend DESC;
GO

-- Q3 (Author: Aniekan Umana): Which expense categories had the highest average transaction cost among employees managed by each department manager?
-- A3: Join Family_Data and [Planet Express] and group by Manager and Category to compute AVG(Amount).
SELECT fd.Manager,
       pe.Category,
       COUNT(pe.Amount) AS PurchaseCount,
       AVG(pe.Amount) AS AvgTransactionCost
  FROM dbo.Family_Data AS fd
       INNER JOIN dbo.[Planet Express] AS pe
               ON fd.Name = pe.Card_Member
 GROUP BY fd.Manager,
          pe.Category
 ORDER BY AvgTransactionCost DESC;
GO

-- Q4 (Author: Classmate from W4.3 Discussion - e.g., Augustine Foday Kargbo): What is the total credit vs. debit activity per transaction status on the FBS Viza Costmo card?
-- A4: Group FBS_Viza_Costmo by Status and aggregate total Debit and Credit amounts.
SELECT Status,
       COUNT(*) AS TotalTransactions,
       SUM(Debit) AS TotalDebit,
       SUM(Credit) AS TotalCredit
  FROM dbo.FBS_Viza_Costmo
 GROUP BY Status
 ORDER BY TotalDebit DESC;
GO
