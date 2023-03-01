#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t -c"

echo "Enter your username:"
read USERNAME

USER_QUERY=$($PSQL "select username, game_played, best_game from usert where username='$USERNAME'")

if [[ -z $USER_QUERY ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  CREATE_NEW_USER=$($PSQL "insert into usert (username, game_played,best_game) values('$USERNAME', 1, 1001)")
else
  echo $USER_QUERY | while read USERNAME BAR GAME_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
#echo $NUMBER

let GAME_PLAYED=$GAME_PLAYED+1
ADD_GAME_NUM=$($PSQL "update usert set game_played=$GAME_PLAYED_NEW where username='$USERNAME'")

GUESS_TIMES=0
echo "Guess the secret number between 1 and 1000:"

while read GUESS
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then 
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS < $NUMBER ]]
    then 
      echo "It's higher than that, guess again:"
      let GUESS_TIMES=$GUESS_TIMES+1
    elif [[ $GUESS > $NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      let GUESS_TIMES=$GUESS_TIMES+1
    else
      let GUESS_TIMES=$GUESS_TIMES+1
      echo "You guessed it in $GUESS_TIMES tries. The secret number was $NUMBER. Nice job!"
      # Compare with the previous best_game record and write in database
     
      if [[ $GUESS_TIMES -le $BEST_GAME ]]
      then
        NEW_BEST_GAME=$($PSQL "update usert set best_game=$GUESS_TIMES where username='$USERNAME'")
      fi
      break
    fi
  fi
done

