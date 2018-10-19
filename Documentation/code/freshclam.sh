#!/bin/bash
 
CLAMAV=0
 
#mkdir -p $HOME/.clamav
#echo > $HOME/.clamav/freshclam.log
#echo > $HOME/.clamav/clamd.log
 
sleep 60
freshclam
 
while [ $CLAMAV -le 2 ] ; do
  sleep 3600
  freshclam
done
