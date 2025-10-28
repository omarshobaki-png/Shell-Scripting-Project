#!/bin/bash
clear
while true #ensures the menu keeps popping up unless user chooses to exit
do
echo "Patient Menu :"
echo "Please choose one of these services: "
echo "1) Register as a new patient"
echo "2) Book a new appoitment"
echo "3) View your appoitments"
echo "4) Cancel an appoitment"
echo "5) Return to main menu"
echo "Enter your choice [1-5]: "
read choice
case $choice in
1) ./newpatient.sh ;;
2) ./bookappointment.sh ;;
3) ./viewappointments.sh ;;
4) ./cancelappointment.sh ;;
5)
echo "returning to main menu.."
./main.sh
exit
;;
*)
echo "invalid choice please try again" #in case the user enters a value other than 1-5
sleep 1
;;
esac
done



