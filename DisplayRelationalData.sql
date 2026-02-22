--1
SELECT ubs.username, MIN(rev.rating) FROM REVIEWS rev
INNER JOIN USERBASE ubs ON rev.userid = ubs.userid
GROUP BY ubs.username
ORDER BY MIN(rev.rating);
--2
SELECT ubs.email, sqs.question, sqs.answer FROM SECURITYQUESTION sqs
INNER JOIN USERBASE ubs ON sqs.userid = ubs.userid;
--3
SELECT firstname, email, walletfunds FROM USERBASE ubs
WHERE NOT EXISTS(
    SELECT userid FROM WISHLIST wis
    WHERE ubs.userid = wis.userid
);
--4
SELECT ubs.username, COUNT(ord.userid) FROM USERBASE ubs
INNER JOIN ORDERS ord ON ubs.userid = ord.userid
GROUP BY ubs.username
ORDER BY COUNT(ord.userid) desc;
--5
SELECT ubs.username, FLOOR(MONTHS_BETWEEN (SYSDATE, ubs.birthday)/12) AS age  FROM USERBASE ubs
INNER JOIN ORDERS ord ON ubs.userid = ord.userid
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, ord.purchasedate))<6;
--6
SELECT ubs.username, ubs.birthday, COUNT(fri.userid) AS friends FROM USERBASE ubs
INNER JOIN FRIENDSLIST fri ON ubs.userid = fri.userid
GROUP BY ubs.username, ubs.birthday
ORDER BY COUNT(fri.userid) desc;
--7
SELECT productname, releasedate, price, description FROM PRODUCTLIST pro
INNER JOIN WISHLIST wis ON pro.productcode = wis.productcode
WHERE EXISTS(
    SELECT productcode FROM WISHLIST
    WHERE wis.productcode = pro.productcode
);
--8
SELECT pro.productname, MAX(rating), COUNT(rating) FROM REVIEWS rev
INNER JOIN PRODUCTLIST pro ON rev.productcode = pro.productcode
GROUP BY pro.productname
ORDER BY MAX(rating) desc;
--9
CREATE VIEW product_overview AS
SELECT productname, genre, rating FROM PRODUCTLIST pro
INNER JOIN REVIEWS rev ON pro.productcode = rev.productcode
WHERE rating IN(5, 1)
ORDER BY rating;
--10
SELECT genre, COUNT(ord.productcode) FROM ORDERS ord
INNER JOIN PRODUCTLIST pro ON ord.productcode = pro.productcode
GROUP BY genre
ORDER BY genre;
--11
CREATE VIEW playtime_overview AS
SELECT publisher, AVG(price) AS price_avg, SUM(hoursplayed) AS hoursplayed_sum FROM PRODUCTLIST pro
INNER JOIN USERLIBRARY ulb ON pro.productcode = ulb.productcode
GROUP BY publisher
ORDER BY publisher;
--12
SELECT publisher, SUM(ord.price) FROM PRODUCTLIST pro
INNER JOIN ORDERS ord ON pro.productcode = ord.productcode
GROUP BY publisher
ORDER BY SUM(ord.price) desc;
--13
SELECT ticketid, ubs.username, usu.email, issue FROM USERSUPPORT usu
INNER JOIN USERBASE ubs ON usu.email = ubs.email
WHERE status IN('NEW', 'IN PROGRESS')
ORDER BY dateupdated;
--14
SELECT username, COUNT(ticketid) FROM USERBASE ubs
INNER JOIN USERSUPPORT usu ON ubs.email = usu.email
WHERE EXISTS(
    SELECT ticketid FROM USERSUPPORT
)
GROUP BY username;
--15
SELECT ubs.userid, ubs.email FROM USERBASE ubs
INNER JOIN USERSUPPORT usu ON ubs.email = usu.email
WHERE EXISTS(
    SELECT ticketid FROM USERSUPPORT
    WHERE usu.email LIKE '%'||firstname||'%' OR 
    usu.email LIKE '%'||lastname||'%' OR
    usu.email LIKE '%'||firstname||lastname||'%'
);
--16
SELECT email FROM USERSUPPORT usu
WHERE status IN('NEW', 'IN PROGRESS') AND NOT EXISTS(
    SELECT email FROM USERBASE ubs
    WHERE usu.email = ubs.email
);
--17
SELECT ticketid, firstname, lastname, username FROM USERBASE ubs
INNER JOIN USERSUPPORT usu ON ubs.email = usu.email
WHERE EXISTS(
    SELECT ubs.username FROM USERSUPPORT
    WHERE issue LIKE '%'||username||'%'
);
--18
SELECT DISTINCT usu.email, username, password FROM USERBASE ubs
INNER JOIN USERSUPPORT usu ON ubs.email = usu.email;
--19
CREATE VIEW penalty_overview AS
SELECT username, dateassigned, penalty FROM INFRACTIONS inf
INNER JOIN USERBASE ubs ON inf.userid = ubs.userid
WHERE penalty IS NOT NULL AND FLOOR(MONTHS_BETWEEN(SYSDATE, dateassigned))<1;
--20
SELECT username, email FROM USERBASE ubs
INNER JOIN INFRACTIONS inf ON ubs.userid = inf.userid
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, birthday))>18 AND 
FLOOR(MONTHS_BETWEEN(SYSDATE, dateassigned))>4;
--21
SELECT ubs.username, inf.dateassigned, (cru.rulenum||' '||cru.title) AS full_guideline_name 
FROM USERBASE ubs
INNER JOIN INFRACTIONS inf ON ubs.userid = inf.userid
INNER JOIN COMMUNITYRULES cru ON inf.rulenum = cru.rulenum
ORDER BY dateassigned desc;
--22
SELECT ubs.userid, username, email, severitypoint FROM USERBASE ubs
INNER JOIN INFRACTIONS inf ON ubs.userid = inf.userid
INNER JOIN COMMUNITYRULES cru ON inf.rulenum = cru.rulenum
ORDER BY severitypoint desc;
--23
SELECT title, description, penalty FROM INFRACTIONS inf
INNER JOIN COMMUNITYRULES cru ON inf.rulenum = cru.rulenum;
--24
SELECT username, COUNT(inf.userid) FROM USERBASE ubs
INNER JOIN INFRACTIONS inf ON ubs.userid = inf.userid
GROUP BY username
HAVING COUNT(inf.userid)>=15;