#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# declare some variables
USERNAME=""
USER_ID=0
TRIES=1
GUESS=0
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# Write some func to devide our big func to small pieces

# user data

GET_USERNAME(){
  echo -e "\nEnter your username:"
  read USERNAME

  USERNAME_CHARACTERS=$(echo $USERNAME | wc -c)
  if [[ $USERNAME_CHARACTERS -gt 22 ]]
  then
    echo -e "Entered name is too long. Max count of chars is 22" 
    GET_USERNAME
  fi
}

UPDATE_USER_INTO_DB () {
  # try to find it into DB
  NAME_TO_DB=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

  #if it isn't there
  if [[ -z $NAME_TO_DB ]]
  then
    INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MAX(guesses) FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME'")
    GAMES=$(if [[ $GAMES_PLAYED -eq 1 ]]; then echo "game"; else echo "games"; fi)
    GUESSES=$(if [[ $BEST_GAME -eq 1 ]]; then echo "guess"; else echo "guesses"; fi)
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED $GAMES, and your best game took $BEST_GAME $GUESSES."
  fi

  # also update USER_ID
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
}

# end user data

# get user input
USET_INPUT () {
  echo -e "\nGuess the secret number between 1 and 1000:"
  read GUESS
}

# try to catch some errors and brake states

END_GAME_BY_HANDLE () {
  echo -e "\nThe user end game by handle. Was $TRIES, but the SECRET NUMBER is $SECRET_NUMBER"
  GUESS="STOP"
}

WRONG_USER_INPUT () {
  echo -e "\nThat is not an integer, guess again:"
  INCREASE_TRIES
  read GUESS
}

USER_WON () {
  echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
}

# end errors and brake states

# processing numbers and tries

CHECK_GUESS_NUM_TO_VALIDATION () {
  if [[ echo $GUESS | grep -Eq '[exit|quit|end|q|e]i' ]]
  then 
    END_GAME_BY_HANDLE 
  elif [[ ! $GUESS =~ ^[0-9]+$  ]]
  then 
    WRONG_USER_INPUT
    USET_INPUT
    CHECK_GUESS_NUM_TO_VALIDATION
  elif [[ $GUESS =~ ^[+-]?[0-9]+$ ]]
  then
    CHECK_GUESS_NUM
  fi
}

INCREASE_TRIES () {
  TRIES=$(expr $TRIES + 1)
  echo -e "\nThe tries count was increased by one. And now it $TRIES"
}

CHECK_GUESS_NUM () {
  if [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    USET_INPUT
    INCREASE_TRIES
    CHECK_GUESS_NUM_TO_VALIDATION
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
    USET_INPUT
    INCREASE_TRIES
    CHECK_GUESS_NUM_TO_VALIDATION
  elif [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    USER_WON
  fi
}

# end processing numbers and tries

# update final table with current user
UPDATE_TOTAL () {
  INSERTED_GAME=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $TRIES)")
}

# end small pieces

# main func

MAIN_FUNCTION () {
  echo -e "\nI glad to see you into guess game :)"

  # get user name by input
  GET_USERNAME

  # check and update it into DB
  UPDATE_USER_INTO_DB

  # get first user input
  USET_INPUT
  
  # start while loop to check user unput
  CHECK_GUESS_NUM_TO_VALIDATION

  #finally update DB 
  UPDATE_TOTAL
}

MAIN_FUNCTION
