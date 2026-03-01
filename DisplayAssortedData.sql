--1
SELECT userid FROM userbase
MINUS
SELECT userid FROM orders;
--2
SELECT productcode FROM productlist
MINUS
SELECT productcode FROM reviews;
--3
SELECT usb.*, null AS Age_Group FROM userbase usb
WHERE birthday IS NULL
UNION ALL
SELECT usb.*, 'Adult' FROM userbase usb
WHERE (SYSDATE - birthday) >= 18
UNION ALL
SELECT usb.*, 'Minor' FROM userbase usb
WHERE (SYSDATE - birthday) < 18;
--4
SELECT pro.*, 'Base Price' AS sale FROM PRODUCTLIST pro
WHERE price > 20
UNION ALL
SELECT pro.*, 'On Sale' FROM PRODUCTLIST pro
WHERE price <= 20;
--5
SELECT usp.userid FROM USERBASE usp
INNER JOIN USERLIBRARY usb ON usp.userid = usb.userid
WHERE (SELECT userid FROM USERPROFILE WHERE userid = usp.userid AND imagefile IS NOT NULL) AND
productcode = 'GAME6';
--6
SELECT pro.productcode FROM PRODUCTLIST pro
INTERSECT
SELECT wis.productcode FROM WISHLIST wis
WHERE position IN(1,2)
INTERSECT
SELECT rev.productcode FROM REVIEWS rev
WHERE rating >= 3;
--7
SELECT usb1.username, usb1.birthday, usb2.username, usb2.birthday FROM USERBASE usb1
INNER JOIN USERBASE usb2 ON usb1.birthday = usb2.birthday
WHERE usb1.username <> usb2.username;
--8
SELECT * FROM USERLIBRARY
CROSS JOIN WISHLIST;
--9
SELECT to_char(userid), firstname, lastname, username, password, email, to_char(birthday), to_char(walletfunds) 
FROM USERBASE
UNION ALL
SELECT productcode, productname, publisher, genre, to_char(releasedate), to_char(price), description, null 
FROM PRODUCTLIST pro;
--10
SELECT chatid, to_char(receiverid), to_char(senderid), to_char(datesent), content FROM CHATLOG
UNION ALL
SELECT userid, imagefile, description, null, null FROM USERPROFILE;
--11
SELECT username FROM USERBASE usb
FULL JOIN INFRACTIONS inf ON usb.userid = inf.userid
WHERE infractionid IS NULL;
--12
SELECT title, description FROM COMMUNITYRULES com
FULL JOIN INFRACTIONS inf ON com.rulenum = inf.rulenum
WHERE infractionid IS NULL;
--13
SELECT username, email FROM USERBASE usb
INNER JOIN INFRACTIONS inf ON usb.userid = inf.userid
WHERE penalty IS NOT NULL;
--14
SELECT dateassigned FROM INFRACTIONS inf
INTERSECT
SELECT datesubmitted FROM USERSUPPORT uss;
--15
SELECT DISTINCT title, penalty FROM COMMUNITYRULES com
INNER JOIN INFRACTIONS inf ON com.rulenum = inf.rulenum;
--16
SELECT com.*, 'Appealable' AS appeal FROM COMMUNITYRULES com
WHERE severitypoint < 10 OR NULL
UNION ALL
SELECT com.*, 'Bannable' FROM COMMUNITYRULES com
WHERE severitypoint >= 10;
--17
SELECT uss.*, null AS priority FROM USERSUPPORT uss
WHERE SYSDATE - dateupdated <= 7
UNION ALL
SELECT uss.*, 'High Priority' AS priority FROM USERSUPPORT uss
WHERE SYSDATE - dateupdated > 7 OR dateupdated IS NULL;
--18
SELECT * FROM USERSUPPORT
CROSS JOIN INFRACTIONS;
--19
SELECT ticketid, dateupdated FROM USERSUPPORT
WHERE datesubmitted = dateupdated AND status = 'CLOSED';
--20
SELECT userid, firstname, lastname, username, password, email, birthday, walletfunds 
FROM USERBASE
UNION ALL
SELECT infractionid, to_char(userid), to_char(rulenum), to_char(dateassigned), penalty, null, null, null
FROM INFRACTIONS;