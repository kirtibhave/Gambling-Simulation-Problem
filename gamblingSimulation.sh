#!/bin/bash 

echo "**********Welcome to Gambling Simulator Problem**********"

#CONSTANTS
STAKE_PER_DAY=100
BET_PER_GAME=1

#VARIABLES
cash=$STAKE_PER_DAY

declare -A countMonths

#function is used to calculate percentage
function calculatePercentage(){
	MAXIMUM_RESULT=$(( (50*$STAKE_PER_DAY/100)+$STAKE_PER_DAY ))  
	MINIMUM_RESULT=$(( (50*$STAKE_PER_DAY/100)-$STAKE_PER_DAY ))
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
		countMonths[day$day]=$totalAmount;
		echo day$day  amount is:${countMonths[day$day]}
	done
		echo "total amount is: $totalAmount"

if [ $totalAmount -gt 0 ]
then
	echo "YOU WON,WOULD RESIGN FOR THE DAY"
else
	echo "YOU LOOSE,WOULD RESIGN FOR THE DAY"
fi
}

#function is used to sort
function sorting(){
for i in ${!countMonths[@]}
do
	echo "$i amount::${countMonths[$i]}"
done | sort -rn -k2
}

calculatePercentage
calculateTotalAmount
echo Luckiest day:: $(sorting | head -1 )
echo Unluckiest day:: $(sorting | tail -1 )
