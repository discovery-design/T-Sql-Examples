CREATE PROCEDURE EmployeInsert @EmpId int, @name varchar(50),@experince_years int

AS
INSERT INTO [dbo].[Employeee]
           ([employee_id]
           ,[name]
           ,[experience_years])
     VALUES
           (@EmpId
           ,@name
           ,@experince_years)



exec EmployeInsert 5,'HAKANSAVAS',10