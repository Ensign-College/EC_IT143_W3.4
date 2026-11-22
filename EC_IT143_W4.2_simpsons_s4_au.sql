DROP VIEW IF EXISTS dbo.v_simpsons_member_count_load;
GO

CREATE VIEW dbo.v_simpsons_member_count_load
AS
/*****************************************************************************************************************
NAME:    dbo.v_simpsons_member_count_load
PURPOSE: Create the Simpsons Member Count - Load view

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   --------------   -------------------------------------------------------------------------------
1.0     11/22/2026   Aniekan Umana    1. Built this view for EC IT143 W4.2 Simpsons Analysis

RUNTIME: 
0m 1s

NOTES: 
Script for step 4 of the Answer-Focused Approach.
******************************************************************************************************************/
SELECT COUNT(*) AS total_family_members
  FROM dbo.Family_Data;
GO
