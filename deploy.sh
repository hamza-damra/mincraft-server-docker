#!/bin/bash

# One-Command Deploy Script for Minecraft Server with Authentication
# This script completely removes old setup and creates fresh containers

set -e

echo "🚀 Deploying Fresh Minecraft Server with Authentication..."
echo "========================================================"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Check Docker
log_info "Checking Docker..."
if ! docker info &> /dev/null; then
    log_error "Docker not running. Start Docker Desktop first!"
    exit 1
fi
log_success "Docker is running"

# Complete cleanup
log_info "Removing all old containers, volumes, and images..."
docker-compose down -v --remove-orphans 2>/dev/null || true
docker container prune -f
docker volume prune -f
docker rmi itzg/minecraft-server:latest 2>/dev/null || true
docker rmi mariadb:10.11 2>/dev/null || true
docker image prune -f
docker network prune -f
log_success "Cleanup complete"

# Pull fresh images
log_info "Pulling latest images..."
docker pull itzg/minecraft-server:latest
docker pull mariadb:10.11
log_success "Images pulled"

# Recreate directories
log_info "Setting up directories..."
rm -rf plugins/ config/ data/ 2>/dev/null || true
mkdir -p plugins/AuthMe plugins/Essentials plugins/WelcomeMessages config data
log_success "Directories ready"

# Start database first
log_info "Starting database..."
docker-compose up -d db

# Wait for database
log_info "Waiting for database to initialize..."
for i in {1..30}; do
    if docker-compose exec -T db mysqladmin ping -h localhost -u root -pminecraft_root_pass --silent 2>/dev/null; then
        break
    fi
    echo "   Database starting... ($i/30)"
    sleep 2
done
log_success "Database ready"

# Start Minecraft server
log_info "Starting Minecraft server..."
docker-compose up -d mc

# Wait for server
log_info "Waiting for Minecraft server to start..."
for i in {1..60}; do
    if docker-compose logs mc | grep -q "Done\|Timings Reset"; then
        break
    fi
    if [ $((i % 10)) -eq 0 ]; then
        echo "   Server starting... ($i/60)"
    fi
    sleep 3
done

# Check status
echo ""
log_success "Deployment complete!"
echo "========================================================"
docker-compose ps

echo ""
echo "🎮 Server Information:"
echo "   Address: localhost:25565"
echo "   Version: Minecraft 1.21.4"
echo "   Type: Paper with AuthMe"
echo ""
echo "📝 Player Commands:"
echo "   Register: /register <password> <password>"
echo "   Login:    /login <password>"
echo ""
echo "🔧 Management:"
echo "   Logs:     docker-compose logs -f mc"
echo "   Stop:     docker-compose down"
echo "   Restart:  docker-compose restart mc"
echo ""

# Show logs
log_info "Showing recent server logs..."
docker-compose logs --tail=20 mc

echo ""
log_success "Server is ready! Connect to localhost:25565"
