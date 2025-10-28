#!/bin/sh
if [ ! -f appointments.txt ] || [ ! -f patients.txt ] #checks if appointment and patient are files
 then
echo "Check for missing files"
exit 1
fi
echo "Enter your patient id: " #checks if patient exists in patients.txt
read pid
if ! grep "^$pid|" patients.txt > /dev/null
then
echo "Patient not found"
exit 1
fi
if ! grep "|$pid|" appointments.txt > /dev/null #checks for the patients appointments using PID
then
echo "You have no appointments"
exit 0
fi
echo "Your Appointments:"
grep "|$pid|" appointments.txt
