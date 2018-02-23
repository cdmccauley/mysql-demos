
 /*============================================================*/
/* DBMS name: MySQL and ANSI Level 2 						  */
/* Build database based upon p239/240           			  */
/*============================================================*/

DROP DATABASE CHAPTER8;
		/* generates an error on first run as there is no DB to drop, but prevents errors if re-installing */
CREATE DATABASE CHAPTER8;
		/* creates database */
USE CHAPTER8;
		/* makes this the one we are using */

/*============================================================*/
/* table: product
/*============================================================*/

 CREATE TABLE PRODUCT
 (PRODUCT_NUMBER VARCHAR(10) NOT NULL,
 PRODUCT_DESCRIPTION VARCHAR(100) NOT NULL,
 LIST_UNIT_PRICE NUMERIC(7,2) NOT NULL);

 ALTER TABLE PRODUCT
 ADD CONSTRAINT PK_PRODUCT
  PRIMARY KEY (PRODUCT_NUMBER);

/*============================================================*/
/* table: customer
/*============================================================*/

CREATE TABLE CUSTOMER
(CUSTOMER_NUMBER NUMERIC(5) NOT NULL,
  NAME VARCHAR(25) NOT NULL,
  ADDRESS VARCHAR(255) NOT NULL,
  CITY VARCHAR(50) NOT NULL,
  STATE CHAR(2) NOT NULL,
  ZIP_CODE VARCHAR(10));

ALTER TABLE CUSTOMER
ADD CONSTRAINT PK_CUSTOMER
  PRIMARY KEY (CUSTOMER_NUMBER);

/*============================================================*/
/* table: invoice
/*============================================================*/

CREATE TABLE INVOICE
(INVOICE_NUMBER NUMERIC(7) NOT NULL,
  CUSTOMER_NUMBER NUMERIC(5) NOT NULL,
  TERMS VARCHAR(20) NULL,
  SHIP_VIA VARCHAR(30) NULL,
  ORDER_DATE DATE NOT NULL);

ALTER TABLE INVOICE
ADD CONSTRAINT PK_INVOICE
  PRIMARY KEY (INVOICE_NUMBER);

ALTER TABLE INVOICE
ADD CONSTRAINT FK_INVOICE_NUMBER
  FOREIGN KEY (CUSTOMER_NUMBER)
  REFERENCES CUSTOMER (CUSTOMER_NUMBER);

/*============================================================*/
/* table: invoice_line_item
/*============================================================*/

CREATE TABLE INVOICE_LINE_ITEM
(INVOICE_NUMBER NUMERIC(7) NOT NULL,
  PRODUCT_NUMBER VARCHAR(10) NOT NULL,
  QUANTITY NUMERIC(5) NOT NULL,
  SALE_UNIT_PRICE NUMERIC(7,2) NOT NULL);

ALTER TABLE INVOICE_LINE_ITEM
ADD CONSTRAINT PK_INVOICE_LINE_ITEM
  PRIMARY KEY (INVOICE_NUMBER, PRODUCT_NUMBER);

ALTER TABLE INVOICE_LINE_ITEM
ADD CONSTRAINT CK_INVOICE_SALE_UNIT_PRICE
  CHECK (SALE_UNIT_PRICE >= 0);

ALTER TABLE INVOICE_LINE_ITEM
ADD CONSTRAINT FK_INVOICE_LINE_ITEM_INVOICE
  FOREIGN KEY (INVOICE_NUMBER)
  REFERENCES INVOICE (INVOICE_NUMBER);

ALTER TABLE INVOICE_LINE_ITEM
ADD CONSTRAINT FK_INVOICE_LINE_ITEM_PRODUCT
  FOREIGN KEY (PRODUCT_NUMBER)
  REFERENCES PRODUCT (PRODUCT_NUMBER);
