
Select * from Events

business_id event_type                                         occurences
----------- -------------------------------------------------- -----------
1           reviews                                            7
3           reviews                                            3
1           ads                                                11
NULL        ads                                                NULL
NULL        ads                                                NULL
2           ads                                                7
2           ads                                                7
3           ads                                                6
1           page views                                         3
3           ads                                                6
2           page views                                         12

(11 rows affected)


--Solution 1 
With cte as (Select Row_number()over(partition by business_id ,event_type ,occurences order by business_id asc) as RNK,
business_id event_type, occurences

From Events )
delete  From cte where RNK>1

business_id event_type                                         occurences
----------- -------------------------------------------------- -----------
1           reviews                                            7
3           reviews                                            3
1           ads                                                11
NULL        ads                                                NULL
2           ads                                                7
3           ads                                                6
1           page views                                         3
2           page views                                         12

(8 rows affected)
