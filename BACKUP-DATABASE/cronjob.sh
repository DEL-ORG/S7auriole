#!/bin/bash

#RUN EVERY 3 MIN
*/3 * * * * /usr/bin/docker run -it   --env-file /student_home/S7auriole/BACKUP-DATABASE/env   attamegnon/attamegnon2022:backup_v1

