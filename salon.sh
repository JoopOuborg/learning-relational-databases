#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Hairdressers Salon appointments ~~~~~\n"
echo -e "Welcome to my salon. How can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICE_IDS=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICE_IDS" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
      1 | 2 | 3 | 4 | 5 | 6) CUSTOMER_DETAILS_MENU ;;
      *) MAIN_MENU "I could not find that service. What would you like today?"
  esac
}

CUSTOMER_DETAILS_MENU() {
# WHAT IS YOUR PHONE NUMBER
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

# GET CUSTOMER NAME and customer id
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
# IF PHONE NUMBER DOES NOT EXIST
    if [[ -z $CUSTOMER_NAME ]]
    then
    # WHAT IS YOUR NAME
    
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # ADD PHONE AND NAME TO CUSTOMERS
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # add service time to appointments
    SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME_SELECTED | sed 's/^*| *$//g')., $CUSTOMER_NAME"
    read SERVICE_TIME

    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
    # echo appointment
    echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
