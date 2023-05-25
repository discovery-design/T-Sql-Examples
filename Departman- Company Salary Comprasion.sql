
--Given two tables below, write a query to display the comparison result
--(higher/lower/same) of the average salary of employees in a department to the company’s average salary.


-- Table: salary
-- | id | employee_id | amount | pay_date   |
-- |----|-------------|--------|------------|
-- | 1  | 1           | 9000   | 2017-03-31 |
-- | 2  | 2           | 6000   | 2017-03-31 |
-- | 3  | 3           | 10000  | 2017-03-31 |
-- | 4  | 1           | 7000   | 2017-02-28 |
-- | 5  | 2           | 6000   | 2017-02-28 |
-- | 6  | 3           | 8000   | 2017-02-28 |
 

-- The employee_id column refers to the employee_id in the following table employee.
 

-- | employee_id | department_id |
-- |-------------|---------------|
-- | 1           | 1             |
-- | 2           | 2             |
-- | 3           | 2             |
 

-- So for the sample data above, the result is:
 

-- | pay_month | department_id | comparison  |
-- |-----------|---------------|-------------|
-- | 2017-03   | 1             | higher      |
-- | 2017-03   | 2             | lower       |
-- | 2017-02   | 1             | same        |
-- | 2017-02   | 2             | same        |
 

Select A.department_id,Case When A.Ortalama>B.GenelORT Then 'Higher'
                                       When A.Ortalama=B.GenelORT Then 'Same'
									   When A.Ortalama<B.GenelORT Then 'Lower' Else '' End ,A.*,B.*

From ( Select e.department_id,s.pay_date,
AVG(s.amount) as Ortalama From salary s 
 Inner Join employee e
 On s.employee_id=e.employee_id
 Group By e.department_id,s.pay_date

) AS A
inner  Join 
(
Select AVG(s.amount)as GenelORT,s.pay_date  From salary s
Group by s.pay_date ) AS B on B.pay_date=A.pay_date

