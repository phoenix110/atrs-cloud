BEGIN;

CREATE TABLE MEMBER_LOGIN (
  CUSTOMER_NO VARCHAR(10) NOT NULL,
  PASSWORD  VARCHAR(60) NOT NULL,
  LAST_PASSWORD VARCHAR(60),
  LOGIN_DATE_TIME TIMESTAMP,
  LOGIN_FLG BOOLEAN NOT NULL
);

ALTER TABLE MEMBER_LOGIN ADD CONSTRAINT PK_MEMBER_LOGIN PRIMARY KEY (CUSTOMER_NO);


CREATE TABLE MEMBER (
  CUSTOMER_NO VARCHAR(10) NOT NULL,
  KANJI_FAMILY_NAME VARCHAR(10) NOT NULL,
  KANJI_GIVEN_NAME VARCHAR(10) NOT NULL,
  KANA_FAMILY_NAME VARCHAR(10) NOT NULL,
  KANA_GIVEN_NAME VARCHAR(10) NOT NULL,
  BIRTHDAY DATE NOT NULL,
  GENDER VARCHAR(1) NOT NULL,
  TEL VARCHAR(13) NOT NULL,
  ZIP_CODE VARCHAR(7) NOT NULL,
  ADDRESS VARCHAR(60) NOT NULL,
  MAIL VARCHAR(256) NOT NULL,
  CREDIT_NO VARCHAR(16) NOT NULL,
  CREDIT_TYPE_CD VARCHAR(3) NOT NULL,
  CREDIT_TERM VARCHAR(5) NOT NULL,
  PHOTO_FILE_NAME VARCHAR(51)
);

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (CUSTOMER_NO);


CREATE TABLE CREDIT_TYPE (
  CREDIT_TYPE_CD VARCHAR(3) NOT NULL,
  CREDIT_FIRM VARCHAR(80) NOT NULL,
  DISPLAY_ORDER INT NOT NULL UNIQUE
);

ALTER TABLE CREDIT_TYPE ADD CONSTRAINT PK_CREDIT_TYPE PRIMARY KEY (CREDIT_TYPE_CD);


CREATE TABLE FLIGHT_MASTER (
  FLIGHT_NAME VARCHAR(6) NOT NULL,
  ROUTE_NO INT NOT NULL,
  DEPARTURE_TIME VARCHAR(4) NOT NULL,
  ARRIVAL_TIME VARCHAR(4) NOT NULL,
  CRAFT_TYPE VARCHAR(16) NOT NULL
);

ALTER TABLE FLIGHT_MASTER ADD CONSTRAINT PK_FLIGHT_MASTER PRIMARY KEY (FLIGHT_NAME);


CREATE TABLE FLIGHT (
  DEPARTURE_DATE DATE NOT NULL,
  FLIGHT_NAME VARCHAR(6) NOT NULL,
  BOARDING_CLASS_CD VARCHAR(1) NOT NULL,
  FARE_TYPE_CD VARCHAR(4) NOT NULL,
  VACANT_NUM INT NOT NULL
);

ALTER TABLE FLIGHT ADD CONSTRAINT PK_FLIGHT PRIMARY KEY (DEPARTURE_DATE,FLIGHT_NAME,BOARDING_CLASS_CD,FARE_TYPE_CD);


CREATE TABLE RESERVE_FLIGHT (
  RESERVE_FLIGHT_NO INT NOT NULL,
  RESERVE_NO VARCHAR(10) NOT NULL,
  DEPARTURE_DATE DATE NOT NULL,
  FLIGHT_NAME VARCHAR(6) NOT NULL,
  BOARDING_CLASS_CD VARCHAR(1) NOT NULL,
  FARE_TYPE_CD VARCHAR(4) NOT NULL
);

ALTER TABLE RESERVE_FLIGHT ADD CONSTRAINT PK_RESERVE_FLIGHT PRIMARY KEY (RESERVE_FLIGHT_NO);



CREATE TABLE RESERVATION (
  RESERVE_NO VARCHAR(10) NOT NULL,
  RESERVE_DATE DATE NOT NULL,
  TOTAL_FARE INT NOT NULL,
  REP_FAMILY_NAME VARCHAR(10) NOT NULL,
  REP_GIVEN_NAME VARCHAR(10) NOT NULL,
  REP_AGE INT NOT NULL,
  REP_GENDER VARCHAR(1) NOT NULL,
  REP_TEL VARCHAR(13) NOT NULL,
  REP_MAIL VARCHAR(256) NOT NULL,
  REP_CUSTOMER_NO VARCHAR(10)
);

ALTER TABLE RESERVATION ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (RESERVE_NO);


CREATE TABLE ROUTE (
  ROUTE_NO INT NOT NULL,
  DEP_AIRPORT_CD VARCHAR(3) NOT NULL,
  ARR_AIRPORT_CD VARCHAR(3) NOT NULL,
  FLIGHT_TIME VARCHAR(4) NOT NULL,
  BASIC_FARE INT NOT NULL
);

ALTER TABLE ROUTE ADD CONSTRAINT PK_ROUTE PRIMARY KEY (ROUTE_NO);
ALTER TABLE ROUTE ADD CONSTRAINT UK_ROUTE_1 UNIQUE (DEP_AIRPORT_CD,ARR_AIRPORT_CD);


CREATE TABLE PASSENGER (
  PASSENGER_NO INT NOT NULL,
  RESERVE_FLIGHT_NO INT NOT NULL,
  FAMILY_NAME VARCHAR(10) NOT NULL,
  GIVEN_NAME VARCHAR(10) NOT NULL,
  AGE INT NOT NULL,
  GENDER VARCHAR(1) NOT NULL,
  CUSTOMER_NO VARCHAR(10)
);

ALTER TABLE PASSENGER ADD CONSTRAINT PK_PASSENGER PRIMARY KEY (PASSENGER_NO);


CREATE TABLE AIRPORT (
  AIRPORT_CD VARCHAR(3) NOT NULL,
  AIRPORT_NAME VARCHAR(15) NOT NULL,
  DISPLAY_ORDER INT NOT NULL UNIQUE
);

ALTER TABLE AIRPORT ADD CONSTRAINT PK_AIRPORT PRIMARY KEY (AIRPORT_CD);


CREATE TABLE PLANE (
  CRAFT_TYPE VARCHAR(16) NOT NULL,
  N_SEAT_NUM INT NOT NULL,
  S_SEAT_NUM INT NOT NULL
);

ALTER TABLE PLANE ADD CONSTRAINT PK_PLANE PRIMARY KEY (CRAFT_TYPE);


CREATE TABLE FARE_TYPE (
  FARE_TYPE_CD VARCHAR(4) NOT NULL,
  FARE_TYPE_NAME VARCHAR(10) NOT NULL,
  DISCOUNT_RATE INT NOT NULL,
  RSRV_AVAILABLE_START_DAY_NUM INT NOT NULL,
  RSRV_AVAILABLE_END_DAY_NUM INT NOT NULL,
  PASSENGER_MIN_NUM INT NOT NULL,
  DISPLAY_ORDER INT NOT NULL UNIQUE
);

ALTER TABLE FARE_TYPE ADD CONSTRAINT PK_FARE_TYPE PRIMARY KEY (FARE_TYPE_CD);


CREATE TABLE BOARDING_CLASS (
  BOARDING_CLASS_CD VARCHAR(1) NOT NULL,
  BOARDING_CLASS_NAME VARCHAR(10),
  EXTRA_CHARGE INT NOT NULL,
  DISPLAY_ORDER INT NOT NULL UNIQUE
);

ALTER TABLE BOARDING_CLASS ADD CONSTRAINT PK_BOARDING_CLASS PRIMARY KEY (BOARDING_CLASS_CD);


CREATE TABLE PEAK_TIME (
  PEAK_TIME_CD VARCHAR(10) NOT NULL,
  PEAK_START_DATE DATE NOT NULL,
  PEAK_END_DATE DATE NOT NULL,
  MULTIPLICATION_RATIO INT NOT NULL
);

ALTER TABLE PEAK_TIME ADD CONSTRAINT PK_PEAK_TIME PRIMARY KEY (PEAK_TIME_CD,PEAK_START_DATE,PEAK_END_DATE);


ALTER TABLE MEMBER_LOGIN ADD CONSTRAINT FK_MEMBER_LOGIN_1 FOREIGN KEY (CUSTOMER_NO) REFERENCES MEMBER (CUSTOMER_NO);


ALTER TABLE MEMBER ADD CONSTRAINT FK_MEMBER_1 FOREIGN KEY (CREDIT_TYPE_CD) REFERENCES CREDIT_TYPE (CREDIT_TYPE_CD);


ALTER TABLE FLIGHT_MASTER ADD CONSTRAINT FK_FLIGHT_MASTER_1 FOREIGN KEY (ROUTE_NO) REFERENCES ROUTE (ROUTE_NO);

ALTER TABLE FLIGHT_MASTER ADD CONSTRAINT FK_FLIGHT_MASTER_2 FOREIGN KEY (CRAFT_TYPE) REFERENCES PLANE (CRAFT_TYPE);



ALTER TABLE FLIGHT ADD CONSTRAINT FK_FLIGHT_1 FOREIGN KEY (FLIGHT_NAME) REFERENCES FLIGHT_MASTER (FLIGHT_NAME);

ALTER TABLE FLIGHT ADD CONSTRAINT FK_FLIGHT_2 FOREIGN KEY (BOARDING_CLASS_CD) REFERENCES BOARDING_CLASS (BOARDING_CLASS_CD);

ALTER TABLE FLIGHT ADD CONSTRAINT FK_FLIGHT_3 FOREIGN KEY (FARE_TYPE_CD) REFERENCES FARE_TYPE (FARE_TYPE_CD);


ALTER TABLE RESERVE_FLIGHT ADD CONSTRAINT FK_RESERVE_FLIGHT_1 FOREIGN KEY (RESERVE_NO) REFERENCES RESERVATION (RESERVE_NO);

ALTER TABLE RESERVE_FLIGHT ADD CONSTRAINT FK_RESERVE_FLIGHT_2 FOREIGN KEY (DEPARTURE_DATE,FLIGHT_NAME,BOARDING_CLASS_CD,FARE_TYPE_CD) REFERENCES FLIGHT (DEPARTURE_DATE,FLIGHT_NAME,BOARDING_CLASS_CD,FARE_TYPE_CD);


ALTER TABLE RESERVATION ADD CONSTRAINT FK_RESERVATION_1 FOREIGN KEY (REP_CUSTOMER_NO) REFERENCES MEMBER (CUSTOMER_NO);



ALTER TABLE ROUTE ADD CONSTRAINT FK_ROUTE_1 FOREIGN KEY (DEP_AIRPORT_CD) REFERENCES AIRPORT (AIRPORT_CD);

ALTER TABLE ROUTE ADD CONSTRAINT FK_ROUTE_2 FOREIGN KEY (ARR_AIRPORT_CD) REFERENCES AIRPORT (AIRPORT_CD);


ALTER TABLE PASSENGER ADD CONSTRAINT FK_PASSENGER_1 FOREIGN KEY (RESERVE_FLIGHT_NO) REFERENCES RESERVE_FLIGHT (RESERVE_FLIGHT_NO);

ALTER TABLE PASSENGER ADD CONSTRAINT FK_PASSENGER_2 FOREIGN KEY (CUSTOMER_NO) REFERENCES MEMBER (CUSTOMER_NO);

CREATE TABLE MESSAGE_ID (
  ID VARCHAR(50) NOT NULL UNIQUE
);

CREATE INDEX IX_ROUTE_1 ON ROUTE (DEP_AIRPORT_CD);


CREATE SEQUENCE SQ_MEMBER_1 MINVALUE 1 MAXVALUE 9999999999 CYCLE;
CREATE SEQUENCE SQ_RESERVATION_1 MINVALUE 1 MAXVALUE 9999999999 CYCLE;
CREATE SEQUENCE SQ_RESERVE_FLIGHT_1 MINVALUE 1 MAXVALUE 999999999999 CYCLE;
CREATE SEQUENCE SQ_PASSENGER_1 MINVALUE 1 MAXVALUE 9999999999999 CYCLE;

COMMIT;