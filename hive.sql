DROP DATANBASE IF EXISTS PXDFDEMO;
CREATE DATABASE PXFDEMO;
USE DATABASE PXFDEMO;
DROP TABLE IF EXISTS customer_temp;
CREATE EXTERNAL TABLE customer_temp
  ( c_customer_sk             bigint              --not null
  , c_customer_id             string              --not null
  , c_current_cdemo_sk        bigint
  , c_current_hdemo_sk        bigint
  , c_current_addr_sk         bigint
  , c_first_shipto_date_sk    bigint
  , c_first_sales_date_sk     bigint
  , c_salutation              string
  , c_first_name              string
  , c_last_name               string
  , c_preferred_cust_flag     string
  , c_birth_day               int
  , c_birth_month             int
  , c_birth_year              int
  , c_birth_country           string
  , c_login                   string
  , c_email_address           string
  , c_last_review_date        string
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/demo/customer'
;


DROP TABLE IF EXISTS customer;
CREATE TABLE customer
STORED AS ORC
AS
SELECT * FROM customer_temp;

DROP TABLE customer_temp;

DROP TABLE IF EXISTS customer_address_temp;
CREATE EXTERNAL TABLE customer_address_temp
  ( ca_address_sk             bigint              --not null
  , ca_address_id             string              --not null
  , ca_street_number          string
  , ca_street_name            string
  , ca_street_type            string
  , ca_suite_number           string
  , ca_city                   string
  , ca_county                 string
  , ca_state                  string
  , ca_zip                    string
  , ca_country                string
  , ca_gmt_offset             decimal(5,2)
  , ca_location_type          string
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/demo/customer_address'
;

DROP TABLE IF EXISTS customer_address;
CREATE TABLE customer_address
STORED AS ORC
AS
SELECT * FROM customer_address_temp
;

DROP TABLE customer_address_temp;


-- !echo Create _temporary table: customer_demographics_temp;
DROP TABLE IF EXISTS customer_demographics_temp;
CREATE EXTERNAL TABLE customer_demographics_temp
  ( cd_demo_sk                bigint                ----not null
  , cd_gender                 string
  , cd_marital_status         string
  , cd_education_status       string
  , cd_purchase_estimate      int
  , cd_credit_rating          string
  , cd_dep_count              int
  , cd_dep_employed_count     int
  , cd_dep_college_count      int

  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/demo/customer_demographics'
;

DROP TABLE IF EXISTS customer_demographics;
CREATE TABLE customer_demographics
STORED AS ORC
AS
SELECT * FROM customer_demographics_temp
;

DROP TABLE customer_demographics_temp;
