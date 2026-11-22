DROP VIEW IF EXISTS dbo.v_myfc_record_count_load;
GO

CREATE VIEW dbo.v_myfc_record_count_load
AS
/*****************************************************************************************************************
NAME:    dbo.v_myfc_record_count_load
PURPOSE: Create the My FC Record Count - Load view

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   --------------   -------------------------------------------------------------------------------
1.0     11/22/2026   Aniekan Umana    1. Built this view for EC IT143 W4.2 My FC Analysis

RUNTIME: 
0m 1s

NOTES: 
Script for step 4 of the Answer-Focused Approach.
******************************************************************************************************************/
SELECT COUNT(*) AS total_myfc_records
  FROM dbo.[YourMyFCTable];
GO
