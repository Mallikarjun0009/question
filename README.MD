### Hi this is mallikarjuna

condition in shell script
------------------------

7 days
MON-SAT have school
SUN is holday

today

if(today=="sunday"){
	print holiday, enjoy
}
else{
	print go to school, happy larning
}


if(expression){
	expression=true, then statements here will run
}
else{
	if above is expression is false, then this will run
}

algorithm
----------------
install git

1. you should be root user, otherwise it will fail


if [ expression ]
then
	these commands will run if expression is true
else
	these commands will run if expression is false
fi

1. check root user or not
2. if not root user, exit the program and inform user to run with sudo access
3. if root user install mysql


root user id -u --> 0
normal user id -u --> not 0

100 statements

you got error at statement 10,

shell script by default it will not stop if it faces error, it is our responsibility to check for the errors

exit status
---------------
$? --> it will store the previous command status

$? --> 0 then previous command is success
$? --> 1-127 previous command is failure

less lines of code, more work

functions
---------------
you will keep some code inside functions which is more often repeated, and call whenever you erquire

functions will do some work on behalf of us and it will update what happend

FUNCTION_NAME(){
	here you write your statements, and call this function wherever required.
}

you need to give inputs, then functions will give output


FUNCTION_NAME

log files are important to know what happend

redirections
----------------
> --> it will only redirect success output

1 --> success
2 --> failure
& --> both success and failure

ls -l > ls.log

ls -l 1> ls.log

ls -l &>ls.log

> --> it will remove previous content, and adds new content
>> --> it will not remove, it will append

$1--> first argument
$2--> second argument

colors in shell scripting
-----------------------

\e[31m --> red
\e[32m --> green


loops
---------------
if you ask 10 packages to install
I want to loop it, then install one by one...

for(int i=0;i<100;i++){
	print i
}

0
0<100 - true --> then it will enter
print 0
1
1<100 --> then it will enter 
print 1
2
.
...

...
99
99<100
print 99
100

for variable in list
do
	write your statement
done

sudo sh 12-loops.sh git mysql postfix 

you run a command multiple times --> duplicates may create
you run a command multiple times --> nothing will happen




#!/bin/bash

USERID=$(id -u)
SUCCESS=true

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 ERROR :: this is a failure"
        SUCCESS=false
    else
        echo "$2 INFO :: this is a success"
    fi
}

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run the script as the root user."
    exit 1
else
    echo "INFO :: This is for root user"
fi

yum install git -y
VALIDATE $? "installing git"

yum install tree -y
VALIDATE $? "Installing tree"

yum install docker -y
VALIDATE $? "installing docker"

#if [ "$SUCCESS" = false ]; then
#    echo "One or more commands failed. Exiting."
#    exit 1
#fi

========================================================================

Variables
data types
conditions
loops
functions

persist the logfiles --> output redirection
color --> user experience
validations --> exit status, we need to take decission

algorithm
----------------
task: install multiple package with single script

user will pass the packages through command line

user should have root access
while installing store the logs
implement colors for user experience
before installing it is always good to check whether package is already installed or not
if installed skip, otherwise proceed for installation
check successfully installed or not

#!/bin/bash

# Color variables for pretty output
R="\e[31m" # Red
G="\e[32m" # Green
Y="\e[33m" # Yellow
N="\e[0m"  # No color

# Get current date and time
DATE=$(date +"%A, %B %d, %Y %r")

# Directory to store logs
LOGSDIR="/root/shellscript"

# Log file name with timestamp
LOGFILE="${LOGSDIR}/$(basename "$0")-${DATE// /_}.log"

# Check if the script is executed with root privileges
if [ "$(id -u)" -ne 0 ];
then
    echo -e "${R}ERROR: Please run this script with root privileges.${N}"
    exit 1
fi

# Function to validate the result of a command
SUCCESS=true
validate() {
    if [ "$1" -ne 0 ];
    then
        echo -e "ERROR: Installation of $2 failed.${R} FAILURE ${N}"
        SUCCESS=false
        #exit 1
    else
        echo -e "INFO: Installation of $2 successful.${G} SUCCESS ${N}"
    fi
}

# Loop through all arguments
for i in "$@";
do
    # Check if the package is installed
    yum list installed "$i" &>> "$LOGFILE"
    if [ $? -ne 0 ];
    then
        echo "$i is not installed. Proceeding with installation..."
        # Install the package
        yum install "$i" -y &>> "$LOGFILE"
        validate $? "$i"
    else
        echo -e "${Y} $i is already installed.${N}"
    fi
done

==================================================================

we need to delete log files more than 2 weeks

/home/centos/app-logs

only .log files should be deleted, dont delete any other files
go to the folder
get all the log files with extension of .log
check the date
if date is more than 2 weeks old delete

find /var/log -name "*.log" -type f -mtime +14 

sh <script-name> --> for this no need of execute permission
./<script-name> --> it should have execute permission


#!/bin/bash

app_log_dir="/root/app_log"

DATE=$(date +"%A, %B %d, %Y %r")

# Directory to store logs
LOGSDIR="/root/shellscript"

# Log file name with timestamp
LOGFILE="${LOGSDIR}/$(basename "$0")-${DATE// /_}.log"

# Find and delete log files older than 1 day
file_to_delete=$(find "$app_log_dir" -type f -name "*.log" -mtime +1)

# Create log directory if it doesn't exist
mkdir -p "$LOGSDIR"

# Log the deleted files
for line in $file_to_delete; do
    echo "deleting $line" >> "$LOGFILE"
    rm -rf "$line"
done

# Exit the script
exit


gmail password:
zmlb todt fyce vtcj
