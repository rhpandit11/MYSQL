/* write a sql to return all employee whose salary is same in same department*/

with sal_dep as 
(
SELECT
dept_id, salary
from emp_salary
GROUP BY dept_id,salary
HAVING count(*)>1
) 
SELECT es.*
from emp_salary es
INNER join sal_dep on es.dept_id = sal_dep.dept_id and es.salary=sal_dep.salary
