--1
ALTER TABLE ORDERS ADD(
    CONSTRAINT fk_orders_userid FOREIGN KEY (userid) REFERENCES USERBASE(userid),
    CONSTRAINT fk_orders_productcode FOREIGN KEY (productcode) REFERENCES PRODUCTLIST(productcode)
);
ALTER TABLE REVIEWS ADD(
    CONSTRAINT fk_reviews_userid FOREIGN KEY (userid) REFERENCES USERBASE(userid),
    CONSTRAINT fk_reviews_productcode FOREIGN KEY (productcode) REFERENCES PRODUCTLIST(productcode)
);
ALTER TABLE USERLIBRARY ADD(
    CONSTRAINT fk_userlibrary_userid FOREIGN KEY (userid) REFERENCES USERBASE(userid),
    CONSTRAINT fk_userlibrary_productcode FOREIGN KEY (productcode) REFERENCES PRODUCTLIST(productcode)
);

--2
SELECT firstname || ' ' || lastname AS full_name, username FROM USERBASE
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT (YEAR FROM birthday) >=18;

--3
SELECT ROUND(AVG(LENGTH(username)), 2) AS username_ravgl, MAX(LENGTH(username)) AS username_maxl FROM USERBASE;

--4
SELECT question FROM securityquestion
WHERE lower(question) LIKE 'what is%' OR lower(question) LIKE 'what was%';

--5
SELECT productcode, MIN(rating), COUNT(review) FROM REVIEWS
GROUP BY productcode
ORDER BY COUNT(review) desc;

--6
SELECT productcode, COUNT(position) AS count_position FROM WISHLIST
WHERE position = 1
GROUP BY productcode
ORDER BY count_position;

--7
SELECT userid, SUM(price) AS price_sum FROM ORDERS
GROUP BY userid
ORDER BY price_sum desc;

--8
SELECT purchasedate, SUM(price) AS price_sum FROM ORDERS
GROUP BY purchasedate
ORDER BY price_sum desc;

--9
SELECT productcode, SUM(hoursplayed) AS hoursplayed_sum FROM USERLIBRARY
GROUP BY productcode
ORDER BY hoursplayed_sum desc
FETCH FIRST 5 ROWS ONLY;

--10
SELECT userid, COUNT(infractionid) AS infraction_count FROM INFRACTIONS
GROUP BY userid
ORDER BY infraction_count desc;

--11
SELECT userid, rulenum, COUNT(userid) AS user_count FROM INFRACTIONS
GROUP BY userid, rulenum
ORDER BY user_count desc;

--12
SELECT rulenum, penalty, COUNT(penalty) AS penalty_count FROM INFRACTIONS
GROUP BY rulenum, penalty
ORDER BY penalty_count desc;

--13
SELECT 
AVG(dateupdated - datesubmitted) AS date_diffavg, 
MIN(dateupdated - datesubmitted) AS date_diffmin,
MAX(dateupdated - datesubmitted) AS date_diffmax
FROM USERSUPPORT
WHERE status = 'CLOSED';

--14
SELECT email, issue, COUNT(issue) AS issue_count FROM USERSUPPORT
WHERE status = 'NEW'
GROUP BY datesubmitted, email, issue
ORDER BY issue_count;

--15
SELECT firstname, lastname, password FROM USERBASE
WHERE password LIKE ('%' || firstname || '%') OR password LIKE ('%' || lastname || '%');

--16
SELECT publisher, AVG(price) FROM PRODUCTLIST
GROUP BY publisher
ORDER BY publisher;

--17
CREATE VIEW productlist_view AS
SELECT productname, price * 0.75 AS price FROM PRODUCTLIST
WHERE EXTRACT(YEAR FROM releasedate) > 5;

--18
SELECT genre, MAX(price) AS price_max, MIN(price) AS price_min FROM PRODUCTLIST
GROUP BY genre
ORDER BY genre;

--19
CREATE VIEW chatlog_view AS
SELECT * FROM CHATLOG
WHERE datesent between SYSDATE - 14 AND SYSDATE;

--20
CREATE VIEW infractions_view AS
SELECT userid, dateassigned, penalty FROM INFRACTIONS
WHERE penalty IS NOT null AND dateassigned BETWEEN ADD_MONTHS(SYSDATE, -1) AND SYSDATE;