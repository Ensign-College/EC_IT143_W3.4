-- Q: How many total family members are in the Simpsons Family Data table?
-- A: Let's count the rows in dbo.Family_Data to find out.

-- 1) Reload data
TRUNCATE TABLE dbo.t_simpsons_member_count;

INSERT INTO dbo.t_simpsons_member_count
       SELECT v.total_family_members
         FROM dbo.v_simpsons_member_count_load AS v;

-- 2) Review results
SELECT t.*
  FROM dbo.t_simpsons_member_count AS t;
