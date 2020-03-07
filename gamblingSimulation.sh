#!/bin/bash
echo "**********Welcome to Gambling Simulator Problem**********"

#CONSTANTS
STAKE_PER_DAY=100
BET_PER_GAME=1

#VARIABLES
cash=$STAKE_PER_DAY

function calculatePercentage(){
   MAXIMUM_RESULT=$(($STAKE_PER_DAY+(50*$STAKE_PER_DAY/100)))  
   MINIMUM_RESULT=$(($STAKE_PER_DAY-(50*$STAKE_PER_DAY/100)))
}
calculatePercentage

function calculateGambler(){
while [[ $cash -gt $MINIMUM_RESULT && $cash -lt $MAXIMUM_RESULT ]]
do
RandomCheck=$(($RANDOM%2))
	if [[ 1 -eq $RandomCheck ]]
	then
		cash=$(($cash+$BET_PER_GAME))
	else
		cash=$(($cash-$BET_PER_GAME))
	fi
	echo $cash
done
}

calculateGambler
