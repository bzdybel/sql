CREATE TABLE klient
(
customerID INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(25),
surname VARCHAR(35),
addr_street VARCHAR(45),
addr_zip CHAR(5),
addr_city VARCHAR(14),
login VARCHAR(14),
password VARCHAR(12)
);
 

CREATE TABLE zamowienia
(
orderID INTEGER NOT NULL PRIMARY KEY,
IDcstomer INTEGER,
crDATE DATE
);
 

ALTER TABLE zamowienia
ADD FOREIGN KEY (IDcstomer)
REFERENCES klient (customerID);

 
CREATE TABLE pozycja
(
IDproduct INTEGER ,
IDorder INTEGER,
quantity INTEGER
);
 

CREATE TABLE produkt
(
productID INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(45),
price_net FLOAT,
price_gross FLOAT,
description CLOB
);
 

ALTER TABLE pozycja
ADD FOREIGN KEY (IDproduct)
REFERENCES produkt (productID);

 
ALTER TABLE pozycja
ADD FOREIGN KEY (IDorder)
REFERENCES klient (customerID);
 
---1
ALTER TABLE klient ADD e_mail VARCHAR(50);
---2
ALTER TABLE klient RENAME COLUMN addr_zip TO addr_postalcode;
ALTER TABLE klient MODIFY addr_postalcode VARCHAR(7);
---3
ALTER TABLE zamowienia ADD (realizacja VARCHAR(3));  
---4
ALTER TABLE zamowienia ADD data_godzina TIMESTAMP;
---7
CREATE INDEX klienci_index ON klienci(name, login);
---8
CREATE UNIQUE INDEX klienci_index2 ON klienci(login);



















