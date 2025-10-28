#!/bin/sh
echo "Enter your Patient id: "
read pid
if ! grep "^$pid|" patients.txt > /dev/null #checks for patient in patients.txt
then
    echo "Patient not found"
    exit 1
fi
matches=$(grep "|$pid|" appointments.txt | grep "Confirmed")
#gets every line that is confirmed and searches for the patients id in those lines
if [ -z "$matches" ] #-z checks if its a null string
then
    echo "No appointments have been made for $pid"
    exit 1
fi

echo "$matches" #prints all the appointments of the patient
echo "Enter the appointment id to cancel:"
read aid
if ! grep "^$aid|" appointments.txt > /dev/null
then
    echo "Appointment id not found"
    exit 1
fi

# check if the appointment belongs to this patient
if ! grep "^$aid|$pid|" appointments.txt > /dev/null
then
    echo "That appointment does not belong to you."
    exit 1
fi

grep -v "^$aid|" appointments.txt > temp.txt 
#writes all the lines in appointments.txt in a temp file except the one with the matching aid 
grep "^$aid|" appointments.txt | sed 's/Confirmed$/Cancelled/' >> temp.txt #changes status
sort -o appointments.txt temp.txt

echo "Appointment $aid has been cancelled"
