#!/bin/sh
if [ ! -e doctors.txt ] #creates doctors.txt if it isnt there already
then
    touch doctors.txt
fi
lines=$(wc -l < doctors.txt) #a way to ensure each doctor has a unique id
id="D00$((lines + 1))"
echo "Enter full name:"
read name
echo "Enter specialty:"
read specialty
echo "Enter available days (IN 3 LETTER SHORT):"
read days
echo "Enter start time (HH:MM): "
read start
if ! echo "$start" | grep '^[0-9][0-9]:[0-9][0-9]$' > /dev/null #ensures correct date format
then
    echo "Invalid start time format"
    exit 1
fi
echo "Enter end time (HH:MM): "
read end
if ! echo "$end" | grep '^[0-9][0-9]:[0-9][0-9]$' > /dev/null #ensures correct date format
then
    echo "Invalid end time format"
    exit 1
fi
if grep "|Dr. $name|$specialty|" doctors.txt > /dev/null #duplicate check
then
    echo "This doctor already exists with the same specialty"
    exit 1
fi
echo "$id|Dr. $name|$specialty|$days|$start|$end" >> doctors.txt #saves the new doctor data to doctors.txt
echo "Doctor $name added successfully with ID $id"

