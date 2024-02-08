/*Write a sql to find business day between create date and resolve date by excluding weekends and public holidays*/
-- 2022-08-01 -> Monday, --2022-08-03 -> Wednesday
-- 2022-08-01 -> Monday, --2022-08-12 -> Friday
-- 2022-08-01 -> Monday, --2022-08-16 -> Tuesday

select * from tickets;

SELECT
    *,
    DATEDIFF(resolved_date, create_date) as actual_days,
    WEEK(create_date) as create_week,
    WEEK(resolved_date) as resolve_week,
    TIMESTAMPDIFF(WEEK, create_date, resolved_date) as week_diff
FROM
    tickets;


SELECT
    *,
    DATEDIFF(resolved_date, create_date) as actual_days,
    DATEDIFF(resolved_date, create_date) - 2*TIMESTAMPDIFF(WEEK, create_date, resolved_date) as business_days
FROM
    tickets;

/* business days nikalne ke liye pahle week difference nikale week defference
2022-08-01 to 2022-08-16 ke bich 2 tha matlab do weekend tha
so humne actual days se week day ko minus kardiya but wee_diff *2 because 2 weekend matlab 4 days of week so
actual days - week_day*2
*/

SELECT * 
from tickets
LEFT join holidays on holiday_date BETWEEN create_date and resolved_date;


SELECT *,
DATEDIFF(resolved_date,create_date) as actual_days,
DATEDIFF(resolved_date,create_date) - 2*TIMESTAMPDIFF(WEEK, create_date, resolved_date) - no_of_holidays as business_days
from 
(
    SELECT ticket_id,create_date,resolved_date,count(holiday_date) as no_of_holidays
    from tickets 
    LEFT join holidays on holiday_date BETWEEN create_date and resolved_date
    GROUP BY ticket_id,create_date,resolved_date
) A
