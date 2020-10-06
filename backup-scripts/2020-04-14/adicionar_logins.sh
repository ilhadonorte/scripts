#! /bin/bash
#buscamos brutforcers ao ssh:
cat /var/log/secure | grep 'Failed password for root from' |  gawk '{print $11}' >> /root/ssh_brutforcers.txt

#buscamos ausentes usarios, eliminando to=> e todo depois da arroba @
cat /var/log/maillog | grep recip | gawk '{print $24}' | awk -F'@' '{print $1}'| sed 's/to=<//g' >> /root/logins_com_frequencia1.txt

#buscamos quem tenta com cenhas errados com frequencia e contam os
#cat /var/log/maillog | grep UGFzc3dvcmQ6 | gawk '{print $7}' | awk '{freq[$1]++} END{for (i in freq) print i, "(" freq[i] ")"}' | sort -k2 >>/root/brutforsers.txt

#buscamos quem tenta com cenhas errados com frequencia
cat /var/log/maillog | grep UGFzc3dvcmQ6 | gawk '{print $7}'|  sed -r 's/^[^/[]+//' | tr -d \[ | tr -d \] | tr -d : >>/root/brutforsers.txt

#buscamos quem connecta com frequencia a-toa
cat /var/log/maillog | grep ' connect from' | awk '{ print $8; }' |  sed -r 's/^[^/[]+//' | tr -d \[ | tr -d \] | sort >>/root/connect-disconnect-chasto.txt


#cat /var/log/maillog | grep failure | grep -v great | grep -v asat | gawk '{print $7}| gawk '{print $22}'' >> /root/logins_com_frequencia.txt

#cat /var/log/maillog | grep 'unknown user' | gawk '{print $7}' | sort | sed "s/'//g;s/\"//g" | awk -F',' '{print $1}'  | sed 's/.*(//' | awk -F'@' '{print $1}' | sed 's/.*)//' | \
# uniq | sort >> /root/logins_com_frequencia1.txt

#cat /var/log/maillog | grep 'given' | gawk '{print $12}' | sed 's/.$//' | sort | uniq  >> /root/cenhas_furados.txt

