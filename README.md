# NsearchRobotAutomationTask

## How to setup
1. Make sure Python 3.9 and above, and pip are installed in your system.
2. Clone this repository in any IDE like Pycharm
3. Execute below command in root directory of this project

   **pip install -r requirements.txt**
4. Execute **robot --version** to ensure packages are installed.
 
## How to execute testcases
1. Make sure oppenheimer project is running in your local host on port 8080.
2. Run command  **robot Testcases/*** to execute all 36 testcases.

## Note:
   You can view current executed test results in file named **report-all-testcases.html** in root directory.
   
## Bugs:
   1. Able to insert record even when natid is invalid and containing special characters.
   2. Able to upload file even if it is not CSV file type.
