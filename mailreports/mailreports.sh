#! /bin/bash
# лог в центосе
#logpath=/var/log/maillog
# лог в убунте
logpath=/var/log/mail.log
# сюда складываем результат - переделать на полный
resultspath=/root/scripts/junk
#/usr/sbin/pflogsumm -d yesterday /var/log/maillog | mailx -s 'sumare.ru emails daily report' -r postmaster@sumare.ru asat@sumare.ru
echo =========================RSPAMD STATISTICS=================================== >> $resultspath/report.txt
rspamc stat >> $resultspath/report.txt
echo =========================LOGINS=================================== >> $resultspath/report.txt
cat $resultspath/logins_chasto.txt | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$resultspath/report.txt
echo =========================CONNECTIONS=================================== >> $resultspath/report.txt
cat $resultspath/connect_chasto.txt | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$resultspath/report.txt
echo =========================PASSWORDS=================================== >> $resultspath/report.txt
cat $resultspath/passwords_chasto.txt | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$resultspath/report.txt

cat $resultspath/report.txt | mailx -s "`date --rfc-3339='seconds'` connects daily report" -r zakaz@359831-ca13528.tmweb.ru zakaz@359831-ca13528.tmweb.ru
/usr/sbin/pflogsumm -d today $logpath | mailx -s "`date --rfc-3339='seconds'` emails daily report" -r zakaz@359831-ca13528.tmweb.ru zakaz@359831-ca13528.tmweb.ru
rm $resultspath/report.txt




