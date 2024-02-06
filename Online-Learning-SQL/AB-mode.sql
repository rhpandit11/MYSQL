--calculate mode USING SQL (mode means most frequent value in given COLUMN)
--1,2,3,3,3,4,5,6,6

--method 1 cte
with freq_cte as (
                    select id,count(*) as freq from mode GROUP BY id
                )
SELECT * from freq_cte
where freq = (select max(freq) from freq_cte)

select * from mode;
INSERT INTO mode VALUES (4)

--method 2 with rank
with freq_cte as (
                    select id,count(*) as freq from mode GROUP BY id
                ),
rnk_cte as (
select *, rank() over(order by freq desc) as rn from freq_cte)
SELECT * from rnk_cte where rn=1




