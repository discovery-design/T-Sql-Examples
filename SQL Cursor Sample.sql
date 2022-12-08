
-- Sqlde verileri güncellemek için update cümlelerini kullanýrýz.
--Satýr satýr dönerek güncelleme yapmamýz gereken durumlarda Cursor kullanýlýr.

Select * From Employeee

employee_id name                                               experience_years
----------- -------------------------------------------------- ----------------
1           Khaled                                             3
2           Ali                                                2
3           John                                               3
4           Doe                                                2
5           HAKANSAVAS                                         10

(5 rows affected)


Declare @name nvarchar(50)

Declare crs1  Cursor For

Select [name] From Employeee

Open crs1

Fetch Next From crs1 Into @name 

While @@FETCH_STATUS=0

Begin

Update Employeee set experience_years=88 where [name]=@name 

Fetch Next From crs1 Into @name

End

Close crs1

Deallocate crs1



Select * From Employeee


employee_id name                                               experience_years
----------- -------------------------------------------------- ----------------
1           Khaled                                             88
2           Ali                                                88
3           John                                               88
4           Doe                                                88
5           HAKANSAVAS                                         88

(5 rows affected)