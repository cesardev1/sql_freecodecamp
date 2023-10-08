#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE games, teams")

#year,round,winner,opponent,winner_goals,opponent_goals
cat games_test.csv | while IFS="," read YEAR ROUND TEAM_1 TEAM_2 GOAL_1 GOAL_2
do
  if [[ $YEAR != "year" ]]
  then
    #get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_1'")

    #if not found 
    if [[ -z $TEAM_ID ]]
    then
      #insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_1');")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Insert into teams: $TEAM_1
      fi
    fi
    #get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_2'")

    #if not found 
    if [[ -z $TEAM_ID ]]
    then
      #insert team
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_2');")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Insert into teams: $TEAM_2
      fi
    fi

    #get team_id of winner and opponent
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$TEAM_1';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$TEAM_2';")

    #Insert games
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID',$GOAL_1,$GOAL_2);")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games: $YEAR, $ROUND, $TEAM_1, $TEAM_2
    fi

  fi
done