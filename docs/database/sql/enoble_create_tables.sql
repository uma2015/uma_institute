DROP TABLE ENOBLE.SCHEDULE;
DROP TABLE ENOBLE.TRAINER_BATCH CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.TRAINER CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.TRAINEE_BATCH CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.TRAINEE CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.COURSE_SECTION CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.BATCH CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.USER_T CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.SECTION CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.COURSE CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.ADDRESS CASCADE CONSTRAINTS;
DROP TABLE ENOBLE.ROLE CASCADE CONSTRAINTS;

CREATE TABLE ENOBLE.ROLE
(
ROLE_ID VARCHAR2(10) NOT NULL,
ROLE_NAME VARCHAR2(100) NOT NULL,
NOTE VARCHAR2(1000),
CONSTRAINT ROLE_PK1 PRIMARY KEY (ROLE_ID)
);

CREATE TABLE ENOBLE.ADDRESS
(
ID NUMBER ,
ADDR_L1	VARCHAR2(100),
ADDR_L2	 VARCHAR2(100),
CITY	VARCHAR2(100),
STATE	VARCHAR2(100),
COUNTRY	VARCHAR2(100),
ZIPCODE	VARCHAR2(15)	NOT NULL,
CONSTRAINT ADDRESS_PK1 PRIMARY KEY (ID)
);


CREATE TABLE ENOBLE.USER_T
(
ID	NUMBER(10),
LOGIN_ID	VARCHAR2(20)	NOT NULL,
PASSWORD	VARCHAR2(20)	NOT NULL,
ROLE_ID		VARCHAR2(10)	NOT NULL,
FIRST_NAME	VARCHAR2(100)	NOT NULL,
LAST_NAME	VARCHAR2(100)	NOT NULL,
MIDDLE_NAME	VARCHAR2(100),
DATE_OF_BIRTH	DATE	NOT NULL,
EMAIL_ID	VARCHAR2(100)	NOT NULL,
LEGAL_STATUS	VARCHAR2(20),
CELL_NO	VARCHAR2(15),
HOME_NO	VARCHAR2(15),
OFFICE_NO	VARCHAR2(15),
HI_QUALIFICATION	VARCHAR2(100),
HOME_ADDRESS_ID		NUMBER,
OFFICE_ADDRESS_ID	NUMBER,
JOIN_DATE	DATE,
GENDER	VARCHAR2(7),
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10) ,
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10),
UPDATE_DATE	DATE,

CONSTRAINT USER_PK1 PRIMARY KEY (ID),
CONSTRAINT USER_ROLEFK1 FOREIGN KEY (ROLE_ID)
	  REFERENCES ENOBLE.ROLE (ROLE_ID) ,
	CONSTRAINT USER_ADDRFK1 FOREIGN KEY (HOME_ADDRESS_ID)
	  REFERENCES ENOBLE.ADDRESS (ID) ,
	 CONSTRAINT USER_ADDRFK2 FOREIGN KEY (OFFICE_ADDRESS_ID)
	  REFERENCES ENOBLE.ADDRESS (ID)
);



CREATE TABLE ENOBLE.COURSE
(
ID	VARCHAR2(10),
NAME	VARCHAR2(100) NOT NULL,
DESCRIPTION	VARCHAR2(500),
STATUS	VARCHAR2(20) NOT NULL,
FEE	NUMBER(10,2) NOT NULL,
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10) ,
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,

CONSTRAINT COURSE_PK1 PRIMARY KEY (ID),
 CONSTRAINT COURSE_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID),
	  CONSTRAINT COURSE_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) 
);

CREATE TABLE ENOBLE.SECTION
(
ID	NUMBER(10),
NAME	VARCHAR2(100)  NOT NULL,
DESCRIPTION	VARCHAR2(500),
STATUS	VARCHAR2(20)  NOT NULL,
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10) ,
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,


CONSTRAINT SECTION_PK1 PRIMARY KEY (ID),
CONSTRAINT SECTION_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT SECTION_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) 
);

CREATE TABLE ENOBLE.COURSE_SECTION
(
ID	NUMBER(10) ,
COURSE_ID	 VARCHAR2(10) NOT NULL,
SECTION_ID	NUMBER(10) NOT NULL,
COURSE_SECTION_STATUS	VARCHAR2(20) NOT NULL,
CREATED_ID	NUMBER(10) ,
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,

CONSTRAINT COURSE_SECTION_PK1 PRIMARY KEY (ID),
CONSTRAINT COURSE_SECTION_UNIQ1 UNIQUE (COURSE_ID,SECTION_ID),
CONSTRAINT COURSE_SECTION_C_IDFK1 FOREIGN KEY (COURSE_ID)
	  REFERENCES ENOBLE.COURSE (ID) ,
 CONSTRAINT COURSE_SECTION_S_IDFK1 FOREIGN KEY (SECTION_ID)
	  REFERENCES ENOBLE.SECTION (ID) ,
CONSTRAINT COURSE_SECTION_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT COURSE_SECTION_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID)
);

CREATE TABLE ENOBLE.BATCH
(
BATCH_ID	 VARCHAR2(10) ,
BATCH_DESC	VARCHAR2(100)  NOT NULL,
COURSE_ID	VARCHAR2(10)  NOT NULL,
BATCH_STATUS	VARCHAR2(20)	 NOT NULL,
BATCH_FEE	NUMBER(10,2)  NOT NULL,
START_DATE	 DATE	 NOT NULL,
END_DATE	DATE	 NOT NULL,
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10) ,
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,


CONSTRAINT BATCH_PK1 PRIMARY KEY (BATCH_ID),
CONSTRAINT BATCH_C_IDFK1 FOREIGN KEY (COURSE_ID)
	  REFERENCES ENOBLE.COURSE (ID) ,
CONSTRAINT BATCH_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT BATCH_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) 
);



CREATE TABLE ENOBLE.TRAINEE
(
TRAINEE_ID	NUMBER(10),
SKILL		VARCHAR2(100),
EXPERIENCE	 VARCHAR2(20),
PREV_COMPANY	VARCHAR2(100),
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10),
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,

CONSTRAINT TRAINEE_PK1 PRIMARY KEY (TRAINEE_ID),
CONSTRAINT TRAINEE_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT TRAINEE_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) 
);

CREATE TABLE ENOBLE.TRAINEE_BATCH
(
BATCH_ID	 VARCHAR2(20),
TRAINEE_ID	NUMBER(10),
FEE	NUMBER(10,2) NOT NULL,
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10),
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,


CONSTRAINT TRAINEE_BATCH_PK1 PRIMARY KEY (BATCH_ID,TRAINEE_ID),
CONSTRAINT TRAINEE_BATCH_T_IDFK1 FOREIGN KEY (TRAINEE_ID)
	  REFERENCES ENOBLE.TRAINEE (TRAINEE_ID) ,
CONSTRAINT TRAINEE_BATCH_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT TRAINEE_BATCH_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID)  
);

CREATE TABLE ENOBLE.TRAINER
(
TRAINER_ID	NUMBER(10),
COURSE_SECTION_ID	NUMBER(10) ,
FEE	NUMBER(10,2) NOT NULL,
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10) ,
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,


CONSTRAINT TRAINER_PK1 PRIMARY KEY (TRAINER_ID,COURSE_SECTION_ID),
CONSTRAINT TRAINER_TIDFK1 FOREIGN KEY (TRAINER_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
CONSTRAINT TRAINER_CS_IDFK1 FOREIGN KEY (COURSE_SECTION_ID)
	  REFERENCES ENOBLE.COURSE_SECTION (ID) ,
CONSTRAINT TRAINER_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT TRAINER_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID)  
);

CREATE TABLE ENOBLE.TRAINER_BATCH
(
BATCH_ID	 VARCHAR2(20) NOT NULL,
TRAINER_ID	NUMBER(10) NOT NULL,
COURSE_SECTION_ID	NUMBER(10) NOT NULL,
FEE	NUMBER(10,2) NOT NULL,
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10) ,
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,

CONSTRAINT TRAINER_BATCH_PK1 PRIMARY KEY (BATCH_ID,TRAINER_ID,COURSE_SECTION_ID),
CONSTRAINT TRAINER_BATCH_BATCH_IDFK1 FOREIGN KEY (BATCH_ID)
	  REFERENCES ENOBLE.BATCH (BATCH_ID) ,
	  CONSTRAINT TRAINER_BATCH_T_IDFK1 FOREIGN KEY (TRAINER_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT TRAINER_BATCH_CS_IDFK1 FOREIGN KEY (COURSE_SECTION_ID)
	  REFERENCES ENOBLE.COURSE_SECTION (ID) ,
CONSTRAINT TRAINER_BATCH_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID)  ,
	  CONSTRAINT TRAINER_BATCH_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) 
);

CREATE TABLE ENOBLE.SCHEDULE
(
ID	NUMBER(10),
BATCH_ID	VARCHAR2(20),
USER_ID		NUMBER(10),
COURSE_SECTION_ID NUMBER(10),
SCHEDULE_DATE	DATE NOT NULL,
DURATION	NUMBER(5,2) NOT NULL,
NOTE	VARCHAR2(1000),
CREATED_ID	NUMBER(10) ,
CREATE_DATE	DATE,
UPDATED_ID	NUMBER(10) ,
UPDATE_DATE	DATE,

CONSTRAINT SCHEDULE_PK1 PRIMARY KEY (ID),
CONSTRAINT SCHEDULE_CS_IDFK1 FOREIGN KEY (COURSE_SECTION_ID)
	  REFERENCES ENOBLE.COURSE_SECTION (ID) ,
CONSTRAINT SCHEDULE_U_IDFK1 FOREIGN KEY (USER_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT SCHEDULE_CREATEDFK1 FOREIGN KEY (CREATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) ,
	  CONSTRAINT SCHEDULE_UPDATEDFK1 FOREIGN KEY (UPDATED_ID)
	  REFERENCES ENOBLE.USER_T (ID) 
);

