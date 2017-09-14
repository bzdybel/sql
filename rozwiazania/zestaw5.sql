





SELECT
ord.id nr,
ord.total
FROM
ord
WHERE
total = (SELECT MAX(total) FROM ord);

SELECT
ord.id nr,
ord.date_ordered data_zamowienia,
ord.date_shipped data_realizacji,
ord.total wartosc
FROM
  ord
WHERE
ord.total IN (SELECT MIN(ORD.total) FROM ord WHERE PAYMENT_TYPE='CASH');
  
SELECT
ord.id nr,
ord.date_ordered data_zamowienia,
ord.date_shipped data_realizacji,
ord.total wartosc
FROM
ord
WHERE
total >(SELECT AVG(total) FROM ord);

SELECT
product.name,
product.suggested_whlsl_price
FROM
product
WHERE
SUGGESTED_WHLSL_PRICE < (SELECT AVG(SUGGESTED_WHLSL_PRICE) FROM product WHERE name LIKE 'Prostar%');

SELECT
inventory.warehouse_id,
inventory.product_id,
inventory.AMOUNT_IN_STOCK
FROM
inventory 
WHERE
(inventory.warehouse_id,inventory.AMOUNT_IN_STOCK) IN (SELECT warehouse_id, MAX(AMOUNT_IN_STOCK) FROM inventory GROUP BY warehouse_id);

select
warehouse_id,
product_id,
amount_in_stock
from inventory i1
where
amount_in_stock = (SELECT max(AMOUNT_IN_STOCK) FROM warehouse inventory i2 WHERE i1.warehouse_id = i2.warehouse_id);

SELECT 
name
FROM 
customer
WHERE EXISTS (SELECT * FROM ord WHERE customer.id=ord.customer_id);




---5
SELECT
  inventory.warehouse_id nr_magazynu,
  inventory.product_id nr_produktu,
  inventory.amount_in_stock liczba
FROM
  inventory
WHERE
  (inventory.warehouse_id,inventory.amount_in_stock) IN (SELECT warehouse_id, MAX(amount_in_stock) FROM inventory GROUP BY warehouse_id);
  /*REKORD SIE POWTARZA, PONIEWA¯ JEST TYLE SAMO PRODUKTÓW*/
---6
SELECT
  warehouse_id "Numer magazynu",
  product_id "Numer produktu",
  amount_in_stock "Liczba produkt?w"
FROM
  inventory i1
WHERE
  amount_in_stock=(SELECT MAX(amount_in_stock) FROM inventory i2 WHERE i1.warehouse_id=i2.warehouse_id);
---7
SELECT
  warehouse.city miasto,
  product.name,
  inventory.amount_in_stock
FROM
  inventory,product,warehouse
WHERE
  product.id=inventory.product_id AND 
  warehouse.id=inventory.warehouse_id AND
 (inventory.warehouse_id,inventory.amount_in_stock) IN (SELECT warehouse_id, MAX(amount_in_stock) FROM inventory GROUP BY warehouse_id);
 --8
SELECT 
  name
FROM 
  customer
WHERE NOT EXISTS (SELECT * FROM ord WHERE customer.id=ord.customer_id);
---9
SELECT
  name,
  C.id,
  ord.id
FROM 
  customer C,ord
WHERE
  ord.id IN (SELECT MIN(ord.id) FROM ord),
WHERE  EXISTS
  (SELECT 1 FROM ord O WHERE O.customer_id=C.id)
GROUP BY name,C.id,ord.id
---10
SELECT 
  customer_id "Nazwa klienta",
  id "Numer"
FROM 
  ord
WHERE
  customer_id IS NOT NULL
ORDER BY 
  customer_id;
---11
SELECT 
  last_name "Nazwisko"
FROM 
  emp
WHERE EXISTS (SELECT 1 FROM ord WHERE ord.sales_rep_id=emp.id AND ord.id < 100);
---12
SELECT emp.last_name "Nazwisko"
FROM emp, ord
WHERE ord.sales_rep_id=emp.id AND ord.id < 100;
/*Zeby uniknac powtarzania nazwiska stosuje operator DISTINCT*/
---13
SELECT
  first_name ||' '|| last_name "IMIE I NAZWISKO"
FROM
  emp
WHERE EXISTS (SELECT ord.sales_rep_id, COUNT(id) FROM ord
WHERE ord.sales_rep_id=emp.id GROUP BY ord.sales_rep_id HAVING COUNT(id) >= 4);
