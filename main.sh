#!/bin/bash

clear
echo "===============================" #formatting purposes
echo " Outpatient Reservation System"
echo "==============================="
echo "1. Patient"
echo "2. Admin"
echo "3. Exit"
echo "Enter your choice [1-3]: "
read choice

case $choice in #decides which script to run according to user input
    1)
        ./patient.sh
        ;;
    2)
        ./admin.sh
        ;;
    3)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice. Please run again." #ensures the user selects one of the three options
        exit 1
        ;;
esac

