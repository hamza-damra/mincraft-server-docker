#!/bin/bash

# Minecraft Server Startup Script with Authentication
# This script ensures proper startup order and configuration

set -e

echo "🎮 Starting Minecraft Server with Authentication System..."
echo "=================================================="

# Check if Docker and Docker Compose are available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed or not in PATH"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed or not in PATH"
    exit 1
fi

# Create necessary directories
echo "📁 Creating necessary directories..."
mkdir -p plugins/AuthMe
mkdir -p plugins/Essentials
mkdir -p plugins/WelcomeMessages
mkdir -p config
mkdir -p data

# Set proper permissions
chmod +x config/server-setup.sh 2>/dev/null || true

# Stop any existing containers
echo "🛑 Stopping existing containers..."
docker-compose down --remove-orphans

# Pull latest images
echo "📥 Pulling latest Docker images..."
docker-compose pull

# Start the database first
echo "🗄️  Starting database..."
docker-compose up -d db

# Wait for database to be ready
echo "⏳ Waiting for database to be ready..."
timeout=60
counter=0
while ! docker-compose exec -T db mysqladmin ping -h localhost -u authme -pauthme_pass --silent; do
    if [ $counter -eq $timeout ]; then
        echo "❌ Database failed to start within $timeout seconds"
        docker-compose logs db
        exit 1
    fi
    echo "   Database not ready yet... ($counter/$timeout)"
    sleep 2
    counter=$((counter + 1))
done

echo "✅ Database is ready!"

# Start the Minecraft server
echo "🎮 Starting Minecraft server..."
docker-compose up -d mc

# Wait for server to start
echo "⏳ Waiting for Minecraft server to start..."
timeout=120
counter=0
while ! docker-compose logs mc | grep -q "Done"; do
    if [ $counter -eq $timeout ]; then
        echo "❌ Minecraft server failed to start within $timeout seconds"
        echo "📋 Server logs:"
        docker-compose logs mc
        exit 1
    fi
    if [ $((counter % 10)) -eq 0 ]; then
        echo "   Server starting... ($counter/$timeout)"
    fi
    sleep 2
    counter=$((counter + 1))
done

echo "✅ Minecraft server is ready!"

# Show status
echo ""
echo "🎉 Server Status:"
echo "=================================================="
docker-compose ps

echo ""
echo "📊 Server Information:"
echo "=================================================="
echo "🌐 Server Address: localhost:25565"
echo "🎮 Minecraft Version: 1.21.4"
echo "🔧 Server Type: Paper"
echo "🔐 Authentication: AuthMe Reloaded"
echo "💬 Welcome Messages: Enabled"
echo "🗄️  Database: MariaDB"
echo "🎛️  RCON Port: 25575"

echo ""
echo "📝 Player Commands:"
echo "=================================================="
echo "New Players:"
echo "  /register <password> <confirmPassword>"
echo ""
echo "Returning Players:"
echo "  /login <password>"
echo ""
echo "Other Commands:"
echo "  /changepassword <old> <new>"
echo "  /help"
echo "  /rules"

echo ""
echo "🔧 Admin Commands:"
echo "=================================================="
echo "View logs:     docker-compose logs -f mc"
echo "Stop server:   docker-compose down"
echo "Restart:       docker-compose restart mc"
echo "RCON access:   docker-compose exec mc rcon-cli"

echo ""
echo "📚 Documentation:"
echo "=================================================="
echo "Setup Guide: ./AUTHENTICATION_SETUP.md"
echo "AuthMe Wiki: https://github.com/AuthMe/AuthMeReloaded/wiki"
echo "Paper Docs:  https://docs.papermc.io/"

echo ""
echo "✅ Server startup complete!"
echo "🎮 Players can now connect to localhost:25565"
echo ""

# Follow logs
read -p "📋 Would you like to follow the server logs? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📋 Following server logs (Press Ctrl+C to exit):"
    docker-compose logs -f mc
fi
