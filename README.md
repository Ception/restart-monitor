# Restart Monitor Script

## Description

This script is designed to monitor and restart a specified process within a GNU Screen session. It's useful for ensuring that a critical process (like a web server or an application backend) remains running. The script checks if the specified screen session exists and whether the process is running. If the process isn't running, the script restarts it within the screen session.

## How to Use

1. **Make the Script Executable**:

   Run `chmod +x restart-monitor.sh` to make the script executable.

2. **Run the Script**:

   - Without arguments (uses default values):

     ```
     ./restart-monitor.sh
     ```

   - With custom process name and screen name:
     ```
     ./restart-monitor.sh "<custom-process command>" "<custom-screen-name>"
     ```

### Examples

- **Node.js Application**:

  ```
  ./restart-monitor.sh "node app.js" "node-app-screen"
  ```

  For running a Node.js application (`app.js`).

- **Python Script**:

  ```
  ./restart-monitor.sh "python3 script.py" "python-script-screen"
  ```

  For executing a Python script (`script.py`).

- **Custom Shell Script**:

  ```
  ./restart-monitor.sh "./run.sh" "custom-shell-screen"
  ```

  For a custom shell script (`run.sh`).

## Setting Up a Crontab Job

To ensure the script runs at regular intervals (e.g., every 30 minutes), set up a crontab job.

1. **Edit Crontab File**:

   Use `crontab -e` to edit the crontab file for the current user.

2. **Add Crontab Entry**:

   ```
   */30 * * * * /path/to/restart-monitor.sh >> /path/to/logs/restart-monitor.log 2>&1
   ```

   Replace `/path/to/restart-monitor.sh` and `/path/to/logs/restart-monitor.log` with the actual paths to the script and the log file, respectively.

## Log File

The script outputs logs to a specified file, making it easy to track its activity and diagnose any issues.
