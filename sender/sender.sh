#!/bin/bash
# script for fill test mailboxes, starting example: 
# ./sender 4
# version 2020-09-18
# input checking
 
#if [ -n $1 ];
# then 
#  EMAIL_COUNTER = 2
# else 
#  emailscounter = $1
#fi

#emailbody = $((1+RANDOM % 3))
#emailattache = $((1+RANDOM % 4))

for (( number = 1; number <= $1; number++ ));
 do
  for recipient in $(cat ./recipients.txt);
   do
    echo "Hello $recipient"
    #mailx -s "`date --rfc-3339='seconds'` test e-mail" -a "./files/attache3.zip" $recipient < ./files/message3.txt
    mailx -v -s "`date --rfc-3339='seconds'` Небольшое  письмо без вложения" zakaz@359831-ca13528.tmweb.ru < message.txt
    mailx -v -s "`date --rfc-3339='seconds'`  Письмо побольше с вложением" -a attache1.docx zakaz@359831-ca13528.tmweb.ru < message1.txt
    mailx -v -s "`date --rfc-3339='seconds'`  Письмо с вложением" -a attache2.jpg zakaz@359831-ca13528.tmweb.ru < message2.txt
    mailx -v -s "`date --rfc-3339='seconds'` Письмо большое с большим вложением" -a attache3.pdf zakaz@359831-ca13528.tmweb.ru < message3.txt
   done;
 done;




