--Link:https://datalemur.com/questions/alibaba-compressed-mode

--Given a table containing the item count for each order and the frequency 
--of orders with that item count, write a query to determine the mode of the number of 
--items purchased per order on Alibaba. If there are several item counts with the same frequency, you should sort them in ascending order.

--Effective April 22nd, 2023, the problem statement and solution have been revised for enhanced clarity.

--items_per_order Table:
--Column Name	Type
--item_count	integer
--order_occurrences	integer


--items_per_order Example Input:
--item_count	order_occurrences
--1	500
--2	1000
--3	800
--4	1000
--Example Output:
--mode
--2
--4

--Explanation
--Based on the example output, the order_occurrences value of 1000 corresponds to the highest frequency among all item counts. 
--Specifically, both item counts of 2 and 4 have occurred 1000 times, making them tied for the most common number of occurrences.

--The dataset you are querying against may have different input & output - this is just an example!


With Cte as (
Select RANK()OVER(Order By order_occurrences desc) as rnk,*From items_per_order
) 

Select item_count From Cte
Where rnk=1
Order by item_count asc