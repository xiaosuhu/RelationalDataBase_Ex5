#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

NUMBER=$(( ( RANDOM % 1000 )  + 1 ))

echo "Enter your username:"
read USERNAME

USER_QUERY=$($PSQL "select username, game_played, best_game from usert where username='$USERNAME'")

if [[ -z $USER_QUERY ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  CREATE_NEW_USER=$($PSQL "insert into usert (username, game_played,best_game) values('$USERNAME', 1, 0)")
  BEST_GAME=0
else
  echo $USER_QUERY | while read USERNAME BAR GAME_PLAYED BAR BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
    GAME_PLAYED_NEW=$((GAME_PLAYED+1))
    ADD_GAME_NUM=$($PSQL "update usert set game_played=$GAME_PLAYED_NEW")
  done
fi
