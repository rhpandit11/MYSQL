SELECT * FROM 
(
    SELECT *,
    case when country = 'India' THEN 1 else 0 end as country_deriverd
    FROM happiness_index
) a 
ORDER BY country_deriverd desc, `Happiness_2021 ` DESC


SELECT * FROM 
(
    SELECT *,
    case 
    when country = 'India' THEN 3
    when country = 'Pakistan' THEN 2
    WHEN `Country` = 'Sri Lanka' THEN 1
    else 0 
    end as country_deriverd
    FROM happiness_index
) a 
ORDER BY country_deriverd desc, `Happiness_2021 ` DESC



SELECT *
    FROM happiness_index
ORDER BY  
case 
    when country = 'India' THEN 3
    when country = 'Pakistan' THEN 2
    WHEN `Country` = 'Sri Lanka' THEN 1
else 0 end  desc, `Happiness_2021 ` DESC
