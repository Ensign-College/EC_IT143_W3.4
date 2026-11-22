-- Q: How many total family members are in the Simpsons Family Data table?
-- A: Let's count the rows in dbo.Family_Data to find out.

SELECT v.total_family_members
  INTO dbo.t_simpsons_member_count
  FROM dbo.v_simpsons_member_count_load AS v;
