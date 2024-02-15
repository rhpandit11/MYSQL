/*write a sql to find the total number of people present inside the hospital*/
-- 1-out, 2 - in, 3-in, 4-in,5-out
--method 1
with cte as (
    SELECT emp_id,
max(CASE when `action` = 'in' then time end) as intime,
max(CASE when `action` = 'out' then time end) as outime
FROM hospital
GROUP BY emp_id
)
select * from cte 
where intime>outime or outime is NULL;

--method 2 
SELECT emp_id,
max(CASE when `action` = 'in' then time end) as intime,
max(CASE when `action` = 'out' then time end) as outime
FROM hospital
GROUP BY emp_id
HAVING max(CASE when `action` = 'in' then time end) > max(CASE when `action` = 'out' then time end)
or max(CASE when `action` = 'out' then time end)  is NULL;


--method 3 
with intime as (
    select emp_id, max(time) as latest_in_time
    from hospital 
    WHERE action = 'in'
    GROUP BY emp_id
),
outtime as (
    select emp_id, max(time) as latest_out_time
    from hospital 
    WHERE action = 'out'
    GROUP BY emp_id
)
select * FROM
intime
left join outtime on intime.emp_id=outtime.emp_id
where latest_in_time > latest_out_time and latest_out_time is NULL;


--method 4
WITH CTE AS (
SELECT *,
  RANK() OVER (PARTITION BY emp_id ORDER BY time DESC) rnk
FROM hospital 
)
SELECT *
FROM CTE
WHERE rnk=1
AND action='in'

