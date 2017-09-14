














---
SELECT 
first_name,
last_name
FROM emp
WHERE
salary <1300
ORDER BY last_name;





















---1
SELECT
  emp.last_name NAZWISKO,
  emp.first_name IMIE,
  dept.name "nazwa departamenu",
  emp.dept_id ID
FROM 
  emp,dept,region
WHERE
  emp.dept_id = dept.id AND
  dept.region_id = region.id;
---2
SELECT
  dept.id,
  dept.region_id "NR REGIONU",
  region.name NAZWA
FROM
 dept,region
WHERE
  dept.region_id = region.id;
---3
SELECT
  emp.first_name IMIE,
  emp.last_name NAZWISKO,
  emp.dept_id "NR DEPARTAMENTU",
  dept.name NAZWA
FROM
  emp,dept
WHERE 
  last_name LIKE 'Menchu' AND
  emp.dept_id = dept.id;
---4
SELECT
  emp.last_name NAZWISKO,
  region.name NAZWA,
  emp.COMMISSION_PCT PROWIZJA
FROM
  emp,region,dept
WHERE
  emp.dept_id = dept.id AND
  dept.region_id = region.id AND
  emp.COMMISSION_PCT IS NOT null;
---5
SELECT
  NVL((emp.last_name),'-') as NAZWISKO,
  NVL(TO_CHAR(emp.id),'-') as ID,
  customer.name "NAZWA KLIENTA"
FROM
  emp,customer
WHERE 
  emp.id(+) = customer.sales_rep_id;
---6
SELECT
  e1.last_name  || '  pracje dla  ' ||  e2.last_name as "KTO DLA KOGO"
FROM 
  emp e1,emp e2
WHERE
e1.manager_id = e2.id(+);
---7
SELECT
  customer.name "NAZWA KLIENTA",
  emp.last_name "NAZWISKO",
  ord.date_ordered "DATA ZAMOWIENIA",
  item.quantity_shipped "LICZBA",
  product.name "NAZWA PRODUKTU"
FROM 
  customer,emp,ord,item,product
WHERE
  customer.sales_rep_id= emp.id AND
  customer.id=ord.customer_id AND
  ord.id=item.ord_id AND 
  item.product_id=product.id
  AND item.ord_id=101;
---8
SELECT
  customer.id "NR KLIENTA",
  customer.name "NAZWA KLIENTA",
  NVL(TO_CHAR(ord.id),'-') "NR ZAMOWIENIA"
FROM
  customer,ord
WHERE
  customer.id=ord.customer_id(+);
---9
SELECT
  MAX(emp.salary) "MAX",
  MIN(emp.salary) "MIN",
  AVG(emp.salary) "SREDNIA",
  SUM(emp.salary) "SUMA",
  COUNT(emp.salary)"ILOSC"
FROM emp;
---10
SELECT
  MIN(emp.last_name) "PIERWSZE",
  MAX (emp.last_name) "OSTATNIE"
FROM emp;
---11
SELECT
  COUNT(emp.id) "ILOSC"
FROM emp
WHERE emp.dept_id=31 AND emp.commission_pct IS NOT null;

  
