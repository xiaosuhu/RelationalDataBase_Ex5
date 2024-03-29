#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

echo "Enter your username:"
read USERNAME

USER_QUERY=$($PSQL "select username, game_played, best_game from usert where username='$USERNAME'")

if [[ -z $USER_QUERY ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  CREATE_NEW_USER=$($PSQL "insert into usert (username, game_played, best_game) values('$USERNAME', 1, 9999)")
else
  echo $USER_QUERY | while read USER_NAME BAR GAME_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USER_NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
    let GAME_PLAYED=$GAME_PLAYED+1
    ADD_GAME_NUM=$($PSQL "update usert set game_played=$GAME_PLAYED where username='$USER_NAME'")
  done
fi

NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
echo $NUMBER

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
 
      # Compare with the previous best_game record and write in database
      BEST_GAME=$($PSQL "select best_game from usert where username='$USERNAME'")
      if [[ $GUESS_TIMES < $BEST_GAME ]]
      then
        NEW_BEST_GAME=$($PSQL "update usert set best_game=$GUESS_TIMES where username='$USERNAME'")
      fi
        
      echo "You guessed it in $GUESS_TIMES tries. The secret number was $NUMBER. Nice job!"

      break
    fi
  fi
done

