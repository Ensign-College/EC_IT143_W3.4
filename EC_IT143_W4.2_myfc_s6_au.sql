-- Q: How many total records are in the My FC dataset table?
-- A: Let's count the rows in dbo.[YourMyFCTable] to find out.

-- 1) Reload data
TRUNCATE TABLE dbo.t_myfc_record_count;

INSERT INTO dbo.t_myfc_record_count
       SELECT v.total_myfc_records
         FROM dbo.v_myfc_record_count_load AS v;

-- 2) Review results
SELECT t.*
  FROM dbo.t_myfc_record_count AS t;
