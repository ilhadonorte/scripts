#! /bin/bash
# DEPENDE DE SO E LOGGING

MAILLOG=/var/log/mail.log
#MAILLOG = /var/log/maillog

RESULTS=/root/scripts/junk

T0=`date +%s`
T1=`date -d '2 min ago' +%s`
echo Начальное время $T1
echo Конечное время  $T0
arrayofdatas=( $(cat /var/log/mail.log | awk '{print $1" "$2" "$3}' | xargs -I ARGS date -d ARGS +%s) )
my_array_length=${#arrayofdatas[@]}
echo Длина массива $my_array_length

#echo "${arrayofdatas[@]}"

length=${#arrayofdatas[@]}

# Array Loop
for (( i=0; i<$length; i++ ))
do
  #echo $i
  echo -e  "${arrayofdatas[$i]},  $i  \n"
  TX=`date --date=@${arrayofdatas[$i]}`
  echo -e "$TX \n"
done


i=0

while [ $i -le $length ]
do
 if [[ ${arrayofdatas[$i]} -gt $T1 ]]
 then
  echo "The ${arrayofdatas[$i]} variable is greater than $T1."
 fi
  #echo Number: $i
  ((i++))
done

#for i in "${arrayofdates[@]}"
#do
#echo "$i"
#echo $TX
#echo "{arrayofdates[$i]"
#done
