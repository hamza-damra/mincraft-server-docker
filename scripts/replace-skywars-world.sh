#!/bin/bash

# Replace SkyWars World Script
# This script replaces the current SkyWars world with the new modern_skywar map

echo "=========================================="
echo "  REPLACING SKYWARS WITH MODERN MAP      "
echo "=========================================="

# Stop the server to safely replace world files
echo "Stopping Minecraft server..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "stop"

# Wait for server to stop
echo "Waiting for server to stop..."
sleep 10

# Remove old SkyWars worlds
echo "Removing old SkyWars worlds..."
docker exec docker-minecraft-server-mc-1 rm -rf /data/skywars_void
docker exec docker-minecraft-server-mc-1 rm -rf /data/skywars1
docker exec docker-minecraft-server-mc-1 rm -rf /data/skywars_arena1

# Copy the new modern_skywar map to the server data directory
echo "Copying modern_skywar map to server..."
docker cp maps/modern_skywar docker-minecraft-server-mc-1:/data/

# Rename the map to skywars_modern for consistency
echo "Setting up modern SkyWars world..."
docker exec docker-minecraft-server-mc-1 mv /data/modern_skywar /data/skywars_modern

# Set proper permissions
docker exec docker-minecraft-server-mc-1 chown -R minecraft:minecraft /data/skywars_modern

# Start the server
echo "Starting Minecraft server..."
docker start docker-minecraft-server-mc-1

# Wait for server to start
echo "Waiting for server to start..."
sleep 30

# Create the new world in Multiverse
echo "Creating modern SkyWars world in Multiverse..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv import skywars_modern normal"

# Configure world settings for SkyWars
echo "Configuring world settings..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set difficulty skywars_modern hard"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set pvp skywars_modern true"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set animals skywars_modern false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set monsters skywars_modern false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set weather skywars_modern false"

# Set world properties
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv tp skywars_modern"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "time set day"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doDaylightCycle false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doWeatherCycle false"

# Move player to the new world
echo "Moving player to modern SkyWars world..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv tp abusaker skywars_modern"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamemode creative abusaker"

echo "=========================================="
echo "  MODERN SKYWARS WORLD REPLACEMENT COMPLETE!"
echo "=========================================="
echo ""
echo "✅ Old SkyWars worlds removed"
echo "✅ Modern SkyWars map installed"
echo "✅ World configured for PvP battles"
echo "✅ Player moved to new world"
echo ""
echo "The modern SkyWars map is now active!"
echo "World name: skywars_modern"
echo "Player can explore the new professional map design!"
