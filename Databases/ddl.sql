CREATE DATABASE toys_JavaWithDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

use toys_JavaWithDB;

CREATE TABLE ANSWERS
(
  QUESTIONS_UID VARCHAR(200) NOT NULL COMMENT '문항 대표값',
  EXAMPLE_UID   VARCHAR(200) NOT NULL COMMENT '설문문항 대표값',
  PRIMARY KEY (QUESTIONS_UID, EXAMPLE_UID)
) COMMENT '답변';

CREATE TABLE EXAMPLE_LIST
(
  EXAMPLE_UID VARCHAR(200) NOT NULL COMMENT '설문문항 대표값',
  EXAMPLE     VARCHAR(200) NOT NULL COMMENT '설문답항',
  ORDERS      INTEGER      NULL     COMMENT '설문순서',
  PRIMARY KEY (EXAMPLE_UID)
) COMMENT '설문답항 목록';

CREATE TABLE QUESTIONS_LIST
(
  QUESTIONS_UID VARCHAR(200) NOT NULL COMMENT '문항 대표값',
  QUESTIONS     VARCHAR(200) NULL     COMMENT '설문 문항',
  ORDERS        INTEGER      NOT NULL COMMENT '설문 순서',
  PRIMARY KEY (QUESTIONS_UID)
) COMMENT '설문문항 목록';

CREATE TABLE SURVEY
(
  USERS_UID     VARCHAR(200) NOT NULL COMMENT '사용자 대표값',
  QUESTIONS_UID VARCHAR(200) NOT NULL COMMENT '문항 대표값',
  EXAMPLE_UID   VARCHAR(200) NOT NULL COMMENT '설문문항 대표값',
  PRIMARY KEY (USERS_UID, QUESTIONS_UID, EXAMPLE_UID)
) COMMENT '설문';

CREATE TABLE USERS_LIST
(
  USERS_UID VARCHAR(200) NOT NULL COMMENT '사용자 대표값',
  PHONE     VARCHAR(200) NULL     COMMENT '핸드폰 번호',
  NAME      VARCHAR(200) NULL     COMMENT '이름',
  PRIMARY KEY (USERS_UID)
) COMMENT '사용자(설문자) 목록';

ALTER TABLE SURVEY
  ADD CONSTRAINT FK_USERS_LIST_TO_SURVEY
    FOREIGN KEY (USERS_UID)
    REFERENCES USERS_LIST (USERS_UID);

ALTER TABLE SURVEY
  ADD CONSTRAINT FK_QUESTIONS_LIST_TO_SURVEY
    FOREIGN KEY (QUESTIONS_UID)
    REFERENCES QUESTIONS_LIST (QUESTIONS_UID);

ALTER TABLE ANSWERS
  ADD CONSTRAINT FK_QUESTIONS_LIST_TO_ANSWERS
    FOREIGN KEY (QUESTIONS_UID)
    REFERENCES QUESTIONS_LIST (QUESTIONS_UID);

ALTER TABLE ANSWERS
  ADD CONSTRAINT FK_EXAMPLE_LIST_TO_ANSWERS
    FOREIGN KEY (EXAMPLE_UID)
    REFERENCES EXAMPLE_LIST (EXAMPLE_UID);

ALTER TABLE SURVEY
  ADD CONSTRAINT FK_EXAMPLE_LIST_TO_SURVEY
    FOREIGN KEY (EXAMPLE_UID)
    REFERENCES EXAMPLE_LIST (EXAMPLE_UID);
