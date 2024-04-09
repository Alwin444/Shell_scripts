#! /bin/bash
record="A AAAA CNAME MX TXT"
function looper
{
 while read var; do
  echo -e "Started the enumeration of $var\n======================================"
  for i in $record; do
   echo "Enumeration of $i record of $var:"
   dig "$var" "$i" +short
  done
  echo "Compeleted enumeration of $var"
 done < "$1"
}
looper $1
