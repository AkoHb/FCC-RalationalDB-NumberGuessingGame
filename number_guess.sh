#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# declare variables
BEST_GAME_GUESSES=0
GAMES_COUNT=0
GAME_ID=0
GUESSES=0
USER_INPUT=0
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

# check, if username isn't valid, try to input it else
while [[ ! "$USERNAME" =~ ^[a-zA-Z0-9_]{1,23}$ ]] 
do
    echo "Username isn't valid. Please, check it (max lenght=23 chars and only nums and chars from 'a' to 'z') and try it again."
    read USERNAME
done

# check and update table with user info
user_into_db=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME';")

if [[ -z $user_into_db ]]
then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    insert_into_db=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
else
    BEST_GAME_GUESSES=$($PSQL "SELECT best_game_guesses FROM users WHERE username = '$USERNAME';")
    GAMES_COUNT=$($PSQL "SELECT games_count FROM users WHERE username = '$USERNAME';")
    echo "Welcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $BEST_GAME_GUESSES guesses."
fi

# llop to guess a random number
echo "Guess the secret number between 1 and 1000: "

while [[ $USER_INPUT -ne $RANDOM_NUMBER ]]; do
    read USER_INPUT

    if ! [[ $USER_INPUT =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    fi

    (( GUESSES ++ ))

    if [[ $USER_INPUT -lt $RANDOM_NUMBER ]]; then
        echo "It's higher than that, guess again:"
    elif [[ $USER_INPUT -gt $RANDOM_NUMBER ]]; then
        echo "It's lower than that, guess again:"
    fi
done

(( GAMES_COUNT ++ ))

# With that section I can't pass the test. ( 8 and 13 marks)
# update games table
# # get user id at first and check it
# USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
# if [[ -z $USER_ID ]] 
# then
#   echo "User isn't hold into table users"
# else
#     GAME_ID=$($PSQL "INSERT INTO  games (user_id, random_num, guesses) VALUES ($USER_ID, $RANDOM_NUMBER, $GUESSES) RETURNING game_id")
# fi

if [[ $BEST_GAME_GUESSES -eq 0 || $GUESSES -lt $BEST_GAME_GUESSES ]]
then
    $PSQL "UPDATE users SET games_count=$GAMES_COUNT, best_game_id=$GAME_ID, best_game_guesses=$GUESSES WHERE username='$USERNAME';" 1>/dev/null
else
    $PSQL "UPDATE users SET games_count=$GAMES_COUNT WHERE username='$USERNAME';" 1>/dev/null
fi

echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
