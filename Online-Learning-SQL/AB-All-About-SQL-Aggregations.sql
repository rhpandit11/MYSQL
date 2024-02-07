-- sum(), avg(), min(), max()

SELECT 
salesperson_id,
order_number,
order_date,
amount
from int_orders;

--simple SUM
SELECT
SUM(amount)
from int_orders;

SELECT 
salesperson_id,order_number ,SUM(amount)
from int_orders
GROUP BY salesperson_id,order_number;

--group by me wahi column le sakte hai jo ki select me hoga 
--isko overcome karne k liye hum window function use karenge
--matlab agar group by me dono hi use karna hoga.isko overcome karne k liye window FUNCTION
--use karenge.

SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over()
from int_orders;
--over() yha p ek window open karega lekin isme value total sum of amount hi hoga
--quki humne uske andar koi CONDITION nahi diya hai.

SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over(PARTITION BY salesperson_id) 
from int_orders;
--partition by ab us window me data salesperson_id ke each sale ke pura dikhayega

SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over(ORDER BY order_date) 
from int_orders;

-- ORDER BY data ab ek runnin sum ki tarah kaam karega, ye date ke hisab se NEXT
-- value ke liye iske previous jitne value hai usko sum kark next value me present karega.


SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over(PARTITION BY salesperson_id ORDER BY order_date) 
from int_orders;

-- ab is WINDOW me har ek salesperson_id ka data sum hoga ORDER BY date ke hisab se
-- aur jaise hi us salesperson_id ka data complete hojayega aur naya value ayega
-- tab running sum fir se start hoga aur next value ke liye fir se running sum karega
-- jab tak uska id change nahi ho jata hai.

SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over(ORDER BY order_date rows BETWEEN 2 PRECEDING and current row) 
from int_orders;

-- ab yha p 2 PRECEDING matlab current value ke pahle 2 row aur fir curren row uska sum window me show karega
-- matlab id 7 ka last amount + previous 2 amount jo ki hai 600+720+150 = 1470 is tarah se.ADD
-- note agar previous value upar me sirf ek hai to woh usko + current value ko sum karega jaise ki 460+540 = 1000

SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over(ORDER BY order_date rows BETWEEN 2 PRECEDING and 1 PRECEDING) 
from int_orders;

-- ab isme 2 preceding matlab current value ke aage ke do value ka hi sum hoga.
-- note aur agar previou value nahi hai toh null show karega.
-- jaise ki 540 ka previous hai 460 toh wo sum ke window me 460 show karega
-- aur 2400 ke prevoius value hai 460+540 = 1000 toh current value 2400 me woh previous ke do value ka sum show karega.

SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over(ORDER BY order_date rows BETWEEN 1 PRECEDING and 1 FOLLOWING) 
from int_orders;

-- ab yaha p 1 PRECEDING aur 1 FOLLOWING hai iska matlab current value ke ek prevous value aur current value ke one next value aur inke bich
-- current value bhi ata hai toh usko bhi sum me add kark result WINDOW me show karega.
-- example 460 ke aage koi valur nahi hai toh wo 1 FOLLOWING jaake dono ko sum karega i.e 460+540 = 1000
-- aur ab 540 ke liye 460+540+2400 = 3400 hota hai.

SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over(ORDER BY order_date rows BETWEEN UNBOUNDED PRECEDING and current row) 
from int_orders;

-- UNBOUNDED PRECEDING aur current row matlab prevoius sabi row + current row ka value ka sum hoga.
-- 540 ke liye 460+540 = 1000, 1800 ke liye 460+540+2400+600+720+150+1800 = 6670

SELECT salesperson_id,
order_number,
order_date,
amount,
SUM(amount) over(PARTITION BY salesperson_id ORDER BY order_date rows BETWEEN 1 PRECEDING and current row) 
from int_orders;

-- ab joh hai window jo hai wo partition ho gaya hai salesperson_id ke hisab se matlab
-- hur salesperson_id ke value change pe ek naya window opern hoga
-- salesperson_id -> 1 ke liye ruuning sum 460hi hoga
-- salesperson_id -> 2 ke liye ruuning sum 540 hi hoga
-- but SECOND time salesperson_id -> 2 ke liye ruuning sum 540+2400=2940 hoga
-- aur salesperson_id-> 7 matlab new window start do value fir se start hoga running sum ka 600
-- aur second time ke liye salesperson_id-> 7 matlab 600+720 = 1320 running sum me ayega.