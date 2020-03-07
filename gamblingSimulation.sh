#!/bin/bash -x
echo "**********Welcome to Gambling Simulator Problem**********"

#CONSTANTS
STAKE_PER_DAY=100
BET_PER_GAME=1

#VARIABLES
cash=$STAKE_PER_DAY

#function is used to check win or loose condition
function checkCondition(){
RandomCheck=$(($RANDOM%2))
	if [ 1 -eq $RandomCheck ]
	then
		cash=$STAKE_PER_DAY+$BET_PER_GAME
	else
		cash=$STAKE_PER_DAY-$BET_PER_GAME
	fi
}

checkCondition
