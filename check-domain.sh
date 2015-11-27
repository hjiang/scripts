#!/bin/bash

# Adopted from http://linuxconfig.org/check-domain-name-availability-with-bash-and-whois
# Feel free to fork and improve.

if [ "$#" == "0" ]; then
    echo "You need tu supply at least one argument!"
    exit 1
fi

DOMAINS=( '.com' '.co.uk' '.net' '.info' '.mobi' \
'.org' '.tel' '.biz' '.tv' '.cc' '.eu' '.ru' \
'.in' '.it' '.sk' '.com.au' '.io' '.xyz' )

ELEMENTS=${#DOMAINS[@]}

while (( "$#" )); do

  for (( i=0;i<$ELEMENTS;i++)); do
      whois $1${DOMAINS[${i}]} | egrep -q \
      '^No match|^NOT FOUND|^Not fo|AVAILABLE|available for purchase|^No Data Fou|has not been regi|No entri|^DOMAIN NOT FOUND'
	  if [ $? -eq 0 ]; then
	      echo "$1${DOMAINS[${i}]} : available"
	  fi
  done

shift

done