#!/bin/bash

# Create backup file
 TIMESTAMP=$(date +%Y%m%d%H%M%S)
 BACKUP_FILE="/backup/db_backup_$TIMESTAMP.tar" 

#pg_dump -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE | gzip > /backup/db_backup.tar.gz
 pg_dump -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE --format=c --blobs > $BACKUP_FILE

# Upload backup to AWS S3, del to auriole/ is your s3 bucket name
# aws s3 cp /backup/db_backup.tar.gz  s3://del-db-backup/S6/s7auriole/ 
 aws s3 cp $BACKUP_FILE  s3://del-db-backup/S6/s7auriole/
 

