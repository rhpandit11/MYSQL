/* FIRST_VALUE and LAST_VALUE master class function.*/

SELECT *,
FIRST_VALUE(emp_name) OVER(ORDER BY salary) as lowest_salary_emp
from employee1;

/* FIRST_VALUE()-> ye first value deta hai according to over(order by salary) p is 
query me FIRST_VALUE(emp_name) hai jo ki ayega based on OVER(order by salary)
matlab jiska salary asc sabse kam hai uska naam do that's why output me sabi column me sirf 
uska naam ayega.*/

SELECT *,
FIRST_VALUE(emp_name) OVER(PARTITION BY dept_id ORDER BY emp_age) as youngest_emp
from employee1;


SELECT *,
LAST_VALUE(emp_name) OVER(PARTITION BY dept_id ORDER BY emp_age RANGE BETWEEN current row and UNBOUNDED FOLLOWING) as youngest_emp
from employee1;

/* LAST_VALUE function not work like FIRST_VALUE FUNCTION 
because LAST_VALUE function ke pass sirf current row ka hi information hai toh uske liye wo sirf us row ka value ko hi return kareg,
iss problem ko solve karne ke liye hume RANGE BETWEEN current row and UNBOUNDED following define karna padega
taaki ye query till last column tak last value check kar sake*/

