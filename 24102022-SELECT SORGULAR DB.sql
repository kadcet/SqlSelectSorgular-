--SELECT  kolon1,kolon2... FROM tabloadi
--SELECT * FROM tabloadi

USE NORTHWND
GO

-- ÜRÜN ÝSÝMLERÝ VE BÝRÝM FÝYATLARI
SELECT ProductName,UnitPrice FROM Products

-- ÜRÜN TABLOSUNDAKÝ TÜM VERÝLER
SELECT * FROM Products

-- MÜÞTERÝ TÝTLE VE ÝSÝM BÝLGÝSÝ TEK KOLONDA
-- ARADA BOÞLUK YOK
SELECT ContactTitle+ContactName
FROM Customers

-- MÜÞTERÝ TÝTLE VE ÝSÝM BÝLGÝSÝ TEK KOLONDA
-- ARADA BOÞLUK VAR
SELECT ContactTitle+' '+ContactName AS MUSTERI
FROM Customers

SELECT ContactTitle+' '+ContactName AS 'MUSTERI'
FROM Customers

SELECT ContactTitle+' '+ContactName'MUSTERI'
FROM Customers

-- STOK ADEDÝ 25 ALTINDA OLAN ÜRÜNLER
select * from Products
where UnitsInStock<25

-- stok adedi 25 ten büyük ve 40 tan küçük olan ürünler
select * from Products where UnitsInStock>25 and UnitsInStock<40

-- stok adedi 25 ile 40 arasýnda olan ürünler
-- 40 ve 25 e eþit olanlarýda getiriyor.
select * from Products where UnitsInStock between 25 and 40

-- between olmadan ayný sonuç
select * from Products 
where UnitsInStock>25 and UnitsInStock<40

-- patron dedi ki;
-- hangi müþteri hangi þehirde

select CompanyName,City from Customers

-- hangi þehirlerde müþterilerimiz var
-- þehirleri tekilleþtirmemiz lazým. distinct kullandýk. Londro 4 kere gelmiþ.Tek gelsin
select distinct City from Customers

-- burda city i tekilleþtirdik ama þirket adý birden fazla tekrar ettiði için distinct in anlamý kalmýyor
select distinct City,CompanyName from Customers

-- ***** NOT  => distinct kullanýyorsak yanýna yazacaðýmýz kolonlar gruplandýrýlmýþ olmalý
-- o þehirde kaç müþteri var gibi

-- london þehrinde hangi müþterilerimiz var
select CompanyName,City from Customers where City='london'

-- Stok deðeri 10 a eþit veya küçük olan ürünler
select ProductName
from Products
--where UnitsInStock<10
where UnitsInStock<10 or UnitsInStock=10

-- berlin ve london da bulunan müþteriler
select CompanyName,City
from Customers
where City='berlin' or City='london'
-- ayný sonuç
select CompanyName,City
from Customers
where City in('london','berlin')

-- ürün adý cha ile BAÞLIYOR.sonrasýndan emin deðilim.olabilirde olmayailirde
select * from Products where ProductName like 'cha%'
-- sonu syrup ile biten
select * from Products where ProductName like '%syrup'
-- ürün adý içerisinde arýycam.baþýnda-sonunda-ortasýnda
select * from Products where ProductName like '%anton%'
-- cha olduðunu biliyorum ama ondan sonra 1 karakter daha var ama onun ne olduðunu bilmiyorum
-- çizgi baþta sonra ortada da kullanýlabilir
select * from Products where ProductName like 'cha_'
-- ürün adý m ile baþlar u ile biter. arada kaç karakter olduðu bilinmiyor
select * from Products where ProductName like 'm%u'

-- mexico da olmayan müþteriler
select *
from Customers
where Country!='mexico'
-- ikinci kullaným
select *
from Customers
where not Country='mexico'

-- mexico da olmayan müþterileri contry alanýna göre 
-- alfabetik sýrada 
select Country,City,ContactName
from Customers
where not Country='mexico'
order by Country --asc

-- mexico da olmayan müþterileri contry ve sýralama içinde city alanýna göre 
-- alfabetik sýrada 
select Country,City,ContactName
from Customers
where not Country='mexico'
order by Country,City

-- mexico da olmayan müþterileri contry a-z ve sýralama içinde city z-a alanýna göre 
-- alfabetik sýrada 
select Country,City,ContactName
from Customers
where not Country='mexico'
order by Country asc,City desc

-- birim fiyatý en az olan ürün
select top 1 ProductName,UnitPrice
from Products
order by UnitPrice asc

-- aggregate function
-- en düþük birim fiyat
select min(UnitPrice) as 'En Ucuz'
from Products

-- en yüksek birim fiyat
select max(UnitPrice) as 'En Pahalý'
from Products

-- stokta toplam kaç adet ürün var
select sum(UnitsInStock) 'Toplam Stok Adedi' from Products

-- ürünlerimizin ortalama satýþ fiyatý
select avg(UnitPrice) 'Ortalama Satýþ Fiyatý' from Products

-- kaç kalem ürünümüz var
select count(ProductID) from Products

-- kaç müþterimiz var
select count(CustomerID) from Customers

-- kaç müþterinin fax numarasý var
select count(Fax) from Customers

-- GROUP BY
-- hangi ülkeden kaç müþterim var
select Country,count(CustomerId) 'Müþteri Sayýsý' 
from Customers
group by Country  -- veri setimi kümele =>country a lanýma göre 

use TestDB2410
go

--CREATE TABLE Personel
-- (
--	Id INT PRIMARY KEY IDENTITY(1,1),
--	Ad NVARCHAR(50) NOT NULL,
--	Soyad NVARCHAR(50) NOT NULL,
--	Yas TINYINT NOT NULL,
--	Cinsiyet BIT NOT NULL,--0 1
--	Sehir NVARCHAR(50) NOT NULL,
--	Ulke NVARCHAR(50) NOT NULL,
--	Maas DECIMAL(9,2) NOT NULL--1234567,89
-- )
-- GO
-- INSERT INTO Personel VALUES
-- ('Ahmet','Yýlmaz',20,1,'Ankara','Türkiye',2000),
-- ('Mehmet','Efe',22,1,'Bolu','Türkiye',2000),
-- ('Ayþe','Can',23,0,'Ýstanbul','Türkiye',3500),
-- ('Fatma','Ak',35,0,'Ankara','Türkiye',3200),
-- ('John','Smith',45,1,'New York','USA',3500),
-- ('Ellen','Smith',40,0,'New York','USA',3500),
-- ('Hans','Müller',30,1,'Berlin','Almanya',4000),
-- ('Frank','Cesanne',35,1,'Paris','Fransa',3700),
-- ('Abbas','Demir',26,1,'Adana','Türkiye',2000),
-- ('Hatice','Topçu',26,0,'Hatay','Türkiye',2200),
-- ('Gülsüm','Demir',35,0,'Adana','Türkiye',2000) 
-- GO

-- ülkelere göre ortalama maaþlar
select Ulke,avg(maas) 'Ortalama Maaþ'
from Personel
group by ulke

-- hangi ülkede kaç çalýþan var
select Ulke,Count(Id) 'Personel Sayýsý'
from Personel
group by Ulke

-- cinsiyete göre maaþ ortalamasý
select Cinsiyet,avg(maas) 'Ortalama Maaþ'
from Personel
group by Cinsiyet

-- hangi ülkenin hangi þehrinde kaç personelim var
select Ulke,Sehir,count(Id) 'Personel Sayýsý'
from Personel
group by Ulke,Sehir

-- her ülke için maaþý 2000 den
-- büyük kadýn ve erkek çalýþanlarýn yaþ ortalamasý ve personel sayýsý
select Ulke,Cinsiyet,avg(Yas) 'Yaþ Otalamasý',count(Id) 'Personel Sayýsý'
from Personel
where maas>2000
group by Ulke,Cinsiyet

-- her ülke için maaþý 2000 den büyük ve yaþ ortalamasý 30 dan büyük
-- kadýn ve erkek çalýþanlarýn yaþ ortalamasý ve sayýsý nedir
select Ulke,Cinsiyet,avg(Yas) 'Yaþ Ortalamasý',count(Id) 'Personel Sayýsý'
from Personel
where maas>2000
group by Ulke,Cinsiyet
having avg(Yas)>30

go
use NORTHWND
go

/*
iki yada daha fazla SELECT ifadesi sonuç kümesini birleþtirmek için kullanýrýz
UNION içerisinde her select deyimi ayný sayýda sütuna sahip olmalýdýr
Sütunlar da benzer veri türlerine sahip olmalýdýr.
her SELECT ifadesindeki sütunlarda ayný sýrada olmalýdýr.
*/

select CompanyName,ContactName,Fax
from Customers
union
select CompanyName,ContactName,Fax
from Suppliers

------- SUBQUERY

-- almanyadan tedarik edilen ürünlerin isimleri
--select ProductName from Products where SupplierID in(11,12,13)
--select * from Suppliers

select ProductName 
from Products 
where SupplierID in(select SupplierID from Suppliers where Country='Germany')

------ EXISTS
/* BÝR ALT SORGUDAKÝ HERHANGÝ BÝR KAYDIN VARLIÐINI TEST ETMEK ÝÇÝN KULLANILIR
exist; alt sorgu bir veya daha fazla kayýt dönerse TRUE,
hiç kayýt dönmez ise FALSE döner
*/

select ContactName
from Suppliers
where exists (select ProductName
                     from Products
					 where Products.SupplierID=Suppliers.SupplierID
					 and UnitPrice<20)

--ANY
/*
Orderdetails tablosundan Quantity deðeri 10 a eþit olan ürünlerin
listesi
*/
select ProductName
from Products
where ProductID= any (select ProductId from [Order Details] where Quantity=10)



/*
Orderdetails tablosundan Quantity deðeri 10 a eþit olan ürünlerin
listesi
(Quantity sütununda bazý deðerler 99 olduðunda bu false sonucunu döndürür)
*/
select ProductName
from Products
where ProductID= any (select ProductId from [Order Details] where Quantity=99)


-- ALL  Operatörü
/*
All operatörü sonuç olarak boolen (true/false) deðer döner
All alt sorgu deðerleri koþulu karþýlýyor ise TRUE, deðilse FALSE döner
SELECT,WHERE,HAVING ifadeleri ile kullanýlablir
ALL koþulun yalnýzca aralýktaki tüm deðer için iþlem doðru ise true olacaðý anlamýný getirir.
*/

select ProductName
from Products
where ProductID= all (select ProductId from [Order Details] where Quantity=10)






















