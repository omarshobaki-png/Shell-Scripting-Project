
#!/bin/sh

echo "Enter doctor id: "
read did
match=$(grep "^$did|" doctors.txt) #ensures a valid id
if [ -z "$match" ]
then
    echo "Doctor id not found"
    exit 1
fi
#for future use
name=$(echo "$match" | cut -d'|' -f2)
specialty=$(echo "$match" | cut -d'|' -f3)
days=$(echo "$match" | cut -d'|' -f4)
start=$(echo "$match" | cut -d'|' -f5)
end=$(echo "$match" | cut -d'|' -f6)
echo "What would you like to update?"
echo "1) Change available days"
echo "2) Change working hours"
echo "3) Change specialty"
read choice
case $choice in
1)
    echo "Enter new available days: "
    read days
    ;;
2)
    echo "Enter new start time (HH:MM): "
    read start
    while ! echo "$start" | grep '^[0-9][0-9]:[0-9][0-9]$' > /dev/null #ensures corrrect format
    do
        echo "Invalid format, enter time as HH:MM: "
        read start
    done

    echo "Enter new end time (HH:MM):"
    read end
    while ! echo "$end" | grep '^[0-9][0-9]:[0-9][0-9]$' > /dev/null
    do
        echo "Invalid format, Enter time as HH:MM: "
        read end
    done
    ;;
3)
    echo "Enter new specialty: "
    read specialty
    ;;
*)
    echo "Invalid option"
    exit 1
    ;;
esac

grep -v "^$did|" doctors.txt > temp.txt #change what we need to change then reorganize doctors.txt
echo "$did|$name|$specialty|$days|$start|$end" >> temp.txt
sort temp.txt > doctors.txt
rm temp.txt

echo "$name data was updated successfully"
