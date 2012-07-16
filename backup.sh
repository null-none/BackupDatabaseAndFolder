#!/bin/bash

#source directory
SOURCE_DIRECTORY="/var/www/demo.loc/tm/images"  
#directory to backup                        
DIRECTORY_TO_BACKUP="/var/www/backup/"
#log file             
LOG_FILE="/var/www/backup/log/backup.log"                           

#backup mysql
mysqldump -uroot -p1234 trademac | gzip -c > ${DIRECTORY_TO_BACKUP}/mysql/$(date +%Y-%m-%d)_backup.sql.gz
echo $?
echo "`date` Finish backup mysql in $SOURCE_DIRECTORY/mysql" >> $LOG_FILE 

#backup images
tar -czPf ${DIRECTORY_TO_BACKUP}images/$(date +%Y-%m-%d)_images.tar.gz $SOURCE_DIRECTORY 
cp ${DIRECTORY_TO_BACKUP}images/$(date +%Y-%m-%d)_images.tar.gz
echo $?
echo "`date` Finish backup images in $SOURCE_DIRECTORY/images" >> $LOG_FILE 
