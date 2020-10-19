#! /bin/bash
#logpath=/var/log/maillog
logpath=/var/log/mail.log
resultspath=/root/scripts/junk
#/usr/sbin/pflogsumm -d yesterday /var/log/maillog | mailx -s 'sumare.ru emails daily report' -r postmaster@sumare.ru asat@sumare.ru
echo =========================LOGINS=================================== >> $resultspath/report.txt
cat $resultspath/logins_chasto.txt | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$resultspath/report.txt
echo =========================CONNECTIONS=================================== >> $resultspath/report.txt
cat $resultspath/connect_chasto.txt | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$resultspath/report.txt
echo =========================PASSWORDS=================================== >> $resultspath/report.txt
cat $resultspath/passwords_chasto.txt | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$resultspath/report.txt

cat $resultspath/report.txt | mailx -s 'connects daily report' -r zakaz@359831-ca13528.tmweb.ru zakaz@359831-ca13528.tmweb.ru
/usr/sbin/pflogsumm -d today $logpath | mailx -s 'emails daily report' -r zakaz@359831-ca13528.tmweb.ru zakaz@359831-ca13528.tmweb.ru
rm $resultspath/report.txt




