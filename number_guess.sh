#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER_NAME

USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME'")

if [[ -z $USER_ID_RESULT ]]
then
  echo -e "Welcome, $USER_NAME! It looks like this is your first time here.\n"
  INSERT_NAME=$($PSQL "INSERT INTO users(name) VALUES('$USER_NAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME'")

else
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_id=$USER_ID_RESULT")
  username=$($PSQL "SELECT name FROM users WHERE user_id=$USER_ID_RESULT")
  games_played=$($PSQL "SELECT COUNT(user_id) FROM results WHERE user_id=$USER_ID_RESULT")
  best_game=$($PSQL "SELECT MIN(number_of_guesses) FROM results WHERE user_id=$USER_ID_RESULT")
  if [[ -z $best_game ]]
  then
    best_game=0
  fi

  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."  
fi


# generate and save a random number
secret_number=$(( $RANDOM % 1000 + 1 ))

number_of_guesses=0
GUESS=0
echo "Guess the secret number between 1 and 1000:"

# while no match
while [ $GUESS != $secret_number ]
do
  read GUESS
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS
  done
  
  number_of_guesses=$[$number_of_guesses + 1]
  if [[ $GUESS > $secret_number ]]
  then
    echo "It's lower than that, guess again:"
  fi

  if [[ $GUESS < $secret_number ]]
  then
    echo "It's higher than that, guess again:"
  fi
  if [[ $GUESS == $secret_number ]]
  then
    echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
   
  fi
done

INSERT_GAME=$($PSQL "INSERT INTO results(user_id, number_of_guesses) VALUES($USER_ID, $number_of_guesses)")
