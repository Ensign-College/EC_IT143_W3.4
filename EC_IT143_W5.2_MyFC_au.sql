/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_MyFC_au.sql
PURPOSE: Answer four stakeholder questions for the MyFC soccer community dataset using T-SQL joins and aggregations.

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   --------------   -------------------------------------------------------------------------------
1.0     11/24/2026   Aniekan Umana    1. Built this script for EC IT143 W5.2 My Communities Analysis - Create Answers


RUNTIME: 
0m 1s

NOTES: 
Answers three questions authored by Aniekan Umana and one question authored by a classmate from W4.3/W4.4.
******************************************************************************************************************/

USE MyFC;
GO

-- Q1 (Author: Aniekan Umana): Which players earned the highest total monthly salary across all recorded reporting dates?
-- A1: Join tblPlayerDim and tblPlayerFact on pl_id, sum mtd_salary, and rank players from highest to lowest total pay.
SELECT pd.pl_id,
       pd.pl_name AS PlayerName,
       pd.pl_num AS JerseyNumber,
       SUM(pf.mtd_salary) AS TotalMTDSalary
  FROM dbo.tblPlayerDim AS pd
       INNER JOIN dbo.tblPlayerFact AS pf
               ON pd.pl_id = pf.pl_id
 GROUP BY pd.pl_id,
          pd.pl_name,
          pd.pl_num
 ORDER BY TotalMTDSalary DESC;
GO

-- Q2 (Author: Aniekan Umana): What is the average monthly salary paid to players within each field position?
-- A2: Join tblPositionDim, tblPlayerDim, and tblPlayerFact to calculate average mtd_salary per position.
SELECT pos.p_code AS PositionCode,
       pos.p_name AS PositionName,
       COUNT(DISTINCT pd.pl_id) AS PlayerCount,
       AVG(pf.mtd_salary) AS AvgMonthlySalary
  FROM dbo.tblPositionDim AS pos
       INNER JOIN dbo.tblPlayerDim AS pd
               ON pos.p_id = pd.p_id
       INNER JOIN dbo.tblPlayerFact AS pf
               ON pd.pl_id = pf.pl_id
 GROUP BY pos.p_code,
          pos.p_name
 ORDER BY AvgMonthlySalary DESC;
GO

-- Q3 (Author: Aniekan Umana): How does total monthly payroll compare across different team codes during the final quarter of the year?
-- A3: Join tblTeamDim, tblPlayerDim, tblPlayerFact, and DateDim, filtering quarter_number = 4 to compare Q4 payroll.
SELECT td.t_code AS TeamCode,
       dd.quarter_name AS QuarterName,
       SUM(pf.mtd_salary) AS TotalQ4Payroll
  FROM dbo.tblTeamDim AS td
       INNER JOIN dbo.tblPlayerDim AS pd
               ON td.t_id = pd.t_id
       INNER JOIN dbo.tblPlayerFact AS pf
               ON pd.pl_id = pf.pl_id
       INNER JOIN dbo.DateDim AS dd
               ON pf.as_of_date = dd.day_date
 WHERE dd.quarter_number = 4
 GROUP BY td.t_code,
          dd.quarter_name
 ORDER BY TotalQ4Payroll DESC;
GO

-- Q4 (Author: Classmate from W4.3 Discussion - e.g., Francis Ezieke): How many players are assigned to each team and field position compared to the position target?
-- A4: Join tblTeamDim, tblPositionDim, and tblPlayerDim to compare actual player counts against p_target.
SELECT td.t_code AS TeamCode,
       pos.p_name AS PositionName,
       pos.p_target AS TargetCount,
       COUNT(pd.pl_id) AS ActualPlayerCount
  FROM dbo.tblTeamDim AS td
       INNER JOIN dbo.tblPlayerDim AS pd
               ON td.t_id = pd.t_id
       INNER JOIN dbo.tblPositionDim AS pos
               ON pd.p_id = pos.p_id
 GROUP BY td.t_code,
          pos.p_name,
          pos.p_target
 ORDER BY td.t_code,
          pos.p_name;
GO
