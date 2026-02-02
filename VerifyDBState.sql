--Question 1
SELECT user_id, username, created, password_change_date FROM USER_USERS;
--Question 2
SELECT * FROM USER_TABLES;
--Question 3
DESC ORDERS;
DESC PRODUCTLIST;
DESC REVIEWS;
DESC STOREFRONT;
DESC USERBASE;
DESC USERLIBRARY;
--Question 4
SELECT * FROM ORDERS; 
SELECT * FROM PRODUCTLIST;
SELECT * FROM REVIEWS;
SELECT * FROM STOREFRONT;
SELECT * FROM USERBASE;
SELECT * FROM USERLIBRARY;
--Question 5
SELECT table_name, constraint_name, constraint_type, status FROM USER_CONSTRAINTS;
--Question 6
SELECT view_name, text FROM USER_VIEWS;
--Question 7
SELECT username FROM USER_USERS;
--Question 8
SELECT firstname, lastname, username, password, email FROM USERBASE
WHERE lower(email) LIKE '%yahoo%';
--Question 9
SELECT username, birthday, walletfunds FROM USERBASE
WHERE walletfunds < 25.00;
--Question 10
SELECT userid, productcode FROM USERLIBRARY
WHERE hoursplayed > 100;
--Question 11
SELECT productcode FROM USERLIBRARY
WHERE hoursplayed < 10;
--Question 12
SELECT DISTINCT publisher FROM PRODUCTLIST;
--Question 13
SELECT productname, releasedate, publisher, genre FROM PRODUCTLIST
ORDER BY genre;
--Question 14
SELECT productcode, publisher FROM PRODUCTLIST
WHERE genre = 'Strategy';
--Question 15
SELECT productcode, description, price FROM STOREFRONT
WHERE price > 25.00
ORDER BY price desc;
--Question 16
SELECT inventoryid, price FROM STOREFRONT
ORDER BY price;
--Question 17
SELECT productcode, review FROM REVIEWS
WHERE rating = 1;
--Question 18
SELECT productcode, review FROM REVIEWS
WHERE rating >= 4;
--Question 19
SELECT DISTINCT userid FROM ORDERS;
--Question 20
SELECT * FROM ORDERS
ORDER BY purchasedate;