#!/usr/bin/env bash

sudo -u hdfs hadoop fs -mkdir -p /hawq-sandbox-demos
currentDir=$(pwd)
cd data
for file in *.gz
do
 tar xvfz $file
 dirName=${file/.tar.gz/}
 sudo -u hdfs sh -c "cd $currentDir/data;hadoop fs -put $dirName /hawq-sandbox-demos"
done
sudo -u hdfs hive -f $currentDir/hive.sql
sudo -u gpadmin psql -f $currentDir/hawq.sql

#XEPP CHANGES IN VM, BUT STILL REQORK THSI IMPORT
#cp -R ../2BXJD5WF4 /usr/hdp/current/zeppelin-server/notebook
#chown -R zeppelin: /usr/hdp/current/zeppelin-server/notebook/2BXJD5WF4
#sudo -u zeppelin sh -c "/usr/hdp/current/zeppelin-server/bin/zeppelin-daemon.sh restart"

#sudo -u hdfs sh -c "cd $currentDir;hbase shell ./hbase.cmds"


hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.separator='|'  -Dimporttsv.columns="HBASE_ROW_KEY,cf1:cd_gender,cf1:cd_marital_status,cf1:cd_education_status,cf1:cd_purchase_estimate,cf1:cd_credit_rating,cf1:cd_dep_count,cf1:cd_dep_employed_count,cf1:cd_dep_college_count" customer_demographics /demo/customer_demographics
hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.separator='|'  -Dimporttsv.columns="HBASE_ROW_KEY,cf1:c_customer_id,cf1:c_current_cbigbench_sk,cf1:c_current_hbigbench_sk,cf1:c_current_addr_sk,cf1:c_first_shipto_date_sk,cf1:c_first_sales_date_sk,cf1:c_salutation,cf1:c_first_name,cf1:c_last_name,cf1:c_preferred_cust_flag,cf1:c_birth_day,cf1:c_birth_month,cf1:c_birth_year,cf1:c_birth_country,cf1:c_login,cf1:c_email_address,cf1:c_last_review_date" customer /demo/customer
hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.separator='|'  -Dimporttsv.columns="HBASE_ROW_KEY,cf1:customer_id,cf1:valid_from_timestamp,cf1:valid_to_timestamp,cf1:house_number,cf1:street_name,cf1:appt_suite_no,cf1:city,cf1:state_code,cf1:zip_code,cf1:zip_plus_four,cf1:country,cf1:phone_number" customer_address /demo/customer_address

~
~
