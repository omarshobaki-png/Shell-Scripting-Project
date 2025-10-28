#!/bin/sh

while true
do
    echo "Enter the date (YYYY-MM-DD):"
    read tdate
 #ensures correect format
    if echo "$tdate" | grep '^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$' > /dev/null
    then
        break
    else
        echo "Invalid date format"
    fi
done

if [ ! -e appointments.txt ] || [ ! -e patients.txt ] || [ ! -e doctors.txt ]
then
    echo "Missing files"
    exit 1
fi

lines=$(grep "|$tdate|" appointments.txt)

if [ -z "$lines" ] #if lines is a null string it means there are no appointments on that day
then
    echo "No appointments found for $tdate"
    exit 0
fi
echo "Appointments for $tdate:"
for line in $lines
do
    aid=$(echo "$line" | cut -d'|' -f1)
    pid=$(echo "$line" | cut -d'|' -f2)
    did=$(echo "$line" | cut -d'|' -f3)
    time=$(echo "$line" | cut -d'|' -f5)

    pname=$(grep "^$pid|" patients.txt | cut -d'|' -f2)
    dname=$(grep "^$did|" doctors.txt | cut -d'|' -f2)

    echo "$aid | $time | $pname | $dname"
done
