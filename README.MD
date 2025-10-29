# Outpatient Reservation System (Shell Scripting Project)

## Project Overview
This project is an outpatient reservation system that both doctors and patients can use to make appointment scheduling easier and more organized.

## How It Works
The system begins with a main menu in `main.sh` that allows the user to choose between three options:
- Run the **Patient Menu**
- Run the **Admin Menu**
- Exit the system

If the user selects the patient option, `patient.sh` is executed to display the patient menu.  
If the user selects the admin option, `admin.sh` is executed to display the admin menu.  
Each menu lists the available operations the user can perform, and when a selection is made, the corresponding script executes.

## Examples
- If a patient chooses to register as a new patient, the `newpatient.sh` script runs and prompts for registration details.  
- If a patient chooses to view their appointments, the `viewappointment.sh` script runs and asks for their patient ID to retrieve their scheduled appointments.  
- For the admin (doctor), similar logic applies: when an operation is selected, its corresponding script runs and requests the necessary information to perform the task.  
  The only exception is viewing the patient list, which directly prints data without running a separate script.

## Script Details
Each script contains internal comments that explain its purpose and functionality.  
The scripts are designed to handle most cases to ensure that the system operates reliably.

## Execution Advice
Before running the system:
1. Unzip all files.
2. Ensure all scripts are executable by running chmod +x or chmod 755
3. Make sure you have read and write permissions for all .txt files used by the system.
