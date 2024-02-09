/* how to use group by and rank(window functions together)
will understand with a question where we need to find top 5 products in each category by sales.*/

with sales_value as
 (
    SELECT category, product_name, SUM(`Sales`) as total_sales 
    from orders GROUP BY `Category`,product_name
 )
 SELECT * FROM 
 (
     SELECT 
    *,
    RANK() OVER(PARTITION BY category ORDER BY total_sales desc) as rn
    from sales_value
 ) A
where rn<=5;

 /* har ek category wise sale nikalne ke liye pahel sum of sales nikal lenge
 fir us query ko cte ke andar dal denge
 aur fir sab column select kark rank() aur PARTITION BY category and order by total_sales kar denge aur iss QUERY
 ko from cte se data retrieve karenge.*/


SELECT * FROM
(
    SELECT 
    category,
    product_name,
    sum(sales) as total_sales,
    rank() OVER(PARTITION BY category ORDER BY total_sales ) as rn
    from orders
    GROUP BY `Category`,`Product_Name`
) A
where rn<=5;

/* is query me pahle group by execute hoga, fir AGGREGATE value execute hoga and then uss data PARTITION  hoga*/