#!/bin/bash
clear
while true
do
echo "Admin Menu :"
echo "Please choose one of these services: "
echo "1) Add a new doctor"
echo "2) Update doctor schedule"
echo "3) View doctor schedule"
echo "4) View daily report"
echo "5) View patient list"
echo "6) Perform system backup"
echo "7) Return to main menu"
echo "Enter your choice [1-7]: "
read choice
case $choice in
1) ./adddoctor.sh ;;
2) ./updatedoctor.sh ;;
3) ./viewschedule.sh ;;
4) ./viewdailyreport.sh ;;
5)
echo "Patient List:"
cat patients.txt
;;
6) ./backup.sh ;;
7)
echo "Returning to main menu..."
./main.sh
exit
;;
*)
echo "Invalid choice, please try again"
sleep 1
;;
esac
done



