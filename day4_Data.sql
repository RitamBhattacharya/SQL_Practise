#Delete previous table :
====================

DROP TABLE reserve PURGE;
DROP TABLE boat PURGE;
DROP TABLE sailor PURGE;

#Sailor table create:-
====================

CREATE TABLE SAILOR (SID VARCHAR2(4), SNAME VARCHAR2(15), MNAME VARCHAR2(15), SURNAME VARCHAR2(15), RATING NUMBER(2), AGE NUMBER(3,1));

ALTER TABLE SAILOR ADD CONSTRAINT PRIMARY_KEY_SID PRIMARY KEY (SID);

ALTER TABLE SAILOR ADD CONSTRAINT START_WITH_S CHECK (SID LIKE 's%');

ALTER TABLE SAILOR ADD CONSTRAINT INITIAL_CAP CHECK(SNAME=INITCAP(SNAME));

#Boat table create:-
====================

CREATE TABLE BOAT (BID NUMBER(4), BNAME VARCHAR2(10), COLOR VARCHAR2(6));

ALTER TABLE BOAT ADD CONSTRAINT PRIMARY_KEY_BID PRIMARY KEY (BID);

ALTER TABLE BOAT ADD CONSTRAINT ALL_SMALL CHECK(BNAME=LOWER(BNAME));

ALTER TABLE BOAT ADD CONSTRAINT COLOR_SET CHECK(COLOR IN ('red', 'blue','green'));


#Reserve table create:-
======================

CREATE TABLE RESERVE (SID VARCHAR2(4), BID NUMBER(3), DAY DATE);

ALTER TABLE RESERVE ADD CONSTRAINT FOREIGN_KEY_SID_SAILOR FOREIGN KEY(SID) REFERENCES SAILOR(SID);

ALTER TABLE RESERVE ADD CONSTRAINT FOREIGN_KEY_BID_BOAT FOREIGN KEY (BID) REFERENCES BOAT(BID);

ALTER TABLE RESERVE ADD CONSTRAINT DATE_CHECK_2000 CHECK (DAY<'01-JAN-2000');

ALTER TABLE RESERVE ADD CONSTRAINT PK_RESERVE PRIMARY KEY (SID, BID);

#Insert values to Sailor:-
======================= 

SET AUTOCOMMIT ON;

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s22', 'Fredico', 'Roberts', 7, 45);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s31', 'Lubber', 'Sheen', 8, 55.5);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s32', 'Charlotte', 'Gordin', 8, 25);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s58', 'Mary', 'Beth Lyon', 10, 35);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s64', 'Horatio', 'Powell', 7, 35.4);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s71', 'Zorba', 'Alex', 10, 16);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s29', 'Brutus', 'Slater', 1, 33.8);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s95', 'Deep', 'Graceb Davis', 3, 63.5);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s74', 'Horatio', 'Forrest', 9, 35);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s85', 'Sara', 'Art Powell', 3, 25.5);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s80', 'Deep', 'Kumar', 6, 17);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s87', 'Deep', 'Kumar Jha', 8, 51);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s99', 'Bob', 'Krishnan', 7, 42.5);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s98', 'Dip', 'Dutta', 5, 35.5);

INSERT INTO SAILOR (SID, SNAME, SURNAME, RATING, AGE) VALUES ('s97', 'Dweep', 'Dey', 6, 25);



#Insert values to Boat:-
=======================

INSERT INTO BOAT VALUES ('101', 'interlake', 'blue');

INSERT INTO BOAT VALUES ('102', 'interlake', 'red');

INSERT INTO BOAT VALUES ('103', 'clipper', 'green');

INSERT INTO BOAT VALUES ('104', 'marine', 'red');

#Insert values to Reserve:-
=========================

INSERT INTO RESERVE VALUES ('s22', '101', '10-OCT-98');

INSERT INTO RESERVE VALUES ('s22', '103', '10-AUG-98');

INSERT INTO RESERVE VALUES ('s22', '102', '10-OCT-98');

INSERT INTO RESERVE VALUES ('s22', '104', '10-JUL-98');

INSERT INTO RESERVE VALUES ('s31', '102', '11-OCT-98');

INSERT INTO RESERVE VALUES ('s31', '103', '11-JUN-98');

INSERT INTO RESERVE VALUES ('s31', '104', '11-DEC-98');

INSERT INTO RESERVE VALUES ('s64', '101', '09-MAY-98');

INSERT INTO RESERVE VALUES ('s64', '102', '09-AUG-98');

INSERT INTO RESERVE VALUES ('s74', '103','09-AUG-98');

INSERT INTO RESERVE VALUES ('s80', '102', '07-JUL-98');

INSERT INTO RESERVE VALUES ('s87', '101', '08-JUL-98');

INSERT INTO RESERVE VALUES ('s87', '102', '12-DEC-98');

SELECT * FROM SAILOR;

SELECT * FROM BOAT;

SELECT * FROM RESERVE;

SELECT * FROM SAILOR INNER JOIN RESERVE ON SAILOR.SID=RESERVE.SID;

SELECT * FROM SAILOR NATURAL JOIN RESERVE;


