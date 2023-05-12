#!/bin/bash

# exit if domain name arg missing
if [ $# -eq 0 ]
  then
    echo "No domain name provided"
    exit 1
fi

result=$(whois $1)

# lookup domain name regestration
if echo "$result" | grep -q "No match for domain"; then
  echo "$1 is available"
else
  echo "$1 is registered"
  echo
  echo $result
fi
