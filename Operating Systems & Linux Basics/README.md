# Operating Systems & Linux Basics

Exercises for Module "Linux":

<details>
<summary>Exercise 1: Linux Mint Virtual Machine </summary>
 <br />
Create a Linux Mint Virtual Machine on your computer. Check the distribution, which package manager it uses (yum, apt, apt-get). Which CLI editor is configured (Nano, Vi, Vim). What software center/software manager it uses. Which shell is configured for your user.

 </details>


<details>
<summary>Exercise 2: Bash Script - Install Java </summary>
 <br />

Write a bash script using Vim editor that installs the latest java version and checks whether java was installed successfully by executing a java -version command. Checks if it was successful and prints a success message, if not prints a failure message.

Execute script with sudo!
  
  
  **script:**
```sh
#!/bin/bash

apt update
apt install -y default-jre

java_version=$(java -version > /dev/null 2>&1 >| grep "java version\|openjdk version" | awk '{print substr($3,2,2)}')

if [ "$java_version" == "" ]
then
    echo Installing Java has failed. No java version found	
elif [ "$java_version" == "1." ]
then
    echo An old version of Java installation found
elif [ "$java_version" -ge 11 ]
then
    echo Java version 11 or greater installed successfully
fi
```
</details>

<details>
<summary>Exercise 3: Bash Script - User Processes </summary>
 <br />
 Write a bash script using Vim editor that checks all the processes running for the current user (USER env var) and prints out the processes in console. Hint: use ps aux command and grep for the user.
 
	
	
   **script:**
```sh
 #!/bin/bash

user=$(whoami)

echo "Displaying processes running for the user: $user"

ps aux | grep "$user"
 
 ```
 
 </details>

<details>
<summary>Exercise 4: Bash Script - User Processes Sorted </summary>
 <br />
 Extend the previous script to ask for a user input for sorting the processes output either by memory or CPU consumption, and print the sorted list.

	
	
    **script:**
```sh
 #!/bin/bash

user=$(whoami)

read -p "Do you want to sort the running processes by CPU or Memory?" sort_by
echo "Displaying processes running for the user: $user, sorted by $sort_by"

if [ $sort_by == "memory" ]
then
 ps aux --sort -rss | grep "$user"
elif [ $sort_by == "cpu" ]
then 
 ps aux --sort -pcpu | grep "$user"
else
	echo "Wrong input provided."
fi
 ```
 </details>

<details>
<summary>Exercise 5: Bash Script - Number of User Processes Sorted</summary>
 <br />
 Extend the previous script to ask additionally for user input about how many processes to print. Hint: use head program to limit the number of outputs.
Context: We have a ready NodeJS application that needs to run on a server. The app is already configured to read in environment variables.
 
	
	
    **script:**
```sh
 #!/bin/bash

user=$(whoami)

read -p "Do you want to sort the running processes by CPU or Memory?" sort_by
read -p "How many lines do you wish to present?" lines
echo "Displaying processes running for the user: $user, sorted by $sort_by"

if [ $sort_by == "memory" ]
then
 ps aux --sort -rss | grep "$user" | head -$lines
elif [ $sort_by == "cpu" ]
then 
 ps aux --sort -pcpu | grep "$user" | head -$lines
else
	echo "Wrong input provided."
fi
 ```
 </details>

<details>
<summary>Exercise 6: Bash Script - Start Node App </summary>
 <br />
Write a bash script with following logic:
Install NodeJS and NPM and print out which versions were installed
Download an artifact file from the URL: https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz 43. Hint: use curl or wget
Unzip the downloaded file
Set the following needed environment variables: APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret
Change into the unzipped package directory
Run the NodeJS application by executing the following commands: npm install and node server.js
Notes:
Make sure to run the application in background so that it doesn’t block the terminal session where you execute the shell script
If any of the variables is not set, the node app will print error message that env vars is not set and exit
It will give you a warning about LOG_DIR variable not set. You can ignore it for now.
 
 </details>

<details>
<summary>Exercise 7: Bash Script - Node App Check Status </summary>
 <br />
 Extend the script to check after running the application that the application has successfully started and prints out the application’s running process and the port where it’s listening.
 
  </details>

 <details>
<summary>Exercise 8: Bash Script - Node App with Log Directory</summary>
 <br />
Extend the script to accept a parameter input log_directory: a directory where application will write logs.
The script will check whether the parameter value is a directory name that doesn’t exist and will create the directory, if it does exist, it sets the env var LOG_DIR to the directory’s absolute path before running the application, so the application can read the LOG_DIR environment variable and write its logs there.
Note:
Check the app.log file in the provided LOG_DIR directory.
This is what the output of running the application must look like: node-app-output.png 32
  </details>

  <details>
<summary>Exercise 9: Bash Script - Node App with Service user</summary>
 <br />
   You’ve been running the application with your user. But we need to adjust that and create own service user: myapp for the application to run. So extend the script to create the user and then run the application with the service user.
 </details>
   
