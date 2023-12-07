#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME

GET_USER_NAME_RESULT=$($PSQL "SELECT user_name FROM users WHERE user_name='$USERNAME'")

if [[ "$GET_USER_NAME_RESULT" == "$USERNAME" ]]
then
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_name='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_name='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else  
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(user_name, games_played, best_game) VALUES('$USERNAME', 0, 100)")
  GAMES_PLAYED=0
  BEST_GAME=100
fi


# generate and save a random number
secret_number=$(( 1 + $RANDOM % 1000 ))

number_of_guesses=0
GUESS=0

# while no match
while [ $GUESS != $secret_number ]
do
  echo Guess the secret number between 1 and 1000:
  read GUESS
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo That is not an integer, guess again:
    read GUESS
  done
  
  number_of_guesses=$[$number_of_guesses + 1]
  if [[ $GUESS > $secret_number ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS < $secret_number ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!
    
    games_played_new=$[$GAMES_PLAYED + 1]
    if [[ $number_of_guesses -lt $BEST_GAME ]]
    then
      new_best_game=$[$number_of_guesses]
    else
      new_best_game=$[$BEST_GAME]
    fi
  fi
done

echo $($PSQL "UPDATE users SET games_played=$games_played_new WHERE user_name='$USERNAME'") > /dev/null
echo $($PSQL "UPDATE users SET best_game=$new_best_game WHERE user_name='$USERNAME'") > /dev/null