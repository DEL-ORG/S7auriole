#!/bin/bash

# Create backup file 
 pg_dump -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE | gzip > /backup/db_backup.tar.gz


# Upload backup to AWS S3, del to auriole/ is your s3 bucket name
 aws s3 cp /backup/db_backup.tar.gz  s3://del-db-backup/S6/s7auriole/ 


