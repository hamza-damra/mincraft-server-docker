#!/bin/bash

# Setup script for AuthMe authentication database tables
# This script creates the necessary tables for the Minecraft AuthMe plugin

echo "Setting up AuthMe authentication database tables..."

# Database connection details (matching your AuthMe config)
DB_HOST="db"
DB_PORT="3306"
DB_NAME="minecraft-abusaker"
DB_USER="hamza"
DB_PASS="Hh@#2021"

# Wait for database to be ready
echo "Waiting for database to be ready..."
until docker exec $(docker ps -qf "name=db") mysqladmin ping -h"$DB_HOST" --silent; do
    echo "Waiting for database connection..."
    sleep 2
done

echo "Database is ready. Creating tables..."

# Execute the SQL script
docker exec -i $(docker ps -qf "name=db") mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < database/create_auth_tables.sql

if [ $? -eq 0 ]; then
    echo "✅ AuthMe authentication tables created successfully!"
    echo ""
    echo "Tables created:"
    echo "  - authme: Main authentication table for AuthMe plugin"
    echo "  - users: Additional user data and statistics"
    echo "  - player_sessions: Session management (optional)"
    echo "  - login_attempts: Security logging (optional)"
    echo ""
    echo "Your Minecraft server is now ready to use AuthMe authentication!"
else
    echo "❌ Error creating tables. Please check the database connection and try again."
    exit 1
fi
