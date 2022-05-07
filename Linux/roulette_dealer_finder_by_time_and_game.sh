#!/bin/bash
# we will use arguments for the game_dealer column  
#to print out the game_dealer we need
# we will have a total of 5 arguments  to accomodate time and dealer name  
awk -F" " '{print $1, $2, $2, $3}' $1_Dealer_schedule | grep "$4:00:00 $5M"

