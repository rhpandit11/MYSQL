SELECT * FROM emp_2020;
SELECT * FROM emp_2021;

SELECT
isnull(e20.emp_id,e21.emp_id) as emp_id,
CASE 
    WHEN e20.designation!=e21.designation THEN 'Promoted',
    WHEN e21.designation IS NULL THEN 'Resigned' 
    ELSE  'New'
END as current_status
from emp_2020 e20
FULL OUTER JOIN emp_2021 e21 on e20.emp_id=e21.emp_id
where isnull(e20.designation,'xxx') != isnull(e21.designation,'yyy') --isnull -> for handling null values.