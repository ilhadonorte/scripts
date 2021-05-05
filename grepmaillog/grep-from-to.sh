#!/bin/bash
# 2021-05-04 состаляем табличку кто кому присылал 
cat /var/log/mail.log | grep from= |awk '{print $6" "$7}' >from.txt
cat /var/log/mail.log | grep to= | awk '{print $6" "$7}' >to.txt
join from.txt to.txt
rm from.txt to.txt

