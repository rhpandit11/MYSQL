SELECT
*
from employee;

SELECT
emp_id,
emp_name,
dept_id,
salary,
RANK() OVER(order by salary desc) as rnk
from employee;

--rank() -> rank function sabhi row ke value ko unique number provide karta hai
-- aur agar row ka value same hota hai toh ye fir previous value ko hi show karta hai present me
-- aur next new unique row ke value ke liye previous value sse one step ahead jaake new value deta ha
-- matlab duplicate hone se next value skip kar dega.

SELECT
emp_id,
emp_name,
dept_id,
salary,
DENSE_RANK() OVER(order by salary desc) as rnk
from employee;

--dense_rank() -> rank ke problem ko solve karta hai
--isme koi bhi rank ki value skip nahi hoti hai agar value DUPLICATE
-- bhi hua to bhi nahi.

SELECT
emp_id,
emp_name,
dept_id,
salary,
ROW_NUMBER() OVER(order by salary desc) as rnk
from employee;

--row_number -> running rank value deta hai.

SELECT
emp_id,
emp_name,
dept_id,
salary,
RANK() OVER(PARTITION BY salary order by salary desc) as rnk,
DENSE_RANK() OVER(PARTITION BY salary order by salary desc) as dense_rnk,
ROW_NUMBER() OVER(PARTITION BY salary order by salary desc) as rn
from employee;

--Interview question
select * from 
(
SELECT
emp_id,
emp_name,
dept_id,
salary,
RANK() OVER(PARTITION BY dept_id order by salary desc) as rnk
from employee
) a 
where rnk  = 1

