select 
*
from emp 
LEFT JOIN dept on emp.dep_id = dept.dep_id

select 
*
from emp 
LEFT JOIN dept on emp.dep_id = dept.dep_id and dept.dep_name='Analytics';
--agar hum join me and kark agar koi filter add karte hai tab
-- pahle table p FILTER apply hoga aur fir join apply hoga
--matlab first filter execute hoga aur fir join execute hoga on filter table.


select 
*
from emp 
LEFT JOIN (select * from dept where dept.dep_name='Analytics') dept on emp.dep_id = dept.dep_id;
-- isme bhi same result hi ayega.

select 
*
from emp 
LEFT JOIN dept on emp.dep_id = dept.dep_id 
where dept.dep_name='Analytics';
-- agar hum ye condition where clause me karenge toh
-- pahle join ka query execute hoga aur fir condition execute hoga.
-- why? quki dept table right table se aa rha hai jab tak join ki query execute nahi hogi 
--tab tak right table nahi ayega aur uske aane ke baad CONDITION will apply