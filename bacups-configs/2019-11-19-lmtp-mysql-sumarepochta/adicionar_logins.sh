#! /bin/bash
#cat /var/log/maillog | grep recip | gawk '{print $24}'  >> /root/adicionar_logins.txt
#cat /var/log/maillog | grep failure | grep -v great | grep -v asat | gawk '{print $7}| gawk '{print $22}'' >> /root/logins_com_frequencia.txt

cat /var/log/maillog | grep 'unknown user' | gawk '{print $7}' | sort | sed "s/'//g;s/\"//g" | awk -F',' '{print $1}'  | sed 's/.*(//' | awk -F'@' '{print $1}' | sed 's/.*)//' | \
 uniq | sort >> /root/logins_com_frequencia1.txt

cat /var/log/maillog | grep 'given' | gawk '{print $12}' | sed 's/.$//' | sort | uniq  >> /root/cenhas_furados.txt

