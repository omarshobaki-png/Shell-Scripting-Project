# Outpatient Reservation System (Shell Scripting Project)

Author: Omar Shoubaki  
Birzeit University  
Electrical and Computer Engineering Department

## Project Overview
This project is about an outpatient reservation system that both doctors and patients can use to make appointment scheduling easier.

## How It Works
The main idea is to have a main menu in main.sh that either runs patient.sh, admin.sh, or exits according to the user's input.

The system reads the user input and executes the corresponding script.  
If the user selects patient, patient.sh will execute and show the patient menu.  
If the user selects admin, admin.sh will execute and show the admin menu.

In each menu, a list of available operations is displayed based on the user's role.  
When the user chooses an operation, the script responsible for that operation runs automatically.

## Examples
For example, if the user is a patient, they can choose one of five operations.  
If the patient chooses to register as a new patient, the newpatient.sh script will execute and ask for the required information to register.  
If the patient chooses to view their appointments, the viewappointment.sh script will execute and ask for their patient ID (Pid) to display their scheduled appointments.

Similarly, if the user is an admin or a doctor, selecting an operation will execute its corresponding script and ask for the required information to perform that action.  
The only exception is viewing the patient list, which simply prints the list without running a separate script.

## Scripts Details
Each script includes comments explaining its functionality and design choices.  
The comments describe how the system handles different cases to ensure reliability and error prevention.

## Execution Advice
Before executing, unzip all files and ensure that each script is executable by using:
chmod +x or chmod 755
Also, make sure you have permission to read from and write to all .txt files used by the system.

## Purpose
This project was developed as part of the ENCS3130 Linux Laboratory course.  
It demonstrates practical understanding of shell scripting, file handling, process execution, and user interaction within a Linux environment.


