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
