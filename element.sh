#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if no argument
if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  # if argument is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    QUERY_RESULT=$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = $1")
  else
    QUERY_RESULT=$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE SYMBOL = '$1' OR name = '$1'")
  fi

  # if argument does not match database
  if [[ -z $QUERY_RESULT ]]
  then
    echo I could not find that element in the database.
  else
  # output requested data
    echo $QUERY_RESULT  | while IFS="|" read DUMMY ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi

fi
