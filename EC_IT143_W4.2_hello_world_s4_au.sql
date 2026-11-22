DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS
/*****************************************************************************************************************
NAME:    dbo.v_hello_world_load
PURPOSE: Create the Hello World - Load view

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   --------------   -------------------------------------------------------------------------------
1.0     11/22/2026   Aniekan Umana    1. Built this view for EC IT143 W4.2 Hello World

RUNTIME: 
0m 1s

NOTES: 
Script for step 4 of the Answer-Focused Approach.
******************************************************************************************************************/
SELECT 'Hello World' AS my_message,
       GETDATE() AS current_date_time;
GO
