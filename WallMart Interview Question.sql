--Assume you are given the following tables on Walmart transactions and products. 
--Find the number of unique product combinations that are purchased in the same transaction.

--For example, if there are 2 transactions where apples and bananas are bought, and another 
--transaction where bananas and soy milk are bought, my output would be 2 to represent the 2 unique combinations.

--Assumptions:

--For each transaction, a maximum of 2 products is purchased.
--You may or may not need to use the products table.
--P.S. Solution is updated as of 1 Feb 2023.

--transactions Table:
--Column Name	Type
--transaction_id	integer
--product_id	integer
--user_id	integer
--transaction_date	datetime
--transactions Example Input:
--transaction_id	product_id	user_id	transaction_date
--231574	111	234	03/01/2022 12:00:00
--231574	444	234	03/01/2022 12:00:00
--231574	222	234	03/01/2022 12:00:00
--137124	111	125	03/05/2022 12:00:00
--137124	444	125	03/05/2022 12:00:00
--products Table:
--Column Name	Type
--product_id	integer
--product_name	string
--products Example Input:
--product_id	product_name
--111	apple
--222	soy milk
--333	instant oatmeal
--444	banana
--555	chia seed
--Example Output:
--unique_pairs
--4
--There are 4 unique purchase combinations present in the example data.

--The dataset you are querying against may have different input & output - this is just an example!


Select COUNT(distinct T1.product_id) From Transactions_Walmart T1 
Inner Join Transactions_Walmart T2
On T1.transaction_date=T2.transaction_date
And T1.users_id=T2.users_id