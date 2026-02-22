select a.department_name, b.first_name, b.last_name
from L_DEPARTMENTS a 
FULL JOIN L_EMPLOYEES b ON a.dept_code = b.dept_code;

select a.department_name, b.first_name, b.last_name
from L_EMPLOYEES b 
RIGHT JOIN L_DEPARTMENTS a ON a.dept_code = b.dept_code;

select a.department_name, b.first_name, b.last_name
from L_DEPARTMENTS a 
FULL JOIN sec1405_employees b ON a.dept_code = b.dept_code;

SELECT * FROM L_DEPARTMENTS
UNION ALL
SELECT * FROM sec1407_departments;