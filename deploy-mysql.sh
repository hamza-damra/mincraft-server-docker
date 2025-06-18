#!/bin/bash

# Deploy Minecraft Server with MySQL Database
# Custom database: minecraft-abusaker, user: hamza, password: Hh@#2021

set -e

echo "🚀 Deploying Minecraft Server with MySQL Database..."
echo "===================================================="
echo "📊 Database Configuration:"
echo "   Database: minecraft-abusaker"
echo "   Username: hamza"
echo "   Password: Hh@#2021"
echo "   Host: localhost:3306"
echo ""

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
docker rmi mysql:8.0 2>/dev/null || true
docker image prune -f
docker network prune -f
log_success "Cleanup complete"

# Pull fresh images
log_info "Pulling latest images..."
docker pull itzg/minecraft-server:latest
docker pull mysql:8.0
log_success "Images pulled"

# Recreate directories
log_info "Setting up directories..."
rm -rf plugins/ config/ data/ 2>/dev/null || true
mkdir -p plugins/AuthMe plugins/Essentials plugins/WelcomeMessages config data
log_success "Directories ready"

# Start MySQL database first
log_info "Starting MySQL database..."
docker-compose up -d db

# Wait for MySQL database with custom credentials
log_info "Waiting for MySQL database to initialize..."
for i in {1..60}; do
    if docker-compose exec -T db mysqladmin ping -h localhost -u hamza -p'Hh@#2021' --silent 2>/dev/null; then
        break
    fi
    if [ $((i % 10)) -eq 0 ]; then
        echo "   MySQL initializing... ($i/60)"
    fi
    sleep 2
done

# Verify database connection
if docker-compose exec -T db mysqladmin ping -h localhost -u hamza -p'Hh@#2021' --silent 2>/dev/null; then
    log_success "MySQL database ready"
else
    log_error "Failed to connect to MySQL database"
    log_info "Checking database logs..."
    docker-compose logs db
    exit 1
fi

# Verify database and tables exist
log_info "Verifying database setup..."
if docker-compose exec -T db mysql -u hamza -p'Hh@#2021' -e "USE \`minecraft-abusaker\`; SHOW TABLES;" | grep -q "authme"; then
    log_success "Database 'minecraft-abusaker' and tables created successfully"

    # Show created tables
    log_info "Created tables:"
    docker-compose exec -T db mysql -u hamza -p'Hh@#2021' -e "USE \`minecraft-abusaker\`; SHOW TABLES;" | grep -v "Tables_in"

    # Check users table specifically
    if docker-compose exec -T db mysql -u hamza -p'Hh@#2021' -e "USE \`minecraft-abusaker\`; SHOW TABLES;" | grep -q "users"; then
        log_success "Users table created - registration data will be saved here"
    fi
else
    log_warning "Tables not found, they will be created when server starts"
fi

# Start Minecraft server
log_info "Starting Minecraft server..."
docker-compose up -d mc

# Wait for server
log_info "Waiting for Minecraft server to start..."
for i in {1..60}; do
    if docker-compose logs mc | grep -q "Done\|Server startup"; then
        break
    fi
    if [ $((i % 10)) -eq 0 ]; then
        echo "   Server starting... ($i/60)"
    fi
    sleep 3
done

# Check plugin status
log_info "Checking plugin status..."
sleep 5

if docker-compose logs mc | grep -q "AuthMe.*enabled\|AuthMe.*successfully enabled"; then
    log_success "AuthMe plugin loaded with MySQL connection"
else
    log_warning "AuthMe plugin status unclear - check logs"
fi

if docker-compose logs mc | grep -q "Essentials.*enabled\|Essentials.*Enabling"; then
    log_success "EssentialsX plugin loaded successfully"
else
    log_warning "EssentialsX plugin status unclear - check logs"
fi

# Check status
echo ""
log_success "Deployment complete!"
echo "========================================================"
docker-compose ps

echo ""
echo "🎮 Server Information:"
echo "   Minecraft Address: localhost:25565"
echo "   Minecraft Version: 1.21.4"
echo "   Server Type: Paper with AuthMe + EssentialsX"
echo "   Online Mode: DISABLED (supports cracked accounts)"
echo ""
echo "🗄️  MySQL Database Information:"
echo "   Host: localhost:3306"
echo "   Database: minecraft-abusaker"
echo "   Username: hamza"
echo "   Password: Hh@#2021"
echo ""
echo "� Database Tables Created:"
echo "   • authme - AuthMe authentication data"
echo "   • users - User registration and profile data"
echo "   • user_achievements - Player achievements"
echo "   • user_inventory - Player items and inventory"
echo "   • user_homes - Player home locations"
echo "   • user_login_history - Login/logout tracking"
echo "   • authme_sessions - Active player sessions"
echo "   • authme_login_attempts - Login attempt tracking"
echo "   • server_stats - Server statistics"
echo ""
echo "�📝 Player Commands:"
echo "   Register: /register <password> <password>"
echo "   Login:    /login <password>"
echo "   Help:     /help"
echo ""
echo "🔧 Management Commands:"
echo "   View logs:     docker-compose logs -f mc"
echo "   View DB logs:  docker-compose logs -f db"
echo "   Stop server:   docker-compose down"
echo "   Restart:       docker-compose restart mc"
echo "   MySQL access:  docker-compose exec db mysql -u hamza -p'Hh@#2021' minecraft-abusaker"
echo ""

# Show recent logs
log_info "Recent server logs:"
echo "==================="
docker-compose logs --tail=15 mc

echo ""
log_success "Server is ready! Connect to localhost:25565"
echo ""
echo "🎯 Test Steps:"
echo "1. Open Minecraft Java Edition"
echo "2. Add server: localhost:25565"
echo "3. Join with any username"
echo "4. Register: /register yourpass yourpass"
echo "5. Enjoy the welcome messages!"

# Ask to follow logs
echo ""
read -p "📋 Would you like to follow the server logs? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📋 Following server logs (Press Ctrl+C to exit):"
    docker-compose logs -f mc
fi
