DROP PROCEDURE IF EXISTS dbo.usp_myfc_record_count_load;
GO

CREATE PROCEDURE dbo.usp_myfc_record_count_load
AS
/*****************************************************************************************************************
NAME:    dbo.usp_myfc_record_count_load
PURPOSE: My FC Record Count - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   --------------   -------------------------------------------------------------------------------
1.0     11/22/2026   Aniekan Umana    1. Built this stored procedure for EC IT143 W4.2 My FC Analysis

RUNTIME: 
0m 1s

NOTES: 
Script for step 7 of the Answer-Focused Approach.
******************************************************************************************************************/
BEGIN
    -- 1) Reload data
    TRUNCATE TABLE dbo.t_myfc_record_count;

    INSERT INTO dbo.t_myfc_record_count
           SELECT v.total_myfc_records
             FROM dbo.v_myfc_record_count_load AS v;

    -- 2) Review results
    SELECT t.*
      FROM dbo.t_myfc_record_count AS t;
END;
GO
