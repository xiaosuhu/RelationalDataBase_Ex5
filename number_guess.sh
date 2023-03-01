#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
echo $NUMBER

echo "Enter your username:"
read USERNAME

USER_QUERY=$($PSQL "")