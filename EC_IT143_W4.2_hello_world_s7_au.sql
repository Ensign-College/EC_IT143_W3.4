DROP PROCEDURE IF EXISTS dbo.usp_hello_world_load;
GO

CREATE PROCEDURE dbo.usp_hello_world_load
AS
/*****************************************************************************************************************
NAME:    dbo.usp_hello_world_load
PURPOSE: Hello World - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author           Description
-----   ----------   --------------   -------------------------------------------------------------------------------
1.0     11/22/2026   Aniekan Umana    1. Built this stored procedure for EC IT143 W4.2 Hello World

RUNTIME: 
0m 1s

NOTES: 
Script for step 7 of the Answer-Focused Approach.
******************************************************************************************************************/
BEGIN
    -- 1) Reload data
    TRUNCATE TABLE dbo.t_hello_world;

    INSERT INTO dbo.t_hello_world
           SELECT v.my_message,
                  v.current_date_time
             FROM dbo.v_hello_world_load AS v;

    -- 2) Review results
    SELECT t.*
      FROM dbo.t_hello_world AS t;
END;
GO
