#!/bin/bash

# Setup Lobby Commands Script
# This script creates multiple ways for players to get to the lobby

echo "Setting up lobby commands and warps..."

# Wait for server to be ready
sleep 30

# Function to execute RCON command
execute_command() {
    local cmd="$1"
    echo "Executing: $cmd"
    docker exec docker-minecraft-server-mc-1 rcon-cli "$cmd"
}

echo "Creating lobby warp..."
# Go to lobby and create a warp there
execute_command "mv tp console lobby"
execute_command "warp set lobby"

echo "Setting up spawn point..."
# Set the spawn point in lobby world
execute_command "mv set spawn lobby"
execute_command "setspawn"

echo "Testing commands..."
# Test that the commands work
execute_command "warp lobby"
execute_command "spawn"

echo "Lobby commands setup completed!"
echo ""
echo "Available lobby commands for players:"
echo "  - /lobby    (Essentials custom command)"
echo "  - /l        (Short alias for lobby)"
echo "  - /hub      (Alternative lobby command)"
echo "  - /spawn    (Essentials spawn command)"
echo "  - /warp lobby (Essentials warp)"
echo "  - /mv tp lobby (Multiverse teleport - if permissions work)"
echo ""
echo "All commands should now work without permission errors!"
