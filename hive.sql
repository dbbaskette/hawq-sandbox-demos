DROP DATABASE IF EXISTS HIVE CASCADE;
CREATE DATABASE HIVE;
USE HIVE;


-- !echo Create temporary table: customer_temp;
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
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/customer'
;


-- !echo Load text data into ORC table: customer;
DROP TABLE IF EXISTS customer;
CREATE TABLE customer
STORED AS ORC
AS
SELECT * FROM customer_temp
;

-- !echo Drop temporary table: customer_temp;
DROP TABLE customer_temp;



-- !echo Create temporary table: customerAddress_temp;
DROP TABLE IF EXISTS customerAddress_temp;
CREATE EXTERNAL TABLE customerAddress_temp
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
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/customerAddress'
;

-- !echo Load text data into ORC table: customerAddress;
DROP TABLE IF EXISTS customerAddress;
CREATE TABLE customerAddress
STORED AS ORC
AS
SELECT * FROM customerAddress_temp
;

-- !echo Drop temporary table: customerAddress_temp;
DROP TABLE customerAddress_temp;


-- !echo Create temporary table: customerDemographics_temp;
DROP TABLE IF EXISTS customerDemographics_temp;
CREATE EXTERNAL TABLE customerDemographics_temp
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
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/customerDemographics'
;

-- !echo Load text data into ORC table: customerDemographics;
DROP TABLE IF EXISTS customerDemographics;
CREATE TABLE customerDemographics
STORED AS ORC
AS
SELECT * FROM customerDemographics_temp
;

-- !echo Drop temporary table: customerDemographics_temp;
DROP TABLE customerDemographics_temp;


-- !echo Create temporary table: date_dim_temp;
DROP TABLE IF EXISTS dateDim_temp;
CREATE EXTERNAL TABLE dateDim_temp
  ( d_date_sk                 bigint              --not null
  , d_date_id                 string              --not null
  , d_date                    string
  , d_month_seq               int
  , d_week_seq                int
  , d_quarter_seq             int
  , d_year                    int
  , d_dow                     int
  , d_moy                     int
  , d_dom                     int
  , d_qoy                     int
  , d_fy_year                 int
  , d_fy_quarter_seq          int
  , d_fy_week_seq             int
  , d_day_name                string
  , d_quarter_name            string
  , d_holiday                 string
  , d_weekend                 string
  , d_following_holiday       string
  , d_first_dom               int
  , d_last_dom                int
  , d_same_day_ly             int
  , d_same_day_lq             int
  , d_current_day             string
  , d_current_week            string
  , d_current_month           string
  , d_current_quarter         string
  , d_current_year            string
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/date'
;

-- !echo Load text data into ORC table: date;
DROP TABLE IF EXISTS dateDim;
CREATE TABLE dateDim
STORED AS ORC
AS
SELECT * FROM dateDim_temp
;

-- !echo Drop temporary table: date_temp;
DROP TABLE dateDim_temp;


-- !echo Create temporary table: householdDemographics_temp;
DROP TABLE IF EXISTS householdDemographics_temp;
CREATE EXTERNAL TABLE householdDemographics_temp
  ( hd_demo_sk                bigint                --not null
  , hd_income_band_sk         bigint
  , hd_buy_potential          string
  , hd_dep_count              int
  , hd_vehicle_count          int
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/householdDemographics'
;

-- !echo Load text data into ORC table: householdDemographics;
DROP TABLE IF EXISTS householdDemographics;
CREATE TABLE householdDemographics
STORED AS ORC
AS
SELECT * FROM householdDemographics_temp
;

-- !echo Drop temporary table: householdDemographics_temp;
DROP TABLE householdDemographics_temp;


-- !echo Create temporary table: income_temp;
DROP TABLE IF EXISTS income_temp;
CREATE EXTERNAL TABLE income_temp
  ( ib_income_band_sk         bigint              --not null
  , ib_lower_bound            int
  , ib_upper_bound            int
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/income_band'
;

-- !echo Load text data into ORC table: income;
DROP TABLE IF EXISTS income;
CREATE TABLE income
STORED AS ORC
AS
SELECT * FROM income_temp
;

-- !echo Drop temporary table: income_temp;
DROP TABLE income_temp;


-- !echo Create temporary table: item_temp;
DROP TABLE IF EXISTS item_temp;
CREATE EXTERNAL TABLE item_temp
  ( i_item_sk                 bigint              --not null
  , i_item_id                 string              --not null
  , i_rec_start_date          string
  , i_rec_end_date            string
  , i_item_desc               string
  , i_current_price           decimal(7,2)
  , i_wholesale_cost          decimal(7,2)
  , i_brand_id                int
  , i_brand                   string
  , i_class_id                int
  , i_class                   string
  , i_category_id             int
  , i_category                string
  , i_manufact_id             int
  , i_manufact                string
  , i_size                    string
  , i_formulation             string
  , i_color                   string
  , i_units                   string
  , i_container               string
  , i_manager_id              int
  , i_product_name            string
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/item'
;

-- !echo Load text data into ORC table: item;
DROP TABLE IF EXISTS item;
CREATE TABLE item
STORED AS ORC
AS
SELECT * FROM item_temp
;

-- !echo Drop temporary table: item_temp;
DROP TABLE item_temp;


-- !echo Create temporary table: promotion_temp;
DROP TABLE IF EXISTS promotion_temp;
CREATE EXTERNAL TABLE promotion_temp
  ( p_promo_sk                bigint              --not null
  , p_promo_id                string              --not null
  , p_start_date_sk           bigint
  , p_end_date_sk             bigint
  , p_item_sk                 bigint
  , p_cost                    decimal(15,2)
  , p_response_target         int
  , p_promo_name              string
  , p_channel_dmail           string
  , p_channel_email           string
  , p_channel_catalog         string
  , p_channel_tv              string
  , p_channel_radio           string
  , p_channel_press           string
  , p_channel_event           string
  , p_channel_demo            string
  , p_channel_details         string
  , p_purpose                 string
  , p_discount_active         string
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/promotion'
;

-- !echo Load text data into ORC table: promotion;
DROP TABLE IF EXISTS promotion;
CREATE TABLE promotion
STORED AS ORC
AS
SELECT * FROM promotion_temp
;

-- !echo Drop temporary table: promotion_temp;
DROP TABLE promotion_temp;


-- !echo Create temporary table: reason_temp;
DROP TABLE IF EXISTS reason_temp;
CREATE EXTERNAL TABLE reason_temp
  ( r_reason_sk               bigint              --not null
  , r_reason_id               string              --not null
  , r_reason_desc             string
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/reason'
;

-- !echo Load text data into ORC table: reason;
DROP TABLE IF EXISTS reason;
CREATE TABLE reason
STORED AS ORC
AS
SELECT * FROM reason_temp
;

-- !echo Drop temporary table: reason_temp;
DROP TABLE reason_temp;


-- !echo Create temporary table: shipMode_temp;
DROP TABLE IF EXISTS shipMode_temp;
CREATE EXTERNAL TABLE shipMode_temp
  ( sm_ship_mode_sk           bigint              --not null
  , sm_ship_mode_id           string              --not null
  , sm_type                   string
  , sm_code                   string
  , sm_carrier                string
  , sm_contract               string
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/shipMode'
;

-- !echo Load text data into ORC table: shipMode;
DROP TABLE IF EXISTS shipMode;
CREATE TABLE shipMode
STORED AS ORC
AS
SELECT * FROM shipMode_temp
;

-- !echo Drop temporary table: shipMode_temp;
DROP TABLE shipMode_temp;


-- !echo Create temporary table: store_temp;
DROP TABLE IF EXISTS store_temp;
CREATE EXTERNAL TABLE store_temp
  ( s_store_sk                bigint              --not null
  , s_store_id                string              --not null
  , s_rec_start_date          string
  , s_rec_end_date            string
  , s_closed_date_sk          bigint
  , s_store_name              string
  , s_number_employees        int
  , s_floor_space             int
  , s_hours                   string
  , s_manager                 string
  , s_market_id               int
  , s_geography_class         string
  , s_market_desc             string
  , s_market_manager          string
  , s_division_id             int
  , s_division_name           string
  , s_company_id              int
  , s_company_name            string
  , s_street_number           string
  , s_street_name             string
  , s_street_type             string
  , s_suite_number            string
  , s_city                    string
  , s_county                  string
  , s_state                   string
  , s_zip                     string
  , s_country                 string
  , s_gmt_offset              decimal(5,2)
  , s_tax_precentage          decimal(5,2)
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/store'
;

-- !echo Load text data into ORC table: store;
DROP TABLE IF EXISTS store;
CREATE TABLE store
STORED AS ORC
AS
SELECT * FROM store_temp
;

-- !echo Drop temporary table: store_temp;
DROP TABLE store_temp;


-- !echo Create temporary table: time_dim_temp;
DROP TABLE IF EXISTS timeDim_temp;
CREATE EXTERNAL TABLE timeDim_temp
  ( t_time_dim_sk                 bigint              --not null
  , t_time_dim_id                 string              --not null
  , t_time_dim                    int
  , t_hour                    int
  , t_minute                  int
  , t_second                  int
  , t_am_pm                   string
  , t_shift                   string
  , t_sub_shift               string
  , t_meal_time_dim               string
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/time_dim'
;

-- !echo Load text data into ORC table: time_dim;
DROP TABLE IF EXISTS timeDim;
CREATE TABLE timeDim
STORED AS ORC
AS
SELECT * FROM timeDim_temp
;

-- !echo Drop temporary table: time_dim_temp;
DROP TABLE timeDim_temp;


-- !echo Create temporary table: warehouse_temp;
DROP TABLE IF EXISTS warehouse_temp;
CREATE EXTERNAL TABLE warehouse_temp
  ( w_warehouse_sk            bigint              --not null
  , w_warehouse_id            string              --not null
  , w_warehouse_name          string
  , w_warehouse_sq_ft         int
  , w_street_number           string
  , w_street_name             string
  , w_street_type             string
  , w_suite_number            string
  , w_city                    string
  , w_county                  string
  , w_state                   string
  , w_zip                     string
  , w_country                 string
  , w_gmt_offset              decimal(5,2)
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/warehouse'
;

-- !echo Load text data into ORC table: warehouse;
DROP TABLE IF EXISTS warehouse;
CREATE TABLE warehouse
STORED AS ORC
AS
SELECT * FROM warehouse_temp
;

-- !echo Drop temporary table: warehouse_temp;
DROP TABLE warehouse_temp;


-- !echo Create temporary table: webSite_temp;
DROP TABLE IF EXISTS webSite_temp;
CREATE EXTERNAL TABLE webSite_temp
  ( web_site_sk               bigint              --not null
  , web_site_id               string              --not null
  , web_rec_start_date        string
  , web_rec_end_date          string
  , web_name                  string
  , web_open_date_sk          bigint
  , web_close_date_sk         bigint
  , web_class                 string
  , web_manager               string
  , web_mkt_id                int
  , web_mkt_class             string
  , web_mkt_desc              string
  , web_market_manager        string
  , web_company_id            int
  , web_company_name          string
  , web_street_number         string
  , web_street_name           string
  , web_street_type           string
  , web_suite_number          string
  , web_city                  string
  , web_county                string
  , web_state                 string
  , web_zip                   string
  , web_country               string
  , web_gmt_offset            decimal(5,2)
  , web_tax_percentage        decimal(5,2)
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/webSite'
;

-- !echo Load text data into ORC table: webSite;
DROP TABLE IF EXISTS webSite;
CREATE TABLE webSite
STORED AS ORC
AS
SELECT * FROM webSite_temp
;

-- !echo Drop temporary table: webSite_temp;
DROP TABLE webSite_temp;


-- !echo Create temporary table: webPage_temp;
DROP TABLE IF EXISTS webPage_temp;
CREATE EXTERNAL TABLE webPage_temp
  ( wp_web_page_sk            bigint              --not null
  , wp_web_page_id            string              --not null
  , wp_rec_start_date         string
  , wp_rec_end_date           string
  , wp_creation_date_sk       bigint
  , wp_access_date_sk         bigint
  , wp_autogen_flag           string
  , wp_customer_sk            bigint
  , wp_url                    string
  , wp_type                   string
  , wp_char_count             int
  , wp_link_count             int
  , wp_image_count            int
  , wp_max_ad_count           int
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/webPage'
;

-- !echo Load text data into ORC table: webPage;
DROP TABLE IF EXISTS webPage;
CREATE TABLE webPage
STORED AS ORC
AS
SELECT * FROM webPage_temp
;

-- !echo Drop temporary table: webPage_temp;
DROP TABLE webPage_temp;


-- !echo Create temporary table: inventory_temp;
DROP TABLE IF EXISTS inventory_temp;
CREATE EXTERNAL TABLE inventory_temp
  ( inv_date_sk               bigint                --not null
  , inv_item_sk               bigint                --not null
  , inv_warehouse_sk          bigint                --not null
  , inv_quantity_on_hand      int
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/inventory'
;

-- !echo Load text data into ORC table: inventory;
DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory
STORED AS ORC
AS
SELECT * FROM inventory_temp
;

-- !echo Drop temporary table: inventory_temp;
DROP TABLE inventory_temp;


-- !echo Create temporary table: storeSales_temp;
DROP TABLE IF EXISTS storeSales_temp;
CREATE EXTERNAL TABLE storeSales_temp
  ( ss_sold_date_sk           bigint
  , ss_sold_time_sk           bigint
  , ss_item_sk                bigint                --not null
  , ss_customer_sk            bigint
  , ss_cdemo_sk               bigint
  , ss_hdemo_sk               bigint
  , ss_addr_sk                bigint
  , ss_store_sk               bigint
  , ss_promo_sk               bigint
  , ss_ticket_number          bigint                --not null
  , ss_quantity               int
  , ss_wholesale_cost         decimal(7,2)
  , ss_list_price             decimal(7,2)
  , ss_sales_price            decimal(7,2)
  , ss_ext_discount_amt       decimal(7,2)
  , ss_ext_sales_price        decimal(7,2)
  , ss_ext_wholesale_cost     decimal(7,2)
  , ss_ext_list_price         decimal(7,2)
  , ss_ext_tax                decimal(7,2)
  , ss_coupon_amt             decimal(7,2)
  , ss_net_paid               decimal(7,2)
  , ss_net_paid_inc_tax       decimal(7,2)
  , ss_net_profit             decimal(7,2)
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/storeSales'
;

-- !echo Load text data into ORC table: storeSales;
DROP TABLE IF EXISTS storeSales;
CREATE TABLE storeSales
STORED AS ORC
AS
SELECT * FROM storeSales_temp
;

-- !echo Drop temporary table: storeSales_temp;
DROP TABLE storeSales_temp;


-- !echo Create temporary table: storeReturns_temp;
DROP TABLE IF EXISTS storeReturns_temp;
CREATE EXTERNAL TABLE storeReturns_temp
  ( sr_returned_date_sk       bigint
  , sr_return_time_sk         bigint
  , sr_item_sk                bigint                --not null
  , sr_customer_sk            bigint
  , sr_cdemo_sk               bigint
  , sr_hdemo_sk               bigint
  , sr_addr_sk                bigint
  , sr_store_sk               bigint
  , sr_reason_sk              bigint
  , sr_ticket_number          bigint                --not null
  , sr_return_quantity        int
  , sr_return_amt             decimal(7,2)
  , sr_return_tax             decimal(7,2)
  , sr_return_amt_inc_tax     decimal(7,2)
  , sr_fee                    decimal(7,2)
  , sr_return_ship_cost       decimal(7,2)
  , sr_refunded_cash          decimal(7,2)
  , sr_reversed_charge        decimal(7,2)
  , sr_store_credit           decimal(7,2)
  , sr_net_loss               decimal(7,2)
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/storeReturns'
;

-- !echo Load text data into ORC table: storeReturns;
DROP TABLE IF EXISTS storeReturns;
CREATE TABLE storeReturns
STORED AS ORC
AS
SELECT * FROM storeReturns_temp
;

-- !echo Drop temporary table: storeReturns_temp;
DROP TABLE storeReturns_temp;


-- !echo Create temporary table: webSales_temp;
DROP TABLE IF EXISTS webSales_temp;
CREATE EXTERNAL TABLE webSales_temp
  ( ws_sold_date_sk           bigint
  , ws_sold_time_sk           bigint
  , ws_ship_date_sk           bigint
  , ws_item_sk                bigint                --not null
  , ws_bill_customer_sk       bigint
  , ws_bill_cdemo_sk          bigint
  , ws_bill_hdemo_sk          bigint
  , ws_bill_addr_sk           bigint
  , ws_ship_customer_sk       bigint
  , ws_ship_cdemo_sk          bigint
  , ws_ship_hdemo_sk          bigint
  , ws_ship_addr_sk           bigint
  , ws_web_page_sk            bigint
  , ws_web_site_sk            bigint
  , ws_ship_mode_sk           bigint
  , ws_warehouse_sk           bigint
  , ws_promo_sk               bigint
  , ws_order_number           bigint                --not null
  , ws_quantity               int
  , ws_wholesale_cost         decimal(7,2)
  , ws_list_price             decimal(7,2)
  , ws_sales_price            decimal(7,2)
  , ws_ext_discount_amt       decimal(7,2)
  , ws_ext_sales_price        decimal(7,2)
  , ws_ext_wholesale_cost     decimal(7,2)
  , ws_ext_list_price         decimal(7,2)
  , ws_ext_tax                decimal(7,2)
  , ws_coupon_amt             decimal(7,2)
  , ws_ext_ship_cost          decimal(7,2)
  , ws_net_paid               decimal(7,2)
  , ws_net_paid_inc_tax       decimal(7,2)
  , ws_net_paid_inc_ship      decimal(7,2)
  , ws_net_paid_inc_ship_tax  decimal(7,2)
  , ws_net_profit             decimal(7,2)
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/webSales'
;

-- !echo Load text data into ORC table: webSales;
DROP TABLE IF EXISTS webSales;
CREATE TABLE webSales
STORED AS ORC
AS
SELECT * FROM webSales_temp
;

-- !echo Drop temporary table: webSales_temp;
DROP TABLE webSales_temp;


-- !echo Create temporary table: webReturns_temp;
DROP TABLE IF EXISTS webReturns_temp;
CREATE EXTERNAL TABLE webReturns_temp
  ( wr_returned_date_sk       bigint
  , wr_returned_time_sk       bigint
  , wr_item_sk                bigint                --not null
  , wr_refunded_customer_sk   bigint
  , wr_refunded_cdemo_sk      bigint
  , wr_refunded_hdemo_sk      bigint
  , wr_refunded_addr_sk       bigint
  , wr_returning_customer_sk  bigint
  , wr_returning_cdemo_sk     bigint
  , wr_returning_hdemo_sk     bigint
  , wr_returning_addr_sk      bigint
  , wr_web_page_sk            bigint
  , wr_reason_sk              bigint
  , wr_order_number           bigint                --not null
  , wr_return_quantity        int
  , wr_return_amt             decimal(7,2)
  , wr_return_tax             decimal(7,2)
  , wr_return_amt_inc_tax     decimal(7,2)
  , wr_fee                    decimal(7,2)
  , wr_return_ship_cost       decimal(7,2)
  , wr_refunded_cash          decimal(7,2)
  , wr_reversed_charge        decimal(7,2)
  , wr_account_credit         decimal(7,2)
  , wr_net_loss               decimal(7,2)
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/webReturns'
;

-- !echo Load text data into ORC table: webReturns;
DROP TABLE IF EXISTS webReturns;
CREATE TABLE webReturns
STORED AS ORC
AS
SELECT * FROM webReturns_temp
;

-- !echo Drop temporary table: webReturns_temp;
DROP TABLE webReturns_temp;


-- !echo Create temporary table: marketPrices_temp;
DROP TABLE IF EXISTS itemMarketPrices_temp;
CREATE EXTERNAL TABLE itemMarketPrices_temp
  ( imp_sk                  bigint                --not null
  , imp_item_sk             bigint                --not null
  , imp_competitor          string
  , imp_competitor_price    decimal(7,2)
  , imp_start_date          bigint
  , imp_end_date            bigint

  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/marketPrices'
;

-- !echo Load text data into ORC table: itemMarketPrices;
DROP TABLE IF EXISTS itemMarketPrices;
CREATE TABLE itemMarketPrices
STORED AS ORC
AS
SELECT * FROM itemMarketPrices_temp
;

-- !echo Drop temporary table: itemMarketPrices_temp;
DROP TABLE itemMarketPrices_temp;


-- !echo Create temporary table: clickstreams_temp;
DROP TABLE IF EXISTS webClickstreams_temp;
CREATE EXTERNAL TABLE webClickstreams_temp
(   wcs_click_date_sk       bigint
  , wcs_click_time_sk       bigint
  , wcs_sales_sk            bigint
  , wcs_item_sk             bigint
  , wcs_web_page_sk         bigint
  , wcs_user_sk             bigint
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/clickstreams'
;

-- !echo Load text data into ORC table: clickstreams;
DROP TABLE IF EXISTS webClickstreams;
CREATE TABLE webClickstreams
STORED AS ORC
AS
SELECT * FROM webClickstreams_temp
;

-- !echo Drop temporary table: clickstreams_temp;
DROP TABLE webClickstreams_temp;


-- !echo Create temporary table: reviews_temp;
DROP TABLE IF EXISTS productReviews_temp;
CREATE EXTERNAL TABLE productReviews_temp
(   pr_review_sk            bigint              --not null
  , pr_review_date          string
  , pr_review_time          string
  , pr_review_rating        int                 --not null
  , pr_item_sk              bigint              --not null
  , pr_user_sk              bigint
  , pr_order_sk             bigint
  , pr_review_content       string --not null
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
  STORED AS TEXTFILE LOCATION '/hawq-sandbox-demos/reviews'
;

-- !echo Load text data into ORC table: reviews;
DROP TABLE IF EXISTS productReviews;
CREATE TABLE productReviews
STORED AS ORC
AS
SELECT * FROM productReviews_temp
;

-- !echo Drop temporary table: reviews_temp;
DROP TABLE productReviews_temp;