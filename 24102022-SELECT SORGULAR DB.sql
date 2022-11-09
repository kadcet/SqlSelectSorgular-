--SELECT  kolon1,kolon2... FROM tabloadi
--SELECT * FROM tabloadi

USE NORTHWND
GO

-- �R�N �S�MLER� VE B�R�M F�YATLARI
SELECT ProductName,UnitPrice FROM Products

-- �R�N TABLOSUNDAK� T�M VER�LER
SELECT * FROM Products

-- M��TER� T�TLE VE �S�M B�LG�S� TEK KOLONDA
-- ARADA BO�LUK YOK
SELECT ContactTitle+ContactName
FROM Customers

-- M��TER� T�TLE VE �S�M B�LG�S� TEK KOLONDA
-- ARADA BO�LUK VAR
SELECT ContactTitle+' '+ContactName AS MUSTERI
FROM Customers

SELECT ContactTitle+' '+ContactName AS 'MUSTERI'
FROM Customers

SELECT ContactTitle+' '+ContactName'MUSTERI'
FROM Customers

-- STOK ADED� 25 ALTINDA OLAN �R�NLER
select * from Products
where UnitsInStock<25

-- stok adedi 25 ten b�y�k ve 40 tan k���k olan �r�nler
select * from Products where UnitsInStock>25 and UnitsInStock<40

-- stok adedi 25 ile 40 aras�nda olan �r�nler
-- 40 ve 25 e e�it olanlar�da getiriyor.
select * from Products where UnitsInStock between 25 and 40

-- between olmadan ayn� sonu�
select * from Products 
where UnitsInStock>25 and UnitsInStock<40

-- patron dedi ki;
-- hangi m��teri hangi �ehirde

select CompanyName,City from Customers

-- hangi �ehirlerde m��terilerimiz var
-- �ehirleri tekille�tirmemiz laz�m. distinct kulland�k. Londro 4 kere gelmi�.Tek gelsin
select distinct City from Customers

-- burda city i tekille�tirdik ama �irket ad� birden fazla tekrar etti�i i�in distinct in anlam� kalm�yor
select distinct City,CompanyName from Customers

-- ***** NOT  => distinct kullan�yorsak yan�na yazaca��m�z kolonlar grupland�r�lm�� olmal�
-- o �ehirde ka� m��teri var gibi

-- london �ehrinde hangi m��terilerimiz var
select CompanyName,City from Customers where City='london'

-- Stok de�eri 10 a e�it veya k���k olan �r�nler
select ProductName
from Products
--where UnitsInStock<10
where UnitsInStock<10 or UnitsInStock=10

-- berlin ve london da bulunan m��teriler
select CompanyName,City
from Customers
where City='berlin' or City='london'
-- ayn� sonu�
select CompanyName,City
from Customers
where City in('london','berlin')

-- �r�n ad� cha ile BA�LIYOR.sonras�ndan emin de�ilim.olabilirde olmayailirde
select * from Products where ProductName like 'cha%'
-- sonu syrup ile biten
select * from Products where ProductName like '%syrup'
-- �r�n ad� i�erisinde ar�ycam.ba��nda-sonunda-ortas�nda
select * from Products where ProductName like '%anton%'
-- cha oldu�unu biliyorum ama ondan sonra 1 karakter daha var ama onun ne oldu�unu bilmiyorum
-- �izgi ba�ta sonra ortada da kullan�labilir
select * from Products where ProductName like 'cha_'
-- �r�n ad� m ile ba�lar u ile biter. arada ka� karakter oldu�u bilinmiyor
select * from Products where ProductName like 'm%u'

-- mexico da olmayan m��teriler
select *
from Customers
where Country!='mexico'
-- ikinci kullan�m
select *
from Customers
where not Country='mexico'

-- mexico da olmayan m��terileri contry alan�na g�re 
-- alfabetik s�rada 
select Country,City,ContactName
from Customers
where not Country='mexico'
order by Country --asc

-- mexico da olmayan m��terileri contry ve s�ralama i�inde city alan�na g�re 
-- alfabetik s�rada 
select Country,City,ContactName
from Customers
where not Country='mexico'
order by Country,City

-- mexico da olmayan m��terileri contry a-z ve s�ralama i�inde city z-a alan�na g�re 
-- alfabetik s�rada 
select Country,City,ContactName
from Customers
where not Country='mexico'
order by Country asc,City desc

-- birim fiyat� en az olan �r�n
select top 1 ProductName,UnitPrice
from Products
order by UnitPrice asc

-- aggregate function
-- en d���k birim fiyat
select min(UnitPrice) as 'En Ucuz'
from Products

-- en y�ksek birim fiyat
select max(UnitPrice) as 'En Pahal�'
from Products

-- stokta toplam ka� adet �r�n var
select sum(UnitsInStock) 'Toplam Stok Adedi' from Products

-- �r�nlerimizin ortalama sat�� fiyat�
select avg(UnitPrice) 'Ortalama Sat�� Fiyat�' from Products

-- ka� kalem �r�n�m�z var
select count(ProductID) from Products

-- ka� m��terimiz var
select count(CustomerID) from Customers

-- ka� m��terinin fax numaras� var
select count(Fax) from Customers

-- GROUP BY
-- hangi �lkeden ka� m��terim var
select Country,count(CustomerId) 'M��teri Say�s�' 
from Customers
group by Country  -- veri setimi k�mele =>country a lan�ma g�re 

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
-- ('Ahmet','Y�lmaz',20,1,'Ankara','T�rkiye',2000),
-- ('Mehmet','Efe',22,1,'Bolu','T�rkiye',2000),
-- ('Ay�e','Can',23,0,'�stanbul','T�rkiye',3500),
-- ('Fatma','Ak',35,0,'Ankara','T�rkiye',3200),
-- ('John','Smith',45,1,'New York','USA',3500),
-- ('Ellen','Smith',40,0,'New York','USA',3500),
-- ('Hans','M�ller',30,1,'Berlin','Almanya',4000),
-- ('Frank','Cesanne',35,1,'Paris','Fransa',3700),
-- ('Abbas','Demir',26,1,'Adana','T�rkiye',2000),
-- ('Hatice','Top�u',26,0,'Hatay','T�rkiye',2200),
-- ('G�ls�m','Demir',35,0,'Adana','T�rkiye',2000) 
-- GO

-- �lkelere g�re ortalama maa�lar
select Ulke,avg(maas) 'Ortalama Maa�'
from Personel
group by ulke

-- hangi �lkede ka� �al��an var
select Ulke,Count(Id) 'Personel Say�s�'
from Personel
group by Ulke

-- cinsiyete g�re maa� ortalamas�
select Cinsiyet,avg(maas) 'Ortalama Maa�'
from Personel
group by Cinsiyet

-- hangi �lkenin hangi �ehrinde ka� personelim var
select Ulke,Sehir,count(Id) 'Personel Say�s�'
from Personel
group by Ulke,Sehir

-- her �lke i�in maa�� 2000 den
-- b�y�k kad�n ve erkek �al��anlar�n ya� ortalamas� ve personel say�s�
select Ulke,Cinsiyet,avg(Yas) 'Ya� Otalamas�',count(Id) 'Personel Say�s�'
from Personel
where maas>2000
group by Ulke,Cinsiyet

-- her �lke i�in maa�� 2000 den b�y�k ve ya� ortalamas� 30 dan b�y�k
-- kad�n ve erkek �al��anlar�n ya� ortalamas� ve say�s� nedir
select Ulke,Cinsiyet,avg(Yas) 'Ya� Ortalamas�',count(Id) 'Personel Say�s�'
from Personel
where maas>2000
group by Ulke,Cinsiyet
having avg(Yas)>30

go
use NORTHWND
go

/*
iki yada daha fazla SELECT ifadesi sonu� k�mesini birle�tirmek i�in kullan�r�z
UNION i�erisinde her select deyimi ayn� say�da s�tuna sahip olmal�d�r
S�tunlar da benzer veri t�rlerine sahip olmal�d�r.
her SELECT ifadesindeki s�tunlarda ayn� s�rada olmal�d�r.
*/

select CompanyName,ContactName,Fax
from Customers
union
select CompanyName,ContactName,Fax
from Suppliers

------- SUBQUERY

-- almanyadan tedarik edilen �r�nlerin isimleri
--select ProductName from Products where SupplierID in(11,12,13)
--select * from Suppliers

select ProductName 
from Products 
where SupplierID in(select SupplierID from Suppliers where Country='Germany')

------ EXISTS
/* B�R ALT SORGUDAK� HERHANG� B�R KAYDIN VARLI�INI TEST ETMEK ���N KULLANILIR
exist; alt sorgu bir veya daha fazla kay�t d�nerse TRUE,
hi� kay�t d�nmez ise FALSE d�ner
*/

select ContactName
from Suppliers
where exists (select ProductName
                     from Products
					 where Products.SupplierID=Suppliers.SupplierID
					 and UnitPrice<20)

--ANY
/*
Orderdetails tablosundan Quantity de�eri 10 a e�it olan �r�nlerin
listesi
*/
select ProductName
from Products
where ProductID= any (select ProductId from [Order Details] where Quantity=10)



/*
Orderdetails tablosundan Quantity de�eri 10 a e�it olan �r�nlerin
listesi
(Quantity s�tununda baz� de�erler 99 oldu�unda bu false sonucunu d�nd�r�r)
*/
select ProductName
from Products
where ProductID= any (select ProductId from [Order Details] where Quantity=99)


-- ALL  Operat�r�
/*
All operat�r� sonu� olarak boolen (true/false) de�er d�ner
All alt sorgu de�erleri ko�ulu kar��l�yor ise TRUE, de�ilse FALSE d�ner
SELECT,WHERE,HAVING ifadeleri ile kullan�lablir
ALL ko�ulun yaln�zca aral�ktaki t�m de�er i�in i�lem do�ru ise true olaca�� anlam�n� getirir.
*/

select ProductName
from Products
where ProductID= all (select ProductId from [Order Details] where Quantity=10)






















