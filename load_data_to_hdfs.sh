cd data
hadoop fs -mkdir /demo
for file in *.gz
do
 tar xvfz $file
 dirName = ${file/.tar.gz/}
 hadoop fs -put dirName /demo
done


