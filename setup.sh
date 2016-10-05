#!/usr/bin/env bash

sudo -u hdfs hadoop fs -mkdir /demo
currentDir=$(pwd)
cd data
for file in *.gz
do
 tar xvfz $file
 dirName=${file/.tar.gz/}
 sudo -u hdfs sh -c "cd $currentDir/data;hadoop fs -put $dirName /demo"
done
sudo -u hdfs hive -f $currentDir/hive.sql
sudo -u zeppelin sh -c "cp -R ../2BW7K83GQ /usr/hdp/current/zeppelin-server/lib/notebook"
/usr/hdp/current/zeppelin-server/lib/bin/zeppelin-daemon.sh restart