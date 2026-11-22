DROP PROCEDURE IF EXISTS dbo.usp_simpsons_member_count_load;
GO

CREATE PROCEDURE dbo.usp_simpsons_member_count_load
AS
/*****************************************************************************************************************
NAME:    dbo.usp_simpsons_member_count_load
PURPOSE: Simpsons Member Count - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   --------------   -------------------------------------------------------------------------------
1.0     11/22/2026   Aniekan Umana    1. Built this stored procedure for EC IT143 W4.2 Simpsons Analysis

RUNTIME: 
0m 1s

NOTES: 
Script for step 7 of the Answer-Focused Approach.
******************************************************************************************************************/
BEGIN
    -- 1) Reload data
    TRUNCATE TABLE dbo.t_simpsons_member_count;

    INSERT INTO dbo.t_simpsons_member_count
           SELECT v.total_family_members
             FROM dbo.v_simpsons_member_count_load AS v;

    -- 2) Review results
    SELECT t.*
      FROM dbo.t_simpsons_member_count AS t;
END;
GO
