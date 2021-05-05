#! /bin/bash
File=/var/log/mail.log
{
read line1
read line2
read line3
} < $File
echo "Pervaya strika loga v :"
echo "$line1"
echo "Pervaya strika loga v :"
echo "$line2"
echo "Pervaya strika loga v :"
echo "$line3"
exit 0
