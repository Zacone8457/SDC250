--The script is looking a little different from pics because I didn't want to spend time copying data (it does the same thing).
-- 1
ALTER TABLE PRODUCTLIST
ADD price number(6,2), description varchar(250);

UPDATE PRODUCTLIST
SET price = 22.22, description = 'The next big indie game of the year!'
WHERE productcode = 'GAME1';

UPDATE PRODUCTLIST
SET price = 65.43, description = 'One of these things is NOT like the other...'
WHERE PRODUCTCODE = 'GAME2';

DROP TABLE STOREFRONT;

-- 2
CREATE TABLE CHATLOG(
    PRIMARY KEY(chatid),
    chatid number(3),
    receiverid number(3), FOREIGN KEY(receiverid) REFERENCES USERBASE(userid),
    senderid number(3), FOREIGN KEY(senderid) REFERENCES USERBASE(userid),
    datesent date,
    content varchar2(250),
);

INSERT ALL
    INTO CHATLOG VALUES(1, 101, 102, '2/11/2026', 'Hello')
    INTO CHATLOG VALUES(2, 102, 103, '2/11/2026', 'Hola')
    INTO CHATLOG VALUES(3, 103, 104, '2/11/2026', 'Hola')
    INTO CHATLOG VALUES(4, 104, 105, '2/11/2026', 'Bonjour')
    INTO CHATLOG VALUES(5, 105, 106, '2/11/2026', 'Hi')
    INTO CHATLOG VALUES(6, 106, 107, '2/12/2026', 'Hi')
    INTO CHATLOG VALUES(7, 107, 108, '2/12/2026', 'Hey')
    INTO CHATLOG VALUES(8, 108, 109, '2/12/2026', 'Hallo')
    INTO CHATLOG VALUES(9, 109, 110, '2/12/2026', 'Hallo')
    INTO CHATLOG VALUES(10, 110, 101, '2/12/2026', 'Merry');

-- 3
CREATE TABLE FRIENDSLIST(
    PRIMARY KEY(userid, friendid),
    userid number(3), FOREIGN KEY(userid) REFERENCES USERBASE(userid),
    friendid number(3), FOREIGN KEY(friendid) REFERENCES USERBASE(userid)
);

INSERT ALL
    INTO CHATLOG VALUES(101, 102)
    INTO CHATLOG VALUES(102, 103)
    INTO CHATLOG VALUES(103, 104)
    INTO CHATLOG VALUES(104, 105)
    INTO CHATLOG VALUES(105, 106)
    INTO CHATLOG VALUES(106, 107)
    INTO CHATLOG VALUES(107, 108)
    INTO CHATLOG VALUES(108, 109)
    INTO CHATLOG VALUES(109, 110)
    INTO CHATLOG VALUES(110, 101);

-- 4
CREATE TABLE WISHLIST(
    PRIMARY KEY(userid, productcode),
    userid number(3), FOREIGN KEY(userid) REFERENCES USERBASE(userid),
    productcode varchar2(5), FOREIGN KEY(productcode) REFERENCES PRODUCTLIST(productcode),
    position number(3)
);

INSERT ALL
    INTO CHATLOG VALUES(101, 'GAME1', 1)
    INTO CHATLOG VALUES(102, 'GAME2', 2)
    INTO CHATLOG VALUES(103, 'GAME2', 1)
    INTO CHATLOG VALUES(104, 'GAME3', 2)
    INTO CHATLOG VALUES(105, 'GAME4', 3)
    INTO CHATLOG VALUES(106, 'GAME5', 1)
    INTO CHATLOG VALUES(107, 'GAME6', 2)
    INTO CHATLOG VALUES(108, 'Game6', 3)
    INTO CHATLOG VALUES(109, 'Game7', 4)
    INTO CHATLOG VALUES(110, 'Game8', 1);

-- 5

CREATE TABLE USERPROFILE(
    PRIMARY KEY(userid),
    userid number(3), FOREIGN KEY(userid) REFERENCES USERBASE(userid),
    imagefile varchar2(250),
    description varchar2(250)
);

INSERT ALL
    INTO CHATLOG VALUES(101, 'dog.png', 'My dog')
    INTO CHATLOG VALUES(102, 'cat.png', 'My cat')
    INTO CHATLOG VALUES(103, 'apple.jpg', null)
    INTO CHATLOG VALUES(104, 'door.png', null)
    INTO CHATLOG VALUES(105, 'aple.png', null)
    INTO CHATLOG VALUES(106, 'dog2.jpg', 'Look at my dog')
    INTO CHATLOG VALUES(107, 'dogdog.png', null)
    INTO CHATLOG VALUES(108, 'giraffe.png', 'Long')
    INTO CHATLOG VALUES(109, 'pineapple.jpg', 'Tropical')
    INTO CHATLOG VALUES(110, 'coconut.jpg', 'Tropical');

-- 6
CREATE TABLE SECURITYQUESTION(
    PRIMARY KEY(questionid),
    questionid number
    userid number(3), FOREIGN KEY(userid) REFERENCES USERBASE(userid),
    question varchar2(250),
    answer varchar2(250)
);

INSERT ALL
    INTO CHATLOG VALUES(1, 101, 'Is my account safe?', 'Yes')
    INTO CHATLOG VALUES(2, 102, 'Where''s the door?', null)
    INTO CHATLOG VALUES(3, 103, 'Is my account safe?', null)
    INTO CHATLOG VALUES(4, 104, 'Is my account safe?', null)
    INTO CHATLOG VALUES(5, 105, 'Where''s Brian?', 'There')
    INTO CHATLOG VALUES(6, 106, 'I need my account back', 'Please send a request to support')
    INTO CHATLOG VALUES(7, 107, 'When is the patch?', null)
    INTO CHATLOG VALUES(8, 108, 'Is my account safe?', null)
    INTO CHATLOG VALUES(9, 109, 'fkdsloew', null)
    INTO CHATLOG VALUES(10, 110, 'Where''s Brian?', 'Next door');
    
-- 7
CREATE TABLE COMMUNITYRULES(
    PRIMARY KEY(rulenum),
    rulenum number(3),
    title varchar2(250),
    description varchar2(250),
    severitypoint number(4)
);

INSERT ALL
    INTO CHATLOG VALUES(1, 'Spam', 'The channels have to remain clear and relevant, do not spam', 20)
    INTO CHATLOG VALUES(2, 'Brian', 'Brian knows you, and you know Brian', 5)
    INTO CHATLOG VALUES(3, 'Alts', 'We do not allow alternative accounts', 200)
    INTO CHATLOG VALUES(4, 'Exploiting', 'Manipulating the game''s mechanics', 600)
    INTO CHATLOG VALUES(5, 'Hacking', 'Harming the game''s structure', 800)
    INTO CHATLOG VALUES(6, 'Falsity', 'Lying on information we manage', 500)
    INTO CHATLOG VALUES(7, 'Botting', 'Third-Party automation is prohibited', 400)
    INTO CHATLOG VALUES(8, 'Griefing', 'Unecessary/Unnatural aggression to other players'' experience', 300)
    INTO CHATLOG VALUES(9, 'Duping', 'Unnatural duplication of entities', 200)
    INTO CHATLOG VALUES(10, 'The Door', null, 9999);

-- 8
CREATE TABLE INFRACTIONS(
    PRIMARY KEY(infractionid),
    infractionid number
    userid number(3), FOREIGN KEY(userid) REFERENCES USERBASE(userid),
    rulenum number(3), FOREIGN KEY(rulenum) REFERENCES COMMUNITYRULES(rulenum)
    dateassigned date,
    penalty varchar2(250)
);

INSERT ALL
    INTO CHATLOG VALUES(1, 101, 7, '2/12/2026', 'TEMP-BAN')
    INTO CHATLOG VALUES(2, 102, 5, '2/11/2026', 'TEMP-BAN')
    INTO CHATLOG VALUES(3, 103, 4, '2/11/2026', 'WARNING')
    INTO CHATLOG VALUES(4, 104, 5, '2/11/2026', 'ACCOUNT BAN')
    INTO CHATLOG VALUES(5, 105, 10, '2/13/2026', null)
    INTO CHATLOG VALUES(6, 106, 9, '2/12/2026', 'TEMP-BAN')
    INTO CHATLOG VALUES(7, 107, 8, '2/11/2026', 'TEMP-BAN')
    INTO CHATLOG VALUES(8, 108, 5, '2/11/2026', 'ACCOUNT BAN')
    INTO CHATLOG VALUES(9, 109, 10, '2/13/2026', null)
    INTO CHATLOG VALUES(10, 110, 1, '2/11/2026', 'WARNING');

-- 9
CREATE TABLE USERSUPPORT(
    PRIMARY KEY(ticketid),
    ticketid number,
    email varchar2(250),
    issue varchar2(250),
    datesubmitted date,
    dateupdated date, 
    status varchar2(250)
);

INSERT ALL
    INTO CHATLOG VALUES(1, 'Doherty@gmail.com', 'NULL', '9/11/2026', null, 'DONE')
    INTO CHATLOG VALUES(2, 'Doherty@gmail.com', 'Bug in version 2.19 BETA', '9/11/2026', '9/11/2026', 'DONE')
    INTO CHATLOG VALUES(3, 'Isabel.Cooper@gmail.com', 'The event crashed the server', '9/13/2026', '9/17/2026', 'IN PROGRESS')
    INTO CHATLOG VALUES(4, '92Gavin@yahoo.com', 'Hello?', '9/11/2026', null, 'NEW')
    INTO CHATLOG VALUES(5, 'CoolGuy@gmail.com', 'The game just went down?', '9/12/2026', '9/12/2026', 'IN PROGRESS')
    INTO CHATLOG VALUES(6, 'MattWilson@yahoo.com', 'I lost my password', '9/11/2026', '9/11/2026', 'DONE')
    INTO CHATLOG VALUES(7, 'AlexanderKingston@gmail.com', 'I want my account back', '9/12/2026', '9/13/2026', 'DONE')
    INTO CHATLOG VALUES(8, 'Smith.Smith2@gmail.com', 'O_O', '9/13/2026', null, 'NEW')
    INTO CHATLOG VALUES(9, 'SSmith@gmail.com', 'Everything is purple', '9/12/2026', '9/13/2026', 'NEW')
    INTO CHATLOG VALUES(10, 'EllieJo@gmail.com', 'What just happend?', '9/13/2026', '9/13/2026', 'DONE');

-- 10
CREATE VIEW securityquestion_view AS
SELECT DISTINCT question, answer FROM SECURITYQUESTION
WHERE question IS NOT null
ORDER BY answer;

CREATE VIEW usersupport_view AS
SELECT ticketid, email, issue, dateupdated FROM USERSUPPORT
WHERE status IN ('NEW', 'IN PROGRESS')
ORDER BY dateupdated desc;