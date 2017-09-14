---1
SELECT 
LOWER(first_name) AS IMIÊ, LOWER(last_name) AS NAZWISKO, INITCAP(ID) AS IDENTYFIKATOR, UPPER(TITLE) AS STANOWISKO
FROM emp;
---2
SELECT first_name, last_name 
FROM emp
WHERE last_name LIKE INITCAP(LOWER('PATEL'));
---3
SELECT
name || '-' || country AS "NAZWA I PANSTWO"
FROM customer
WHERE
credit_rating LIKE 'GOOD';
---4
SELECT 
name as NAZWA, LENGTH(name)
FROM product
WHERE name LIKE 'Ace%';
---5
SELECT 
TRUNC(41.5843,2) AS SETNE, ROUND(41.5843) AS CALKOWITE, ROUND(41.5843,-1) AS DZIESIATKI
FROM dual;
---6
SELECT 
TRUNC(41.5843,2) AS SETNE, TRUNC(41.5843,0) AS CALKOWITE, ROUND(41.5843,-1) AS DZIESIATKI
FROM dual;
---7
SELECT 
last_name AS Nazwiska, NVL(MOD(salary,commission_pct),0) AS Reszta
FROM emp
WHERE salary > '1380';
---8
SELECT
SYSDATE AS data
FROM dual;
---9
SELECT 
last_name AS Nazwiska ,ROUND(((sysdate-start_date)/7)) AS "Liczba tygodni"
FROM emp
WHERE dept_id=43;
---10
SELECT
id, ROUND(MONTHS_BETWEEN(sysdate,start_date)) AS "Liczba miesiêcy", 
ADD_MONTHS(start_date, 3) AS "Koniec okresu probnego"
FROM emp
WHERE MONTHS_BETWEEN(sysdate,start_date) <308;
---11 
SELECT 
product_id,restock_date "Dostawa",
NEXT_DAY(restock_date, 'Pi¹tek') "Piatek po dostawie",
LAST_DAY(restock_date) "Ostatni dzien miesiaca"
FROM inventory
WHERE restock_date IS NOT null
ORDER BY restock_date;
---12
SELECT
id, start_date, EXTRACT(month FROM start_date) AS miesi¹c
FROM emp
WHERE EXTRACT(year FROM start_date)=1991;
---13
SELECT
id,TO_CHAR(date_ordered,'MM/YYYY')
FROM ord
WHERE sales_rep_id=11;
---14
SELECT
last_name, CONCAT(TO_CHAR(start_date,'DD MONTH YYYY'), 'roku') AS data
FROM emp
WHERE EXTRACT(year FROM start_date)>=1991;



