# Use the official PostgreSQL image as the base image
FROM postgres:latest

# Environment variables for PostgreSQL
#ENV POSTGRES_USER=
#ENV POSTGRES_PASSWORD=
#ENV POSTGRES_DB=

# Copy SQL scripts to initialize the database
COPY init.sql /docker-entrypoint-initdb.d/init.sql


# Expose the default PostgreSQL port
EXPOSE 5432

