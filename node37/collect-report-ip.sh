#! /bin/bash
# сюда складываем результат - переделать на полный
resultspath=/root/scripts/junk/collected-ip.txt
curl ifconfig.co >> $resultspath
# второй почтовый адрес указывает КУДА, первый-откуда
cat $resultspath | mailx -s "`date --rfc-3339='seconds'` collected ips report" -r m79586305729@yahoo.com m79586305729@yahoo.com
cat $resultspath | mailx -s "`date --rfc-3339='seconds'` collected ips report" -r contact@359831-ca13528.tmweb.ru contact@359831-ca13528.tmweb.ru
#rm $resultspath/report.txt




