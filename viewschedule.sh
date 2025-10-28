#!/bin/sh
echo "Enter doctor id to view schedule: "
read did
found=$(grep "^$did|" doctors.txt)
if [ -z "$found" ]
then
    echo "Doctor id not found"
    exit 1
fi
matches=$(grep "Confirmed" appointments.txt | grep "|$did|")
if [ -z "$matches" ] #checks if doctor has no appointments
then
    echo "No confirmed appointments found for this doctor."
    exit 0
fi
echo "Confirmed appointments: "
for line in $(grep "|Confirmed" appointments.txt | grep "|$did|") #prints all appointments with did
do
    date=$(echo "$line" | cut -d'|' -f4)
    time=$(echo "$line" | cut -d'|' -f5)
    pid=$(echo "$line" | cut -d'|' -f2)
    pname=$(grep "^$pid|" patients.txt | cut -d'|' -f2) #since the name isnt in appointment.txt
    echo "$date   $time   $pname"
done
