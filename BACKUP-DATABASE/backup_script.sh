#!/bin/bash

# Create backup file
pg_dump -h $PG_HOST -p $PG_PORT -U $PG_USERNAME -d $PG_DATABASE --password=$PG_PASSWORD | gzip > $BACKUP_DIR/backup_$(date +%Y%m%d%H%M%S).tar.gz

# Upload backup to AWS S3, del to auriole/ is your s3 bucket name
aws s3 cp $BACKUP_DIR/ s3://del-db-backup/s6/s7auriole/ --recursive

