#!/bin/bash

#
# by Christian Sarazin 
# @offlinehoster
# 2013

# $1 mailserver
# $2 port
# $3 recipient
# $4 sender
# $5 message

#
# usage ./telnetmail_script.sh mail.domain.tld 25 recipient sendermail message
#

(echo "helo $1"
sleep 2
echo "mail from: $4"
sleep 2
echo "rcpt to: $3"
sleep 2
echo "data"
sleep 2
echo "From: Sender <$4>"
sleep 2
echo "To: Recipient <$3>"
sleep 2
echo "Subject: Testmail from $4"
sleep 2
echo "Hello, this is just a testmail. For questions ask $4"
sleep 1
echo "."
sleep 1
echo "quit"
sleep 1
) | telnet $1 $2
