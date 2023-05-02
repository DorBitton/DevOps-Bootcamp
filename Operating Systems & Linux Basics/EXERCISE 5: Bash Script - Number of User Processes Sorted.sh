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
