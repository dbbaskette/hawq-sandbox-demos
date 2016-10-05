#!/usr/bin/env bash
cd data
sudo -u hdfs hadoop fs -mkdir /demo
for file in *.gz
do
 tar xvfz $file
 dirName = ${file/.tar.gz/}
 sudo -u hdfs hadoop fs -put dirName /demo
done
sudo -u hdfs hive -f hive.sql
cp -R 2BW7K83GQ /usr/hdp/current/zeppelin-server/lib/notebook
/usr/hdp/current/zeppelin-server/lib/zeppelin-daemon.sh restart

