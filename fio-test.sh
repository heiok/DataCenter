#!/bin/bash
echo " ,bw,iops" >>result_read.csv
echo "read start testing"
for i in {4k,8k,16k,32k,64k,128k,256k,512k,1024k}
do 

fio -direct=1 -iodepth=1 -thread -rw=read -ioengine=libaio -bs=$i -numjobs=8 -runtime=600 -group_reporting -name=mytest -filename=/dev/sdb >bb.txt

BW=`cat bb.txt |grep iops=|cut -d ',' -f 2|grep -oE "[0-9.]+"`
BWU=`cat bb.txt |grep iops=|cut -d ',' -f 2|cut -d '=' -f 2|sed s'/[0-9.]//'g`
IOPS=`cat bb.txt |grep iops=|cut -d ',' -f 3|cut -d '=' -f 2`
echo "$i _read,$BW,$BWU,$IOPS" >>result_read.csv
rm -rf bb.txt
sleep 10s
done

echo " ,bw,iops" >>result_write.csv
echo "write start testing"
for i in {4k,8k,16k,32k,64k,128k,256k,512k,1024k}
do 

fio -direct=1 -iodepth=1 -thread -rw=write -ioengine=libaio -bs=$i -numjobs=8 -runtime=600 -group_reporting -name=mytest -filename=/dev/sdb >bb.txt

BW=`cat bb.txt |grep iops=|cut -d ',' -f 2|grep -oE "[0-9.]+"`
BWU=`cat bb.txt |grep iops=|cut -d ',' -f 2|cut -d '=' -f 2|sed s'/[0-9.]//'g`
IOPS=`cat bb.txt |grep iops=|cut -d ',' -f 3|cut -d '=' -f 2`
echo "$i _read,$BW,$BWU,$IOPS" >>result_write.csv
rm -rf bb.txt
sleep 10s
done

echo " ,bw,iops" >>result_randwrite.csv
echo "randwrite start testing"
for i in {4k,8k,16k,32k,64k,128k,256k,512k,1024k}
do 

fio -direct=1 -iodepth=1 -thread -rw=randwrite -ioengine=libaio -bs=$i -numjobs=8 -runtime=600 -group_reporting -name=mytest -filename=/dev/sdb >bb.txt

BW=`cat bb.txt |grep iops=|cut -d ',' -f 2|grep -oE "[0-9.]+"`
BWU=`cat bb.txt |grep iops=|cut -d ',' -f 2|cut -d '=' -f 2|sed s'/[0-9.]//'g`
IOPS=`cat bb.txt |grep iops=|cut -d ',' -f 3|cut -d '=' -f 2`
echo "$i _read,$BW,$BWU,$IOPS" >>result_randwrite.csv
rm -rf bb.txt
sleep 10s
done

echo " ,bw,iops" >>result_randread.csv
echo "randread start testing"
for i in {4k,8k,16k,32k,64k,128k,256k,512k,1024k}
do 

fio -direct=1 -iodepth=1 -thread -rw=randread -ioengine=libaio -bs=$i -numjobs=8 -runtime=600 -group_reporting -name=mytest -filename=/dev/sdb >bb.txt

BW=`cat bb.txt |grep iops=|cut -d ',' -f 2|grep -oE "[0-9.]+"`
BWU=`cat bb.txt |grep iops=|cut -d ',' -f 2|cut -d '=' -f 2|sed s'/[0-9.]//'g`
IOPS=`cat bb.txt |grep iops=|cut -d ',' -f 3|cut -d '=' -f 2`
echo "$i _read,$BW,$BWU,$IOPS" >>result_randread.csv
rm -rf bb.txt
sleep 10s
done


echo " ,bw,iops" >>result_randrw70.csv
echo "randrw start testing"
for i in {4k,8k,16k,32k,64k,128k,256k,512k,1024k}
do 

fio -direct=1 -iodepth=1 -thread -rw=randrw -rwmixread=70 -ioengine=libaio -bs=$i -numjobs=8 -runtime=600 -group_reporting -name=mytest -filename=/dev/sdb >bb.txt

BW=`cat bb.txt |grep iops=|cut -d ',' -f 2|grep -oE "[0-9.]+"`
BWU=`cat bb.txt |grep iops=|cut -d ',' -f 2|cut -d '=' -f 2|sed s'/[0-9.]//'g`
IOPS=`cat bb.txt |grep iops=|cut -d ',' -f 3|cut -d '=' -f 2`
echo "$i _read,$BW,$BWU,$IOPS" >>result_randrw70.csv
rm -rf bb.txt
sleep 10s
done

echo " ,bw,iops" >>result_randrw50.csv
echo "randrw start testing"
for i in {4k,8k,16k,32k,64k,128k,256k,512k,1024k}
do 

fio -direct=1 -iodepth=1 -thread -rw=randrw -rwmixread=50 -ioengine=libaio -bs=$i -numjobs=8 -runtime=600 -group_reporting -name=mytest -filename=/dev/sdb >bb.txt

BW=`cat bb.txt |grep iops=|cut -d ',' -f 2|grep -oE "[0-9.]+"`
BWU=`cat bb.txt |grep iops=|cut -d ',' -f 2|cut -d '=' -f 2|sed s'/[0-9.]//'g`
IOPS=`cat bb.txt |grep iops=|cut -d ',' -f 3|cut -d '=' -f 2`
echo "$i _read,$BW,$BWU,$IOPS" >>result_randrw50.csv
rm -rf bb.txt
sleep 10s
done
