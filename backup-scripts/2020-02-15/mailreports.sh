#! /bin/bash
#d1=date
/usr/sbin/pflogsumm -d yesterday /var/log/maillog | mailx -s 'sumare.ru emails daily report' -r postmaster@sumare.ru asat@sumare.ru

