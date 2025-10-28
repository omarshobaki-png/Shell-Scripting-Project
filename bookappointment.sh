#!/bin/sh
if [ ! -e doctors.txt ] || [ ! -e patients.txt ] #ensures that the doctors and patient files exist
then
echo "Missing doctors.txt or patients.txt"
exit 1
fi
echo "Enter your Patient ID: "
read pid
if ! grep "^$pid|" patients.txt > /dev/null #checks for the patient in patient.txt using PID
then
echo "Patient not found"
exit 1
fi
echo "Enter the specialty you want to search for: "
read specialty
echo "Available doctors for $specialty: "
if ! grep "|$specialty|" doctors.txt > /dev/null #checks if there are no doctors that match the users input
then
echo "No doctors available"
exit 1
fi
grep "|$specialty|" doctors.txt
echo "Enter the Doctor id to book with: "
read did
if ! grep "^$did|" doctors.txt > /dev/null
then
echo "Doctor not found"
exit 1
fi
line=$(grep "^$did|" doctors.txt) #finds the line of data that belongs to the doctor
days=$(echo "$line" | cut -d"|" -f4) #shows the working days
start=$(echo "$line" | cut -d"|" -f5) #shows the starting work hour
end=$(echo "$line" | cut -d"|" -f6) #shows the ending work hour
echo "Doctor is available on $days between $start and $end"
echo "Please make sure the date you enter is valid"
echo "Enter the date of your appointment in YYYY-MM-DD format: "
read date
while ! echo "$date" | grep '^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$' > /dev/null
do #ensures matching format to the one given
    echo "Invalid date format, enter date in YYYY-MM-DD format:"
    read date
done
echo "Enter the time of your appointment (format is HH:MM)"
read time
while ! echo "$time" | grep '^[0-9][0-9]:[0-9][0-9]$' > /dev/null #ensures correct format
do
    echo "Invalid time format. Please enter time in HH:MM format:"
    read time
done
while grep "|$did|$date|$time|Confirmed" appointments.txt > /dev/null #asks user to select a different time 
do
echo "Doctor not available at that time, please enter a different time:"
read time
done
if [ ! -f appointments.txt ]; then #checks if the appointment file exists else it creates it
touch appointments.txt
fi
count="$(wc -l < appointments.txt)"
aid="A00$(($count + 1))"
echo "$aid|$pid|$did|$date|$time|Confirmed" >> appointments.txt
echo "Appointment booked successfully with ID: $aid"
