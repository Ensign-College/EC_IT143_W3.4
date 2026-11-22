-- Q: How many total records are in the My FC dataset table?
-- A: Let's count the rows in dbo.[YourMyFCTable] to find out.

SELECT v.total_myfc_records
  INTO dbo.t_myfc_record_count
  FROM dbo.v_myfc_record_count_load AS v;
