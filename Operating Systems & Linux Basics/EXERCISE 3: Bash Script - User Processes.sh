#!/bin/bash

user=$(whoami)

echo "Displaying processes running for the user: $user"

ps aux | grep "$user"
