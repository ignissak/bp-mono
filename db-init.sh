#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$DATABASE_USERNAME" --dbname "$DATABASE_NAME" <<-EOSQL
    CREATE DATABASE "$DATABASE_NAME_FRONTEND";
    
    -- Grant privileges to the specified user for all databases
    GRANT ALL PRIVILEGES ON DATABASE "$DATABASE_NAME_FRONTEND" TO "$DATABASE_USERNAME";
EOSQL