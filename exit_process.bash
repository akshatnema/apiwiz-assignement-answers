#!/bin/bash

read -p "Enter the process ID: " process_id

# Check if the process exists
if ps -p $process_id > /dev/null; then
    echo "Process ID $process_id exists."
else
    echo "Process ID $process_id does not exist."
fi
