#!/bin/bash -x
echo "**********Welcome to Gambling Simulator Problem**********"

#CONSTANTS
STAKE_PER_DAY=100
BET_PER_GAME=1

#VARIABLES
cash=$STAKE_PER_DAY

declare -A dictionaryToCountMonths

#function is used to calculate percentage
function calculatePercentage(){
	MAXIMUM_RESULT=$(($STAKE_PER_DAY + (50*$STAKE_PER_DAY/100) ))
	MINIMUM_RESULT=$(($STAKE_PER_DAY - (50*$STAKE_PER_DAY/100) ))
}

#function is used to calculate won or loose condition
function calculateGambler(){
	while [[ $cash -gt $MINIMUM_RESULT && $cash -lt $MAXIMUM_RESULT ]]
	do
		RandomCheck=$((RANDOM%2))
			if [ 1 -eq $RandomCheck ]
			then
				cash=$(($cash+$BET_PER_GAME))
			else
				cash=$(($cash-$BET_PER_GAME))
			fi
	done
			totalCash=$cash-$STAKE_PER_DAY
			echo $totalCash
}

#function is used to calculate total amount won or loose after 20 days
function calculateTotalAmount(){
for ((day=1;day<=20;day++))
do
	totalAmount=$((totalAmount + $(calculateGambler) ))
	dictionaryToCountMonths[day$day]=$totalAmount
	echo day$day ${dictionaryToCountMonths[day$day]} 
done
	echo $totalAmount
}

#function is used to sort
function sorting(){
for i in ${!dictionaryToCountMonths[@]}	
do
	echo $i ${dictionaryToCountMonths[$i]}
done | sort -rn -k2
}

#function is used to check playing for next month or not
function playingForNextMonth(){
	if [ $totalAmount -gt 0 ]
	then
		read -p "Congrats You won...!! enter your choice would you like to play next or not" choice
		echo "1 for Yes"
		echo "0 for No"
			if [[ $choice == 1 ]]
			then
				echo "play for next month"
				calculateTotalAmount
				echo Luckiest day2 :: $(sorting | head -1 )
				echo Unluckiest day2 :: $(sorting | tail -1 )
			else
				echo "sorry!! Stop playing the game"
			fi
	else
		read -p "You lost..!!Better luck next time."

	fi
}

calculatePercentage
calculateTotalAmount
echo Luckiest day2 :: $(sorting | head -1 )
echo Unluckiest day2 :: $(sorting | tail -1 )
playingForNextMonth

