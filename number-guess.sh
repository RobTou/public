#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=games -t --no-align -c"

NUMBER_TO_GUESS=$((RANDOM % 1000 + 1))
COUNTER=0

#get user name
echo -e "\nEnter your username:"
read INPUT_NAME
USERNAME=$($PSQL "SELECT username FROM players WHERE username = '$INPUT_NAME'")

#if user exists
if [[ $USERNAME ]]
then
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games JOIN players USING(user_id) WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games JOIN players USING(user_id) WHERE username = '$USERNAME'")
  USER_ID=$($PSQL "SELECT user_id FROM players WHERE username = '$INPUT_NAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
#if user doesn't exist
else
  echo "Welcome, $INPUT_NAME! It looks like this is your first time here."
  INSERT_PLAYER_RESULT=$($PSQL "INSERT INTO players (username) VALUES ('$INPUT_NAME')")
  USER_ID=$($PSQL "SELECT user_id FROM players WHERE username = '$INPUT_NAME'")
fi


GAME() {
  if [[ -z $1 ]]
  then
    #get number input
    echo -e "\nGuess the secret number between 1 and 1000:"
    read INPUT
    GAME "$INPUT"
  else
    COUNTER=$((COUNTER + 1))
    if [[ $1 =~ ^-?[0-9]+$ ]]
    then
      #if number to guess is lower
      if [[ $1 -gt $NUMBER_TO_GUESS ]]
      then
        echo "It's lower than that, guess again:"
        read NEW_INPUT
        GAME "$NEW_INPUT"
      #if number to guess is higher
      elif [[ $1 -lt $NUMBER_TO_GUESS ]]
      then
        echo "It's higher than that, guess again:"
        read NEW_INPUT
        GAME "$NEW_INPUT"
      #if number is guessed
      else
        #insert game into database
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID, $COUNTER)")

        echo You guessed it in $COUNTER tries. The secret number was $NUMBER_TO_GUESS. Nice job!
        return 0
      fi
    #if input isn't INT
    else
      echo That is not an integer, guess again:
      GAME ""
    fi
  fi
}

GAME ""
exit 0