#!/bin/bash

# Check for the correct number of command-line arguments
if [[ $# != 2 ]]
then
  echo "Usage: backup.sh <target_directory_name> <destination_directory_name>"
  exit 1
fi

# Validate that both arguments are directories
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit 1
fi

# Assign command-line arguments to variables for better readability
targetDirectory=$1
destinationDirectory=$2

# Display the directories to be used for backup and destination
echo "Target Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

# Define a variable for the current timestamp
currentTS=$(date +%s)

# Define the backup file name using the current timestamp
backupFileName="backup-${currentTS}.tar.gz"

# Define a variable for the original directory's absolute path
origAbsPath=$(pwd)

# Change to the destination directory and capture its absolute path
cd "$destinationDirectory"
destDirAbsPath=$(pwd)

# Change back to the original directory, then change to the target directory
cd "$origAbsPath"
cd "$targetDirectory"

# Calculate the timestamp for 24 hours ago
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# Initialize an array to hold the list of files to backup
declare -a toBackup

# Populate the toBackup array with files modified in the last 24 hours
for file in $(ls)
do
  if [[ $(date -r "$file" +%s) -gt $yesterdayTS ]]
  then
    toBackup+=("$file")
  fi
done

# Create a compressed archive of the files to be backed up
tar -czvf "$backupFileName" "${toBackup[@]}"

# Move the backup archive to the destination directory
mv "$backupFileName" "$destDirAbsPath/"

echo "Backup completed successfully."


