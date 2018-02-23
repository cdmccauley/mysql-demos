/* acme-industries-db: CHAPTER8_PART2 */

/* drop, database: chapter8_part2 */
/* in case of already using database */
DROP DATABASE CHAPTER8_PART2;

/* create, database: chapter8_part2 */
CREATE DATABASE CHAPTER8_PART2;

/* use, database: chapter8_part2 */
USE CHAPTER8_PART2;

/* create, table: customer */
CREATE TABLE CUSTOMER
  (CUSTOMER_NUMBER  NUMERIC(5)    NOT NULL,
  NAME              VARCHAR(25)   NOT NULL,
  ADDRESS           VARCHAR(255)  NOT NULL,
  CITY              VARCHAR(50)   NOT NULL,
  STATE             CHAR(2)       NOT NULL,
  ZIP_CODE          VARCHAR(10));

/* primary key constraint, table: customer */
ALTER TABLE CUSTOMER
  ADD CONSTRAINT PK_CUSTOMER
    PRIMARY KEY (CUSTOMER_NUMBER);

/* create, table: invoice */
CREATE TABLE INVOICE
  (INVOICE_NUMBER     NUMERIC(7)  NOT NULL,
  CUSTOMER_NUMBER     NUMERIC(5)  NOT NULL,
  CUSTOMER_PO_NUMBER  VARCHAR(10) NULL,
  SHIP_VIA            VARCHAR(10) NULL,
  ORDER_DATE          DATE        NOT NULL);

/* primary key constraint, table: invoice */
ALTER TABLE INVOICE
  ADD CONSTRAINT PK_INVOICE
    PRIMARY KEY (INVOICE_NUMBER);

/* referential constraint, table: invoice */
ALTER TABLE INVOICE
  ADD CONSTRAINT FK_INVOICE_CUSTOMER
    FOREIGN KEY (CUSTOMER_NUMBER)
    REFERENCES CUSTOMER (CUSTOMER_NUMBER);

/* unique constraint, table: invoice */
ALTER TABLE INVOICE
  ADD CONSTRAINT UNQ_INVOICE_CUST_NUMB_PO
    UNIQUE (CUSTOMER_NUMBER, CUSTOMER_PO_NUMBER);

/* check constraint, table: invoice */
ALTER TABLE INVOICE
  ADD CONSTRAINT INVOICE_CK_TERMS
    CHECK (TERMS IN('EOM', 'Net 30', 'Cash Account'));
