#!/bin/bash

# Command-line arguments for customization
PROCESS_NAME=${1:-"node index.js"} # Default process name
SCREEN_NAME=${2:-"my-screen"}      # Default screen name

# Function to check if the process is running
process_running() {
    pgrep -fla "$PROCESS_NAME" | grep -v grep | grep -v "$0" > /dev/null
    return $?
}

# Check if the screen session exists
if screen -list | grep -q "$SCREEN_NAME"; then
    echo "Screen session $SCREEN_NAME exists."

    # Check if the process is running
    if process_running; then
        echo "$PROCESS_NAME is already running."
    else
        echo "$PROCESS_NAME is not running."
        # Start the process within the existing screen session
        screen -S "$SCREEN_NAME" -X stuff "$PROCESS_NAME\n"
        echo "$PROCESS_NAME started in $SCREEN_NAME."
    fi
else
    echo "Screen session $SCREEN_NAME does not exist."
    # Start the process in a new screen session
    screen -dmS "$SCREEN_NAME" sh -c "$PROCESS_NAME"
    echo "Screen session $SCREEN_NAME started with $PROCESS_NAME."
fi