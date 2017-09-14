---1

SELECT
 credit_rating ZDOLNOSC,
 
COUNT(credit_rating) ILOSC

FROM
   customer

GROUP BY
  credit_rating;



---2

SELECT
 title STANOWISKO,
 
SUM(salary) ZAROBKI

FROM
 emp

GROUP BY 
 title

HAVING
  title NOT LIKE 'VP%'

ORDER BY
 SUM(salary)

;
---3
SELECT
 
title STANOWISKO,
 
MAX(salary)"MAXYMALNE ZAROBKI"

FROM
 emp

GROUP BY 
 title;


---4

SELECT
  
dept.name NAZWA_DEPT,
 AVG(emp.salary)

FROM
  emp,dept

WHERE
  emp.dept_id=dept.id

GROUP BY 
dept.name

HAVING
  AVG(emp.salary) > 1499;





---5
SELECT
 ord.id NR_ZAMOWIENIA,
 customer.name DANE,
 product.name NAZWA,
 ord.payment_type TYP,
 TO_CHAR(ord.date_ordered,'YYYY/MM/DD') DATA,
 item.price CENA,
 item.quantity ILOSC
FROM
  customer,product,ord,item
WHERE
  customer.id=ord.customer_id AND
  ord.id=item.ord_id AND
  product.id=item.product_id AND
  ord.payment_type LIKE 'CASH' AND
  ord.date_ordered BETWEEN TO_DATE('01-09-1992', 'DD-MM-YYYY') AND TO_DATE ('30-09-1992', 'DD-MM-YYYY')
ORDER BY
 ord.id,product.name;


---6
SELECT
 ord.id,
 customer.name,
 ord.payment_type,
 TO_CHAR(ord.date_ordered,'YYYY/MM/DD') DATA,
 SUM(item.price*item.quantity) Wysokosc
FROM
  customer,product,ord,item
WHERE
  customer.id=ord.customer_id AND
  ord.id=item.ord_id AND
  product.id=item.product_id AND
  ord.payment_type LIKE 'CASH' AND
  ord.date_ordered BETWEEN TO_DATE('01-09-1992', 'DD-MM-YYYY') AND TO_DATE ('30-09-1992', 'DD-MM-YYYY')
GROUP BY 
  ord.id, customer.name, ord.date_ordered, ord.payment_type 
ORDER BY 
  (ord.id);


---7
SELECT
  last_name
FROM 
  emp
GROUP BY 
  last_name
HAVING
  COUNT(last_name) > 1;


---8

SELECT 
  first_name "Imie",
  
last_name "Nazwisko",

  title "Stanowisko",
  NVL(TO_CHAR(manager_id),' ') "Menadzer",
 LEVEL-1 "Poziom"

FROM 
  emp

CONNECT BY PRIOR 
id=manager_id

START WITH 
  manager_id IS NULL

ORDER BY
  level;



---9
SELECT 
  first_name "Imie",
 
 last_name "Nazwisko",
 
 title "Stanowisko",

  NVL(TO_CHAR(manager_id),' ') "Menadzer",

  LEVEL-1 "Poziom"

FROM 
  emp

CONNECT BY PRIOR 
  id=manager_id
START WITH 
  title ='VP, Operations'

ORDER BY
  level;


---10

SELECT
  id,name

FROM
  region

UNION

SELECT
  id,name 

FROM 
  dept
ORDER BY 
name;


---11
SELECT
  name
FROM
  region
UNION
SELECT
  name 
FROM 
  dept
ORDER BY 
name;
-
--12
SELECT
  name

FROM
  region

UNION ALL

SELECT
  name
 
FROM 
  dept

ORDER BY 
name;
---13
SELECT 
  dept_id,
  last_name
FROM 
  emp
UNION 
SELECT
  id,
  name
FROM
  region
ORDER BY 2;
---14
SELECT
  id
FROM 
  customer
INTERSECT
SELECT
  customer_id
FROM 
  ord;
---15
SELECT
  id
FROM 
  customer
MINUS
SELECT
  customer_id
FROM 
  ord;
   
   
   
   