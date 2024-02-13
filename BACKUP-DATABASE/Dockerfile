# Use a base image with necessary tools
FROM postgres:latest

# Install requirement and PostgreSQL client
RUN apt-get update && apt-get install -y \
    postgresql-client \
    curl \
    unzip \
    python3-pip \
    python3-dev \
    groff \
    less \
    && rm -rf /var/lib/apt/lists/*
# Install AWS CLI v2

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -f awscliv2.zip

#Set environment variables
#ENV PGUSER=
#ENV PGPASSWORD=
#ENV PGHOST=
#ENV PGPORT=
#ENV PGDATABASE=
#ENV AWS_ACCESS_KEY_ID=
#ENV AWS_SECRET_ACCESS_KEY=
#ENV BUCKET_NAME=del-db-backup/s6/s7auriole/
#ENV AWS_DEFAULT_REGION=us-east-1


# Create backup directory
run mkdir -p /backup
WORKDIR /backup
# Create backup script

COPY backup_script.sh /backup_script.sh
RUN chmod +x /backup_script.sh
COPY . .

# Set entry point
ENTRYPOINT ["/backup_script.sh"]

