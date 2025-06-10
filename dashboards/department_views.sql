as HR user run:


CREATE OR REPLACE VIEW hr_dashboard AS
SELECT 
  COUNT(*) AS total_employees,
  SUM(salary) AS total_salary,
  AVG(salary) AS avg_salary,
  MIN(salary) AS lowest_salary,
  MAX(salary) AS highest_salary
FROM employees;


create similar dashboads for remaining departments such as finance/ sales  



 