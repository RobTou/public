#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

INPUT=$1

if [[ -z $INPUT ]]
then  
  echo Please provide an element as an argument.
  exit
fi

#check if $1 is a INT
if [[ $INPUT =~ ^[0-9]+ ]]
then
  ATOMIC_NUMBER=$INPUT
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
  #if doesn't exist
  if [[ -z $NAME || -z $SYMBOL || -z $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else
    TYPE=$($PSQL "SELECT type FROM types JOIN properties USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")

    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi

#else check if $1 is a 1 or 2-letter string starting with a capital letter
elif [[ $INPUT =~ ^[A-Z][a-z]?$ ]]
then
  SYMBOL=$INPUT
  NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$SYMBOL'")
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$SYMBOL'")
  #if doesn't exist
  if [[ -z $NAME || -z $SYMBOL || -z $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else
    TYPE=$($PSQL "SELECT type FROM types JOIN properties USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")

    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi

#else check if $1 a string
elif [[ $INPUT =~ ^[A-Z][a-z]{2,} ]]
then
  NAME=$INPUT
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE  name = '$NAME'")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$NAME'")
  #if doesn't exist
  if [[ -z $NAME || -z $SYMBOL || -z $ATOMIC_NUMBER ]]
  then
    echo I could not find that element in the database.
  else
  TYPE=$($PSQL "SELECT type FROM types JOIN properties USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
  MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
  BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi

else
  echo I could not find that element in the database.
fi
