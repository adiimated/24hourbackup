# 24hourbackup

This Bash script provides a simple yet effective solution for backing up files that have been modified within the last 24 hours from a specified target directory to a destination directory. The backup file is created as a .tar.gz archive, ensuring that your backups are both space-efficient and secure.


## Installation

Download the Script: Clone this repository or download the script file directly to your local machine.
```
https://github.com/adiimated/24hourbackup.git
```

Make the Script Executable: Navigate to the script's directory and change its permissions to make it executable.
```
cd 24hourbackup
chmod +x backup.sh
```

## Usage

To run the script, use the following syntax:
```
./backup.sh [target_directory] [destination_directory]
```
Replace [target_directory] with the path to the directory you want to back up, and [destination_directory] with the path to the directory where the backup should be stored.

Example:
```
./backup.sh /path/to/documents /path/to/backup-destination
```
This command will create an archive of all files in /path/to/important-documents modified in the last 24 hours and place it in /path/to/backup-destination.
