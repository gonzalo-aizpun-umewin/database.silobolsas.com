#!/bin/bash

# ===============================================

# Local Variables
DB_HOST="localhost"
DB_NAME="silobolsas"
DB_USER="silobolsas"
DB_PASS="b64875d6039a6c4161a99e073210a3b4"

# SQL folders
DIR_BASE="/var/www/database.silobolsas.com/install/base"
DIR_TABLES="/var/www/database.silobolsas.com/install/tables"
DIR_DUMMY="/var/www/database.silobolsas.com/install/dummy"


# ===============================================

# Go!
echo -e "Installing Database..."

# Create Database and Silobolsas User
mysql --defaults-extra-file=<(printf "[client]\nuser = %s\npassword = %s" "root" "${DB_PASS}") < "$DIR_BASE/install.sql"
echo -e "\033[0;32m✔\033[0m Database \033[33m$DB_NAME\e[0m created."
echo -e "\033[0;32m✔\033[0m User \033[33m$DB_USER\e[0m created."

# Create Tables
echo -e "\nCreating Tables..."

for file in $DIR_TABLES/*
do
    filename=$(basename $file)
    filename=${filename%.*}

    mysql --defaults-extra-file=<(printf "[client]\nuser = %s\npassword = %s" "${DB_USER}" "${DB_PASS}") < "$file"
    echo -e "\033[0;32m✔\033[0m \033[33m$filename\e[0m table created."
done

# Insert Dummy Data
echo -e "\nInserting Dummy Data..."

for file in $DIR_DUMMY/*
do
    filename=$(basename $file)
    filename=${filename%.*}

    mysql --defaults-extra-file=<(printf "[client]\nuser = %s\npassword = %s" "${DB_USER}" "${DB_PASS}") < "$file"
    echo -e "\033[0;32m✔\033[0m dummy data for \033[33m$filename\e[0m inserted."
done
