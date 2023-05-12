#!/bin/bash

# check whois is installed - offer to install if not
if ! command -v whois &> /dev/null
then
    read -p "The 'whois' command not installed. Do you want to install it? (y/n) " answer
    if [ "$answer" = "y" ]
    then
        sudo apt-get update
        sudo apt-get install -y whois
    else
        echo "Can't proceed without 'whois'. Exiting."
        exit 1
    fi
fi

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
