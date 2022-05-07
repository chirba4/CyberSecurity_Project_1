#!/bin/sh
#command to pull  time and roulette dealer name 
#from march 10th 
awk -F" " '{print $1, $2, $5, $6}' *_Dealer_schedule | grep "05:00:00 AM" >> Dealers_working_during_losses
awk -F" " '{print $1, $2, $5, $6}' *_Dealer_schedule | grep "08:00:00 AM" >> Dealers_working_during_losses
awk -F" " '{print $1, $2, $5, $6}' *_Dealer_schedule | grep "02:00:00 PM" >> Dealers_working_during_losses
awk -F" " '{print $1, $2, $5, $6}' *_Dealer_schedule | grep "08:00:00 PM" >> Dealers_working_during_losses
awk -F" " '{print $1, $2, $5, $6}' *_Dealer_schedule | grep "11:00:00 PM" >> Dealers_working_during_losses
