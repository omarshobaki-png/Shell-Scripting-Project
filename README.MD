Project overview:
This project is about an outpatient reservation system that both the doctors and the patients can use 
to make the appointments scheduele easier.

How it works:
The main idea is to have a main menu in main.sh that then either runs patient.sh or admin.sh or exit according
to the users input.

The system then reads the user input if he selects patient patient.sh will execute and show the patient menu
similarly the admin.sh will execute and show the admin menu if the user selects admin

In each of the menus a list is printed to showcase the kind of operations they are eligible to do and when
the user chooses one of them the script for that operation wiill run.

Examples: 
For example if the user is a patient he will select one of 5 operations, lets say he chose to register as a 
new patient. the newpatient script will execute and ask him for the needed info to register and if he chose to
view his appointments the view appointment.sh script will execute asking him for his Pid to search for his
appointments and so on

Same thing can be said about if the user was an admin or a doctor if they chose an operation its script will run
asking the user for the needed info to execute said operation except for viewing the patient list as its just
a printing operation no script is needed

Scripts details:
In each of the scripts there are comments to explain each script and most details on how we made this system work
and how we tried to cover most cases to ensure a reliable system

Execution advice:
**Before executing unzip the files and make sure that all scripts are executable by using chmod + or chmod 755
additionally you need to make sure you have permisions to read and write from the .txt files 
