-- Q: How many total family members are in the Simpsons Family Data table?
-- A: Let's count the rows in dbo.Family_Data to find out.

SELECT COUNT(*) AS total_family_members
  FROM dbo.Family_Data;
