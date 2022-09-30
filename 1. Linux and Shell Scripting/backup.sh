#!/bin/bash
 
# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
 echo "backup.sh target_directory_name destination_directory_name"
 exit
fi
 
# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
 echo "Invalid directory path provided"
 exit
fi
 
# Set two variables equal to the values of the first and second command 
# line arguments 
targetDirectory=$1
destinationDirectory=$2
 
# Display the values of the two command line arguments in the terminal 
echo "Target directory: $targetDirectory"
echo "Backup destination: $destinationDirectory"
 
# Define a variable of the current timestamp expressed in seconds 
currentTS=`date +%s`
 
# Define a variable to store the name of the archived and compressed 
# backup file that the script will create
backupFileName="backup-$currentTS.tar.gz"
 
# We're going to:
 # 1: Go into the target directory
 # 2: Create the backup file
 # 3: Move the backup file to the destination directory
 
# To make things easier, we will define some useful variables...
 
# Define a variable with the absolute path of the current directory
origAbsPath=`pwd`
 
 # Define a variable with the value equal to the absolute path of the 
 # destination directory 
cd $destinationDirectory
destDirAbsPath=`pwd`
 
# change directories from the current working directory to the 
# target directory 
cd $origAbsPath
cd $targetDirectory
 
# Define a numerical variable as a timestamp 24 hours prior to the current
# timestamp
yesterdayTS=$(($currentTS - 24 * 60 * 60))
 
# Declare a variable which is an array 
declare -a toBackup
 
# append values to an array
# myArray+=($myVariable)
for file in $(ls) # write a command that will return all files and 
# directories in the current folder
do
 # Get the last modified date of a file in seconds 
 if ((`date -r $file +%s` > $yesterdayTS))
 then
   toBackup+=($file)
 fi
done
 
# compress and archive the files
tar -czvf $backupFileName ${toBackup[@]}
# move the file backupfilename to the destination directory located at 
# destabspath
mv $backupFileName $destDirAbsPath

