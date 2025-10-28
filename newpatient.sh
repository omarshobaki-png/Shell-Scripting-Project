#!/bin/sh
if [ ! -e patients.txt ] #creates the patients.txt if it didnt exist before
then
touch patients.txt
fi
lines=$(wc -l < patients.txt) #assigns an id to the new patient and ensures its special
id="P00$((lines+1))"
echo "Enter full name:"
read name
echo "Enter phone number:"
read number
if ! echo "$number" | grep '05[0-9]\{8\}$' > /dev/null #ensure the first two digits are05 and there are 8digits after
then
echo "invalid phone number"
exit 1
fi
if grep "|$number" patients.txt > /dev/null #a simple way to check if the patient is already registered
then
echo "There is already a patient with that phone number"
exit 1
fi
echo "$id|$name|$number" >> patients.txt #saves info in patient.txt
echo "New patient was added to the patient list"
