--Union Operator:
--1) iki sorgu sounucunu birleştirmek için kullanilir.
--2) Tekrarsiz(unique) recordlari(satir) verir.
--3) tek bir sütuna cok sütun koyabiliriz.
--4)Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarsız olarak bulun.

select state as name_and_State, salary 
from workers 
where salary >3000
Union
select name, salary 
from workers 
where salary <2000;

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.


select state as name_and_State, salary 
from workers 
where salary >3000
Union ALl --> tekrarlı recordları da verir.
select name, salary 
from workers 
where salary <2000;

--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
--Intersect
select name
from workers
where salary>1000
Intersect
select name
from workers
where salary<2000

--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. Unique(tekrarsız) recordları verir.


--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.

select name 
from workers 
where salary>2000
intersect
select name
from workers
where company in('IBM','APPLE','MICROSOFT')

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. Unique(tekrarsız) recordları verir.
--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.

select name 
from workers 
where salary<3000
except
select name
from workers 
where company= 'GOOGLE'

CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;
CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');
SELECT * FROM orders;

--Joins: 
--1)INNER JOIN: Ortak(common)
--2)LEFT JOIN: birinci table'in tum data
--3)RIGHT JOIN: ikinci table tum data
--4)FULL JOIN: iki table'inda tum datasini verir
--5)SELF JOIN: Tek table uzerinde calisirken iki table varmis gibi calisilir.

--1) INNER JOIN
--Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.

select company_name, order_id, order_date
from my_companies mc inner join orders o
on mc.company_id= o.company_id

-- 2) LEFT JOIN
-- my_companies table'ındaki companyler için order_id ve order_date değerlerini çağırın.
select company_name, order_id ,order_date
from my_companies mc left join orders o 
on mc.company_id=o.company_id

--3) RIGHT JOIN
--Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın.
select company_name, order_id, order_date 
from my_companies mc right join orders o 
on mc.company_id=o.company_id

--4)FULL JOIN
--İki table'dan da company_name, order_id ve order_date değerlerini çağırın.

select company_name, order_id, order_date 
from my_companies mc full join orders o 
on mc.company_id=o.company_id

drop table workers


--SELF JOIN
CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers;
--workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.

select employee.name , manager.name 
from workers employee full join workers manager
on employee.manager_id=manager.id



