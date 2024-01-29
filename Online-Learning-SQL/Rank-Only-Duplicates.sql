--rank the duplicates record
with cte as
(select id from list group by id having count(*) > 1),
cte1 as
(select id,
rank() over(order by id) as rn
from cte)
select l.id,concat('DUP',c.rn) as output from list l left join cte1 c
on l.id = c.id;

