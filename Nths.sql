

--3. en yüksek deðeri getirme
--Örneðin dün en çok sipariþ veren 3. müþterinizi bulmaya çalýþýyorsunuz.
 Select Top 1* From ( Select Top 3 Column_name,COUNT(*) as Sayi From Table_Name 
  Group By Column_name 
  Order By COUNT(*) Desc)  H
  Order By Sayi Asc


--Tabloda N th satýrý getirme.
--Tabloda spesifik olarak 47.satýrdaki datayý merak ettiniz mesela.
--Bazý tablolarda Identity column 1- 1 artmayabilir.
  Select * From 
  (Select Column_name,Row_Number()Over( order by Id desc )as SatirSayi 
   From Table_Name ) H
   Where SatirSayi=10


--A ve B tablolarýnda  ortak ID ye sahip data olsun.
--Biz sadece A tablosunda olan kayýtlarý bulmaya çalýþýyoruz
--A.ID: A tablosunun primary keyi
--B.ID: B tablosunu A tablosuna baðlayan Foreign Key

Select  * from  A
Left Join  B On A.Id=B.Id And B.ID is null


--Bulunduðumuz günden ayýn sona gününe kaç gün kaldýðýný veren sorgu
--Günün tarihi Getdate() ile alýnýr
--Günün tarihine 1ay eklenir
--YYYYMMDD formatý için convert varchar 112 formatý iþlemi yapýlýr.
--Ýlk 6 hane alýnýr 202202 gibi bir data elde edilir sonuan 01 eklenir ve 1 gün çýkarýlýr. 
--Ýçinde bulunduðumuz ayýn son günü elde edilmiþ olur.
--Son günle þu anki günün farký alýnýr..


Select DateAdd(Month,1,Convert(varchar,Getdate()))
Select Datediff(day,Convert(varchar,Getdate()),Convert(varchar,DATEADD(Day,-1,SUBSTRING(Convert(varchar,DateAdd(Month,1,Convert(varchar,Getdate())),112),1,6)+'01'),112))

-- partition BY
--Örneðin bakkalýnýz var dün su , un , yað satýþlarýnýn toplam satýþlara oranýný getirmek istiyorsunuz bu durumlarda partition by kullanýlýr..
--Group by ile farký partition by satýr bazlý gruplama saðlar. Örneðin yaðsatýþý/Toplam satýþ, un satýþý /toplam satýþ tek satýrda görebilirsiniz.

SELECT B.ID,

           COUNT(*) over (partition BY B.ID ORDER BY B.ID desc),
		   COUNT(*) over (partition BY E.Id ORDER BY E.Id desc)

    FROM TABLE1 B
	Inner Join TABLE2 E on B.Id=E.ID



















