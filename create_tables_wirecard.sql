create database wirecard;
-- -----------------------------------------------------
-- Table account
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.account ;

CREATE TABLE IF NOT EXISTS wirecard.account (
  id                   BIGINT,
  status               BIGINT,
  type                 BIGINT,
  fee_type             BIGINT,
  has_bonus_withdraw   BIGINT,
  v2_integration_level BIGINT,
  negotiated_tax       BIGINT,
  is_transparent       BIGINT
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table account_fixed_table_fee
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.account_fixed_table_fee ;

CREATE TABLE IF NOT EXISTS wirecard.account_fixed_table_fee (
  id                    BIGINT,
  account_id            BIGINT,
  payment_form_id       BIGINT,
  parcel_number         BIGINT,
  fixed_tax_percentual  STRING,
  parcel_tax_percentual STRING,
  fixed_tax_value       STRING 
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table payment_form
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.payment_form ;

CREATE TABLE IF NOT EXISTS wirecard.payment_form (
  id                    BIGINT,
  name                  STRING,
  maximum_installments  BIGINT 
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table account_payment_fee
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.account_payment_fee ;

CREATE TABLE IF NOT EXISTS wirecard.account_payment_fee (
  id                          BIGINT,
  account_id                  BIGINT,
  payment_form_id             BIGINT,
  fixed                       DOUBLE,
  antecipation_percentage     DOUBLE,
  one_parcel                  DOUBLE,
  between_two_and_six_parcels DOUBLE,
  more_than_seven_parcels     DOUBLE 
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table channel
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.channel ;

CREATE TABLE IF NOT EXISTS wirecard.channel (
  id          BIGINT,
  name        STRING,
  account_id  BIGINT 
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table accounts_channels
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.accounts_channels ;

CREATE TABLE IF NOT EXISTS wirecard.accounts_channels (
  channel_id  BIGINT,
  account_id  BIGINT )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table channel_fixed_table_fee
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.channel_fixed_table_fee ;

CREATE TABLE IF NOT EXISTS wirecard.channel_fixed_table_fee (
  id                    BIGINT,
  channel_id            BIGINT,
  payment_form_id       BIGINT,
  parcel_number         BIGINT,
  fixed_tax_percentual  DOUBLE ,
  parcel_tax_percentual DOUBLE ,
  fixed_tax_value       DOUBLE 
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table fixed_table_fee
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.fixed_table_fee ;

CREATE TABLE IF NOT EXISTS wirecard.fixed_table_fee (
  id                    BIGINT,
  payment_form_id       BIGINT,
  parcel_number         BIGINT,
  fixed_tax_percentual  STRING,
  parcel_tax_percentual STRING,
  fixed_tax_value       STRING 
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table member
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.member ;

CREATE TABLE IF NOT EXISTS wirecard.member (
  id        BIGINT,
  name      STRING,
  login     STRING,
  enable    BIGINT,
  last_name STRING
  )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


-- -----------------------------------------------------
-- Table tax_applied_to_account
-- -----------------------------------------------------
DROP TABLE IF EXISTS wirecard.tax_applied_to_account ;

CREATE TABLE IF NOT EXISTS wirecard.tax_applied_to_account (
  id              BIGINT,
  account_id      BIGINT,
  payment_form_id BIGINT,
  fixed           STRING,
  percentual      STRING )
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' 
 STORED AS PARQUET;


