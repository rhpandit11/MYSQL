/* write a query to find no of gold medal per swimmer for swimmer who won only god medals*/
SELECT * FROM events;

--using subquery
select gold as player_name, COUNT(1) as no_of_medals
from events
WHERE gold not in (SELECT silver from events UNION all SELECT `BRONZE` from events)
GROUP BY `GOLD`;

--using cte

with cte as (
    SELECT gold as player_name,'gold' as medal_type from events
    UNION all SELECT silver,'silver' as medal_type from events
    union all SELECT `BRONZE`,'bronze' as medal_type from events
)
SELECT player_name,COUNT(1) as no_of_golds
from cte
GROUP BY player_name
HAVING COUNT(DISTINCT medal_type) = 1 and max(medal_type) = 'gold'