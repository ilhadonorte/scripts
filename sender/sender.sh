#!/bin/bash
# script for fill test mailboxes, starting example: 
# ./sender 4
# version 2020-09-18
# input checking
# version 2020-11-19, поправил итерации, намбер
# отправлять указывая цифрой количество итераций:  ./sender.sh 3
 

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
    echo "Hello $recipient, iteration" $number
    #mailx -s "`date --rfc-3339='seconds'` test e-mail" -a "./attache2.jpg" $recipient < ./message3.txt
    mailx -v -s "`date --rfc-3339='seconds'` Небольшое  письмо без вложения" $recipient < message.txt
    mailx -v -s "`date --rfc-3339='seconds'` Письмо побольше с вложением" -a attache1.docx $recipient < message1.txt
    mailx -v -s "`date --rfc-3339='seconds'` Письмо с вложением" -a attache2.jpg $recipient < message2.txt
    mailx -v -s "`date --rfc-3339='seconds'` Письмо большое с большим вложением" -a attache3.pdf $recipient < message3.txt
   done;
 done;




