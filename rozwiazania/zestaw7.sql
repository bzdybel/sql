---1
/*Polecenie COMMIT zatwierdza wprowadzone zmiany, dane s¹ trwale zapisane i nie mo¿na ich odzyskaæ za pomoc¹ polecenia ROLLBACK
Polecenie ROLLBACK wycofuje wprowadzone zmiany i wraca do stanu przed ich wprowadzeniem, mo¿emy go u¿ywaæ do momentu zatwierdzenia polleceniem COMMIT
SAVEPOINT ustawia tzw. punkty kontrolne, które mog¹ byæ nastêpnie u¿yte do bardziej precyzyjnego wycofywania niezatwierdzonych zmian.*/
---2
SET AUTOCOMMIT OF;
---3
INSERT INTO emp(id,last_name,first_name) 
      VALUES (26,'Kaczynski','Jaroslaw')
COMMIT;
---4
INSERT INTO emp(id,last_name,first_name,start_date,salary) 
      VALUES (27,'Zdybel','Bartlomiej',TO_DATE('2017-04-26','YYYY-MM-DD'),5000);
SELECT * FROM emp;
ROLLBACK;
---5
INSERT INTO emp(id,last_name,first_name,start_date,salary) 
      VALUES (27,'Zdybel','Bartlomiej',TO_DATE('2017-04-26','YYYY-MM-DD'),5000);
COMMIT;
---6
-----A
UPDATE
  product
SET
  SUGGESTED_WHLSL_PRICE = SUGGESTED_WHLSL_PRICE*1.15;
-----B
SAVEPOINT S1;
-----C
SELECT
  SUM(SUGGESTED_WHLSL_PRICE)
FROM
  product;
-----D
UPDATE
  product
SET
  SUGGESTED_WHLSL_PRICE = SUGGESTED_WHLSL_PRICE*1.10;
-----E
SAVEPOINT S2;
-----F
SELECT
  SUM(SUGGESTED_WHLSL_PRICE)
FROM
  product;
-----G
UPDATE
  product
SET
  SUGGESTED_WHLSL_PRICE = SUGGESTED_WHLSL_PRICE*1.6;
-----H
SELECT
  SUM(SUGGESTED_WHLSL_PRICE)
FROM
  product;
-----I
ROLLBACK TO SAVEPOINT S2;
-----J
SELECT
  SUM(SUGGESTED_WHLSL_PRICE)
FROM
  product;
-----K
ROLLBACK TO SAVEPOINT S1;
-----L
SELECT
  SUM(SUGGESTED_WHLSL_PRICE)
FROM
  product;
-----M
COMMIT;
---7
SET AUTOCOMMIT ON;
---8
CREATE TABLE region_kopia ( id NUMBER(7),name VARCHAR2(50));
INSERT INTO region_kopia (id, name)
SELECT 
  id, name
FROM 
  region; 
---9
INSERT INTO dept (id,name,region_id)
SELECT
  id*100,name,region_id 
FROM dept; 
---10
INSERT INTO region_kopia (id,name)
SELECT
  id,name
FROM 
  customer c, ord o
WHERE 
  c.sales_rep_id = o.sales_rep_id AND
  o.total > 1000;
---11
UPDATE
  emp
SET
  salary = salary * 3,
  start_date = TO_DATE('31-12-2001','DD_MM_YYYY')
WHERE
  last_name = 'Zdybel';
---12
-----A
UPDATE
  product
SET 
    SUGGESTED_WHLSL_PRICE=SUGGESTED_WHLSL_PRICE*0.9
FROM
  product p, item i
WHERE
  p.id=i.product_id AND
  i.quantity_shipped <30;
---13
UPDATE
  emp
SET
  salary = salary * 1.3
WHERE
  title LIKE 'VP%';
---14
DELETE 
FROM 
  emp 
WHERE 
  id = 26 OR id = 27;
---15
DROP TABLE region_kopia;