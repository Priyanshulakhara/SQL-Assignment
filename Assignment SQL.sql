CREATE DATABASE IF NOT EXISTS Sales;
USE Sales;

CREATE TABLE IF NOT EXISTS SalesPeople (
Snum int unsigned ,
Sname varchar(25) not null ,
City varchar(25) not null ,
Comm int unsigned not null,
PRIMARY KEY (Snum)
);

CREATE TABLE IF NOT EXISTS Customers (
Cnum int unsigned ,
Cname varchar(25) not null ,
City varchar(25) not null ,
Snum int unsigned not null ,
PRIMARY KEY (Cnum),
FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

CREATE TABLE IF NOT EXISTS Orders (
Onum int unsigned ,
Amt decimal(7,2),
Odate date not null default '0000-00-00',
Cnum int unsigned not null,
Snum int unsigned not null,
PRIMARY KEY (Onum),
FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

INSERT INTO SalesPeople VALUES (1001, 'Peel', 'London', 12),
(1002, 'Serres', 'Sanjose', 13),
(1004, 'Motika', 'London', 11),
(1007, 'Rifkin', 'Barcelona', 15),
(1003, 'Axelrod', 'Newyork', 10);

INSERT INTO Customers VALUES (2001, 'Hoffman', 'London', 1001),
(2002, 'Giovanni', 'Rome', 1003),
(2003, 'Liu', 'Sanjose', 1002),
(2004, 'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);

INSERT INTO Orders VALUES (3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4273.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001)
;

-- 1. Count the number of salesperson whose name begin with 'a'/'A'.
SELECT count(*) FROM SalesPeople WHERE Sname LIKE 'a%' OR 'A%';

-- 2. Display all the salesperson whose all orders worth is more than Rs 2000.
SELECT o1.onum, o1.Amt, o1.snum, s1.Sname from Orders as o1 INNER JOIN SalesPeople as s1 on o1.snum=s1.snum where o1.Amt>2000;

-- 3. Count the number of SalesPerson belonging to Newyork.
SELECT count(*) FROM SalesPeople WHERE City='Newyork'; 

-- 4. Display the number of Salespeople belonging to london and belonging to paris.
SELECT Snum FROM SalesPeople WHERE City = 'London' OR City = 'Paris';

-- 5. Display the number of orders taken by each Salesperson and their date of orders.
SELECT Orders.Snum,SalesPeople.Sname, Count(*), Odate FROM Orders inner join SalesPeople on Orders.Snum = SalesPeople.Snum group by Orders.Snum, Orders.Odate; 