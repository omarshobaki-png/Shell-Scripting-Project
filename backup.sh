#!/bin/sh
if [ ! -d backup ] #checks if backup is a directory
then
    mkdir backup
fi

today=$(date | cut -c1-10 | tr ' ' '_') #only saves date and day
#the underscore is because its a directory name and cant have spaces
if [ -d backup/$today ] # checks if the system was already backed up that day 
then
    echo "Backup already exists for today in backup/$today"
    exit 0
fi
#makes directory in the backup folder with the date of the backup
mkdir backup/$today
cp doctors.txt backup/$today
cp patients.txt backup/$today
cp appointments.txt backup/$today

if [ $? -eq 0 ]
then
    echo "Backup completed to backup/$today"
else
    echo "Backup failed"
fi

