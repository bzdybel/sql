---1
SELECT
  first_name,
  last_name
FROM 
  emp
WHERE 
  salary < 1300
ORDER BY 
  last_name;
---2
SELECT
  date_ordered || ' ' ||  SUM(total) Wynik
FROM
  ord
GROUP BY
  date_ordered;
---3
SELECT
  first_name,
  last_name 
FROM 
  emp
WHERE 
title LIKE 'Stock Clerk' AND 
salary > (SELECT AVG(salary) FROM emp WHERE title LIKE 'Warehouse Manager');
---4
SELECT
  COUNT(last_name)
FROM 
  emp
WHERE 
  salary < (SELECT AVG(salary) FROM emp);
---5
SELECT
  first_name,
  last_name
FROM 
  emp
WHERE 
 TO_DATE('2017/03/01', 'YYYY/MM/DD') - TO_DATE(start_date, 'YYYY/MM/DD') > 26
-- MONTHS_BETWEEN(TO_DATE(start_date,'MM-DD-YYYY'),TO_DATE('2017/03/01', 'MM-DD-YYYY'))*12 >26
ORDER BY 
  start_date;
---6
SELECT
  sales_rep_id,
  SUM(total)
FROM 
  ord
GROUP BY
  sales_rep_id;
---7
SELECT
  sales_rep_id,
  SUM(total)
FROM
  ord
GROUP BY 
  sales_rep_id
HAVING 
  SUM(total) = (SELECT MAX(SUM(total)) FROM ord GROUP BY sales_rep_id );
---8
SELECT
  last_name
FROM 
  emp
WHERE
  id = (SELECT sales_rep_id FROM ord GROUP BY sales_rep_id HAVING  SUM(total) = (SELECT MAX(SUM(total)) FROM ord GROUP BY sales_rep_id ));
---9
SELECT
  start_date,
  COUNT(start_date)
FROM 
  emp
GROUP BY 
  start_date
ORDER BY 
  start_date;
---10
SELECT
  p.name 
FROM
  product p, inventory i
WHERE
  p.id = i.product_id AND
  i.amount_in_stock = 0 AND
  i.out_of_stock_explanation IS NOT NULL;
---11
SELECT
  name 
FROM 
  product p,inventory i
WHERE
      p.id = i.product_id AND
      i.amount_in_stock > 500;
---12
SELECT
  name 
FROM
  product
WHERE 
  name LIKE '% % %' AND name NOT LIKE '% % % %';


--12
SELECT
  date_ordered || ' ' ||  SUM(total) "Wynik"
FROM
  ord
GROUP BY
  date_ordered;