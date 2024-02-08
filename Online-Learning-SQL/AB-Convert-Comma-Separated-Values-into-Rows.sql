SELECT * FROM airbnb_searches;

--split()
select value from string_split('entire home,private room',',');

with room as
(select sum(case when filter_room_types like '%entire%' then 1 else 0 end) as en,
sum(case when filter_room_types like '%private%' then 1 else 0 end) as pr,
sum(case when filter_room_types like '%shared%' then 1 else 0 end) as sh
from airbnb_searches)
select 'entire home' as  value,en cnt from room
union all
select 'private room' as value,pr cnt from room
union all
select 'shared room' as value,sh cnt from room
order by cnt desc;