#! /bin/bash
# DEPENDE DE SO E LOGGING

MAILLOG=/var/log/mail.log
#MAILLOG = /var/log/maillog

RESULTS=/root/scripts/junk

#buscamos ausentes usarios, eliminando to=> e todo depois da arroba @
cat $MAILLOG | grep recip | gawk '{print $24}' | awk -F'@' '{print $1}'| sed 's/to=<//g'  >> $RESULTS/logins_ausentes.txt

#buscamos quem tenta com cenhas errados com frequencia e contam os
#cat /var/log/maillog | grep UGFzc3dvcmQ6 | gawk '{print $7}' | awk '{freq[$1]++} END{for (i in freq) print i, "(" freq[i] ")"}' | sort -k2 >>/root/brutforsers.txt

#buscamos quem tenta com cenhas errados com frequencia
#cat $MAILLOG | grep UGFzc3dvcmQ6 | gawk '{print $7}' >> $RESULTS/brutforsers.txt


#cat /var/log/maillog | grep 'unknown user' | gawk '{print $7}' | sort | sed "s/'//g;s/\"//g" | awk -F',' '{print $1}'  | sed 's/.*(//' | awk -F'@' '{print $1}' | sed 's/.*)//' | \
# uniq | sort >> /root/logins_com_frequencia1.txt

# smotret tak: cat ./scripts/logins_chasto.txt | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head

cat $MAILLOG | grep user= | sed 's|.*=||' | awk -F'@' '{print $1}'  >> $RESULTS/logins_chasto.txt
cat $MAILLOG | grep 'given' | gawk '{print $12}' | sed 's/.$//'  >> $RESULTS/passwords_chasto.txt
#cat $MAILLOG | grep ' connect from' | awk '{ print $8; }' |  sed -r 's/^[^/[]+//' | tr -d \[ | tr -d \] >> $RESULTS/connect_chasto.txt
# pervi sed ubiraet [ a vtoroy ]
cat $MAILLOG |  grep ' connect from' |sed 's|.*\[||' | sed 's/\]//g'  >> $RESULTS/connect_chasto.txt
