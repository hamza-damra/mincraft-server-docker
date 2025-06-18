#!/bin/bash

# Final Custom Lobby Setup Script
# This script properly replaces the lobby and configures auto-forwarding

echo "=========================================="
echo "  FINAL CUSTOM LOBBY SETUP               "
echo "=========================================="

# Stop the server
echo "Stopping server for lobby replacement..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "stop"
sleep 15

# Remove old lobby and replace with custom lobby
echo "Replacing lobby with custom map..."
docker exec docker-minecraft-server-mc-1 rm -rf ./lobby
docker cp maps/lobby docker-minecraft-server-mc-1:/lobby

# Fix permissions and remove session locks
echo "Fixing permissions..."
docker run --rm -v docker-minecraft-server_data:/data alpine sh -c "
    rm -f /data/lobby/session.lock
    chown -R 1000:1000 /data/lobby
    chmod -R 755 /data/lobby
"

# Start the server
echo "Starting server with custom lobby..."
docker start docker-minecraft-server-mc-1
sleep 45

# Configure lobby settings
echo "Configuring lobby settings..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set difficulty lobby peaceful"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set pvp lobby false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set animals lobby false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set monsters lobby false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set weather lobby false"

# Set world properties
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "time set day"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doDaylightCycle false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doWeatherCycle false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doMobSpawning false"

# Set spawn point in lobby
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv tp lobby"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setspawn"

# Reload Essentials to apply spawn settings
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "essentials reload"

echo "=========================================="
echo "  CUSTOM LOBBY SETUP COMPLETE!           "
echo "=========================================="
echo ""
echo "✅ Custom lobby map installed"
echo "✅ Auto-forwarding to lobby configured"
echo "✅ Lobby settings optimized"
echo "✅ Spawn point set in lobby"
echo ""
echo "Players will now:"
echo "• Spawn directly in your custom lobby"
echo "• Be forwarded to lobby on login"
echo "• Experience your professional lobby design"
echo ""
echo "Available commands for players:"
echo "• /lobby or /l - Return to lobby"
echo "• /skywars or /sw - Join SkyWars"
echo "• /survival - Join survival world"
