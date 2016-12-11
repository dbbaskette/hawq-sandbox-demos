drop database IF EXISTS demos;
create database demos;

\c demos

drop schema hawq CASCADE;
create schema hawq;

DROP TABLE IF EXISTS hawq.customer;
CREATE TABLE hawq.customer
  ( c_customer_sk             bigint
  , c_customer_id             text
  , c_current_cbigbench_sk        bigint
  , c_current_hbigbench_sk        bigint
  , c_current_addr_sk         bigint
  , c_first_shipto_date_sk    bigint
  , c_first_sales_date_sk     bigint
  , c_salutation              text
  , c_first_name              text
  , c_last_name               text
  , c_preferred_cust_flag     text
  , c_birth_day               int
  , c_birth_month             int
  , c_birth_year              int
  , c_birth_country           text
  , c_login                   text
  , c_email_address           text
  , c_last_review_date        text
)
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;


DROP TABLE IF EXISTS hawq.customer_address;
CREATE TABLE hawq.customer_address
  ( ca_address_sk             bigint
  , ca_address_id             text
  , ca_street_number          text
  , ca_street_name            text
  , ca_street_type            text
  , ca_suite_number           text
  , ca_city                   text
  , ca_county                 text
  , ca_state                  text
  , ca_zip                    text
  , ca_country                text
  , ca_gmt_offset             decimal(5,2)
  , ca_location_type          text
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;



DROP TABLE IF EXISTS hawq.customer_demographics;
CREATE TABLE hawq.customer_demographics
  ( cd_bigbench_sk                bigint
  , cd_gender                 text
  , cd_marital_status         text
  , cd_education_status       text
  , cd_purchase_estimate      int
  , cd_credit_rating          text
  , cd_dep_count              int
  , cd_dep_employed_count     int
  , cd_dep_college_count      int

  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;

DROP TABLE IF EXISTS hawq.date_dim;
CREATE TABLE hawq.date_dim
  ( d_date_sk                 bigint
  , d_date_id                 text
  , d_date                    text
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
  , d_day_name                text
  , d_quarter_name            text
  , d_holiday                 text
  , d_weekend                 text
  , d_following_holiday       text
  , d_first_dom               int
  , d_last_dom                int
  , d_same_day_ly             int
  , d_same_day_lq             int
  , d_current_day             text
  , d_current_week            text
  , d_current_month           text
  , d_current_quarter         text
  , d_current_year            text
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;

DROP TABLE IF EXISTS hawq.household_demographics;
CREATE  TABLE hawq.household_demographics
  ( hd_bigbench_sk                bigint
  , hd_income_band_sk         bigint
  , hd_buy_potential          text
  , hd_dep_count              int
  , hd_vehicle_count          int
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;



DROP TABLE IF EXISTS hawq.income_band;
CREATE  TABLE hawq.income_band
  ( ib_income_band_sk         bigint
  , ib_lower_bound            int
  , ib_upper_bound            int
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;



DROP TABLE IF EXISTS hawq.item;
CREATE TABLE hawq.item
  ( i_item_sk                 bigint
  , i_item_id                 text
  , i_rec_start_date          text
  , i_rec_end_date            text
  , i_item_desc               text
  , i_current_price           decimal(7,2)
  , i_wholesale_cost          decimal(7,2)
  , i_brand_id                int
  , i_brand                   text
  , i_class_id                int
  , i_class                   text
  , i_category_id             int
  , i_category                text
  , i_manufact_id             int
  , i_manufact                text
  , i_size                    text
  , i_formulation             text
  , i_color                   text
  , i_units                   text
  , i_container               text
  , i_manager_id              int
  , i_product_name            text
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;

DROP TABLE IF EXISTS hawq.promotion;
CREATE  TABLE hawq.promotion
  ( p_promo_sk                bigint
  , p_promo_id                text
  , p_start_date_sk           bigint
  , p_end_date_sk             bigint
  , p_item_sk                 bigint
  , p_cost                    decimal(15,2)
  , p_response_target         int
  , p_promo_name              text
  , p_channel_dmail           text
  , p_channel_email           text
  , p_channel_catalog         text
  , p_channel_tv              text
  , p_channel_radio           text
  , p_channel_press           text
  , p_channel_event           text
  , p_channel_bigbench            text
  , p_channel_details         text
  , p_purpose                 text
  , p_discount_active         text
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;

DROP TABLE IF EXISTS hawq.reason;
CREATE TABLE hawq.reason
  ( r_reason_sk               bigint
  , r_reason_id               text
  , r_reason_desc             text
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;


DROP TABLE IF EXISTS hawq.ship_mode;
CREATE  TABLE hawq.ship_mode
  ( sm_ship_mode_sk           bigint
  , sm_ship_mode_id           text
  , sm_type                   text
  , sm_code                   text
  , sm_carrier                text
  , sm_contract               text
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;

DROP TABLE IF EXISTS hawq.store;
CREATE  TABLE hawq.store
  ( s_store_sk                bigint
  , s_store_id                text
  , s_rec_start_date          text
  , s_rec_end_date            text
  , s_closed_date_sk          bigint
  , s_store_name              text
  , s_number_employees        int
  , s_floor_space             int
  , s_hours                   text
  , s_manager                 text
  , s_market_id               int
  , s_geography_class         text
  , s_market_desc             text
  , s_market_manager          text
  , s_division_id             int
  , s_division_name           text
  , s_company_id              int
  , s_company_name            text
  , s_street_number           text
  , s_street_name             text
  , s_street_type             text
  , s_suite_number            text
  , s_city                    text
  , s_county                  text
  , s_state                   text
  , s_zip                     text
  , s_country                 text
  , s_gmt_offset              decimal(5,2)
  , s_tax_precentage          decimal(5,2)
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;


DROP TABLE IF EXISTS hawq.time_dim;
CREATE  TABLE hawq.time_dim
  ( t_time_sk                 bigint
  , t_time_id                 text
  , t_time                    int
  , t_hour                    int
  , t_minute                  int
  , t_second                  int
  , t_am_pm                   text
  , t_shift                   text
  , t_sub_shift               text
  , t_meal_time               text
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;


DROP TABLE IF EXISTS hawq.warehouse;
CREATE  TABLE hawq.warehouse
  ( w_warehouse_sk            bigint
  , w_warehouse_id            text
  , w_warehouse_name          text
  , w_warehouse_sq_ft         int
  , w_street_number           text
  , w_street_name             text
  , w_street_type             text
  , w_suite_number            text
  , w_city                    text
  , w_county                  text
  , w_state                   text
  , w_zip                     text
  , w_country                 text
  , w_gmt_offset              decimal(5,2)
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;


DROP TABLE IF EXISTS hawq.web_site;
CREATE  TABLE hawq.web_site
  ( web_site_sk               bigint
  , web_site_id               text
  , web_rec_start_date        text
  , web_rec_end_date          text
  , web_name                  text
  , web_open_date_sk          bigint
  , web_close_date_sk         bigint
  , web_class                 text
  , web_manager               text
  , web_mkt_id                int
  , web_mkt_class             text
  , web_mkt_desc              text
  , web_market_manager        text
  , web_company_id            int
  , web_company_name          text
  , web_street_number         text
  , web_street_name           text
  , web_street_type           text
  , web_suite_number          text
  , web_city                  text
  , web_county                text
  , web_state                 text
  , web_zip                   text
  , web_country               text
  , web_gmt_offset            decimal(5,2)
  , web_tax_percentage        decimal(5,2)
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;

DROP TABLE IF EXISTS hawq.web_page;
CREATE  TABLE hawq.web_page
  ( wp_web_page_sk            bigint
  , wp_web_page_id            text
  , wp_rec_start_date         text
  , wp_rec_end_date           text
  , wp_creation_date_sk       bigint
  , wp_access_date_sk         bigint
  , wp_autogen_flag           text
  , wp_customer_sk            bigint
  , wp_url                    text
  , wp_type                   text
  , wp_char_count             int
  , wp_link_count             int
  , wp_image_count            int
  , wp_max_ad_count           int
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;



DROP TABLE IF EXISTS hawq.inventory;
CREATE  TABLE hawq.inventory
  ( inv_date_sk               bigint                NOT NULL
  , inv_item_sk               bigint                NOT NULL
  , inv_warehouse_sk          bigint                NOT NULL
  , inv_quantity_on_hand      int
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY
partition by range(inv_date_sk)
(start(2450815) INCLUSIVE end(2453005) INCLUSIVE every (100),
default partition others)
;



DROP TABLE IF EXISTS hawq.store_sales;
CREATE  TABLE hawq.store_sales
  ( ss_sold_date_sk           bigint
  , ss_sold_time_sk           bigint
  , ss_item_sk                bigint                NOT NULL
  , ss_customer_sk            bigint
  , ss_cbigbench_sk               bigint
  , ss_hbigbench_sk               bigint
  , ss_addr_sk                bigint
  , ss_store_sk               bigint
  , ss_promo_sk               bigint
  , ss_ticket_number          bigint                NOT NULL
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
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY
PARTITION BY RANGE (ss_sold_date_sk)
(start(2450815) INCLUSIVE end(2453005) INCLUSIVE every (20),
default partition others)
;


DROP TABLE IF EXISTS hawq.store_returns;
CREATE  TABLE hawq.store_returns
  ( sr_returned_date_sk       bigint
  , sr_return_time_sk         bigint
  , sr_item_sk                bigint                NOT NULL
  , sr_customer_sk            bigint
  , sr_cbigbench_sk               bigint
  , sr_hbigbench_sk               bigint
  , sr_addr_sk                bigint
  , sr_store_sk               bigint
  , sr_reason_sk              bigint
  , sr_ticket_number          bigint                NOT NULL
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
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY
partition by range(sr_returned_date_sk)
(start(2450815) INCLUSIVE end(2453005) INCLUSIVE every (100),
default partition others)
;


DROP TABLE IF EXISTS hawq.web_sales;
CREATE  TABLE hawq.web_sales
  ( ws_sold_date_sk           bigint
  , ws_sold_time_sk           bigint
  , ws_ship_date_sk           bigint
  , ws_item_sk                bigint                NOT NULL
  , ws_bill_customer_sk       bigint
  , ws_bill_cbigbench_sk          bigint
  , ws_bill_hbigbench_sk          bigint
  , ws_bill_addr_sk           bigint
  , ws_ship_customer_sk       bigint
  , ws_ship_cbigbench_sk          bigint
  , ws_ship_hbigbench_sk          bigint
  , ws_ship_addr_sk           bigint
  , ws_web_page_sk            bigint
  , ws_web_site_sk            bigint
  , ws_ship_mode_sk           bigint
  , ws_warehouse_sk           bigint
  , ws_promo_sk               bigint
  , ws_order_number           bigint                NOT NULL
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
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY
partition by range(ws_sold_date_sk)
(start(2450815) INCLUSIVE end(2453005) INCLUSIVE every (40),
default partition others)
;

DROP TABLE IF EXISTS hawq.web_returns;
CREATE  TABLE hawq.web_returns
  ( wr_returned_date_sk       bigint
  , wr_returned_time_sk       bigint
  , wr_item_sk                bigint                NOT NULL
  , wr_refunded_customer_sk   bigint
  , wr_refunded_cbigbench_sk      bigint
  , wr_refunded_hbigbench_sk      bigint
  , wr_refunded_addr_sk       bigint
  , wr_returning_customer_sk  bigint
  , wr_returning_cbigbench_sk     bigint
  , wr_returning_hbigbench_sk     bigint
  , wr_returning_addr_sk      bigint
  , wr_web_page_sk            bigint
  , wr_reason_sk              bigint
  , wr_order_number           bigint                NOT NULL
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
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY
 partition by range(wr_returned_date_sk)
(start(2450815) INCLUSIVE end(2453005) INCLUSIVE every (400),
default partition others)
;

DROP TABLE IF EXISTS hawq.item_marketprices;
CREATE TABLE hawq.item_marketprices
  ( imp_sk                  bigint                NOT NULL
  , imp_item_sk             bigint                NOT NULL
  , imp_competitor          text
  , imp_competitor_price    decimal(7,2)
  , imp_start_date          bigint
  , imp_end_date            bigint

  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;


DROP TABLE IF EXISTS hawq.web_clickstreams;
CREATE  TABLE hawq.web_clickstreams
(   wcs_click_date_sk       bigint
  , wcs_click_time_sk       bigint
  , wcs_sales_sk            bigint
  , wcs_item_sk             bigint
  , wcs_web_page_sk         bigint
  , wcs_user_sk             bigint
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;



DROP TABLE IF EXISTS hawq.product_reviews;
CREATE TABLE hawq.product_reviews
(   pr_review_sk            bigint              NOT NULL
  , pr_review_date          text
  , pr_review_time          text
  , pr_review_rating        int                 NOT NULL
  , pr_item_sk              bigint              NOT NULL
  , pr_user_sk              bigint
  , pr_order_sk             bigint
  , pr_review_content       text NOT NULL
  )
with (appendonly=true, orientation=parquet,compresstype=snappy)
DISTRIBUTED RANDOMLY;
