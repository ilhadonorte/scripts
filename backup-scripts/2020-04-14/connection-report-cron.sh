#! /bin/bash

path1=/root/connection-report.txt
path2=/root/connect-disconnect-chasto.txt
path3=/root/brutforsers.txt
path4=/root/ssh_brutforcers.txt

date --rfc-3339='ns' > $path1
echo "===============" >> $path1
echo "CONNECT CHASTO" >> $path1
cat $path2 | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$path1
echo "===============" >> $path1
echo "POSTFIX-brutforces" >> $path1
cat $path3 | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$path1
echo "===============" >> $path1
echo "SSH-brutforces" >> $path1
cat $path4 | awk '{freq[$1]++} END{for (i in freq) print freq[i], i}' | sort -nr | head >>$path1
echo "===============" >> $path1
pflogsumm -d today /var/log/maillog >> $path1
fail2ban-client status sshd  >> $path1
fail2ban-client status postfix-sasl >> $path1  
fail2ban-client status postfix >> $path1
fail2ban-client status recidive >> $path1

cat $path1 | mailx -s "`date --rfc-3339='date'` connections semanal report" -r postmaster@sumare.ru asat@sumare.ru
cat $path1 | mailx -s "`date --rfc-3339='date'` connections semanal report" -r postmaster@sumare.ru M79586305729@yahoo.com


rm -r $path1
rm -r $path2
rm -r $path3
rm -r $path4

