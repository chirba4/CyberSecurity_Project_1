#!/bin/bash
#This script outputs a system summary on screen
echo "This is a quick system audit script"
date
echo "Machine Info:"
echo $MACHTYPE
echo   "Uname info: $(uname -a) \n" 
echo   "IP Info: $(ip addr | head -9 | tail -1) \n"
echo "Hostname is: $(hostname -s)"
echo "DNS servers:"
cat /etc/resolv.conf
