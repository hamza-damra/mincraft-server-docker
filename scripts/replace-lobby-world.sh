#!/bin/bash

# Replace Lobby World Script
# This script replaces the current lobby world with the new custom lobby map

echo "=========================================="
echo "  REPLACING LOBBY WITH CUSTOM MAP        "
echo "=========================================="

# Stop the server to safely replace world files
echo "Stopping Minecraft server..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "stop"

# Wait for server to stop
echo "Waiting for server to stop..."
sleep 15

# Backup the old lobby world
echo "Backing up old lobby world..."
docker exec docker-minecraft-server-mc-1 mv ./lobby ./lobby_backup_$(date +%Y%m%d_%H%M%S)

# Copy the new lobby map to the server data directory
echo "Copying new lobby map to server..."
docker cp maps/lobby docker-minecraft-server-mc-1:/lobby_new

# Move the new lobby to the correct location
echo "Setting up new lobby world..."
docker exec docker-minecraft-server-mc-1 mv ./lobby_new ./lobby

# Set proper permissions
docker exec docker-minecraft-server-mc-1 chown -R minecraft:minecraft ./lobby

# Start the server
echo "Starting Minecraft server..."
docker start docker-minecraft-server-mc-1

# Wait for server to start
echo "Waiting for server to start..."
sleep 30

# Reload Multiverse to recognize the new lobby
echo "Reloading Multiverse configuration..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv reload"

# Set lobby world properties
echo "Configuring lobby world settings..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set difficulty lobby peaceful"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set pvp lobby false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set animals lobby true"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set monsters lobby false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv modify set weather lobby false"

# Set world properties for lobby
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv tp lobby"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "time set day"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doDaylightCycle false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doWeatherCycle false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doMobSpawning false"

# Set the lobby as the main spawn world
echo "Setting lobby as main spawn world..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "mv set spawn lobby"

# Update Essentials spawn location
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setspawn"

echo "=========================================="
echo "  CUSTOM LOBBY WORLD REPLACEMENT COMPLETE!"
echo "=========================================="
echo ""
echo "✅ Old lobby world backed up"
echo "✅ New custom lobby map installed"
echo "✅ World configured for lobby use"
echo "✅ Spawn location updated"
echo "✅ Multiverse configuration reloaded"
echo ""
echo "The new custom lobby is now active!"
echo "World name: lobby"
echo "Features: Peaceful, no PvP, no monsters, permanent day"
echo ""
echo "Players will now spawn in your custom lobby design!"
