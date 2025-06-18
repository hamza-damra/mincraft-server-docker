#!/bin/bash

# Setup Lobby Permissions Script
# This script ensures all players can access the lobby and use /mv tp lobby command

echo "Setting up lobby permissions..."

# Wait for server to be ready
sleep 30

# Function to execute RCON command
execute_command() {
    local cmd="$1"
    echo "Executing: $cmd"
    # Use RCON to execute the command
    # Replace with your RCON setup if different
    docker exec docker-minecraft-server-mc-1 rcon-cli "$cmd"
}

# Create default group if it doesn't exist
execute_command "lp creategroup default"

# Set critical lobby permissions for ALL players (including new/unregistered)
echo "Setting up critical lobby access permissions..."

# Allow access to lobby world
execute_command "lp group default permission set multiverse.access.lobby true"

# Allow teleportation to lobby - MULTIPLE permission nodes to ensure compatibility
execute_command "lp group default permission set multiverse.teleport.lobby true"
execute_command "lp group default permission set multiverse.core.tp.lobby true"
execute_command "lp group default permission set multiverse.core.teleport.lobby true"
execute_command "lp group default permission set multiverse.teleport.* true"

# Fix specific permission errors from the screenshot
execute_command "lp group default permission set multiverse.teleport.self.e true"
execute_command "lp group default permission set multiverse.teleport.other.e true"
execute_command "lp group default permission set multiverse.teleport.self.pl true"
execute_command "lp group default permission set multiverse.teleport.other.pl true"
execute_command "lp group default permission set multiverse.teleport.self.ca true"
execute_command "lp group default permission set multiverse.teleport.other.ca true"
execute_command "lp group default permission set multiverse.teleport.self.b true"
execute_command "lp group default permission set multiverse.teleport.other.b true"
execute_command "lp group default permission set multiverse.teleport.self.a true"
execute_command "lp group default permission set multiverse.teleport.other.a true"

# Wildcard permissions for all teleport types
execute_command "lp group default permission set multiverse.teleport.self.* true"
execute_command "lp group default permission set multiverse.teleport.other.* true"

# Allow basic lobby functionality
execute_command "lp group default permission set lobby.join true"
execute_command "lp group default permission set lobby.compass true"

# Allow essential commands
execute_command "lp group default permission set essentials.spawn true"
execute_command "lp group default permission set essentials.help true"
execute_command "lp group default permission set essentials.list true"

# Ensure default group is applied to all new players
execute_command "lp group default permission set luckperms.user.parent.add.player true"

# Set default group as primary for new players
execute_command "lp group default setweight 1"

# Set up spawn point in lobby
execute_command "mv set spawn lobby"
execute_command "spawn set lobby"

# Allow custom lobby commands
execute_command "lp group default permission set essentials.lobby true"
execute_command "lp group default permission set essentials.spawn true"
execute_command "lp group default permission set essentials.warp.lobby true"

echo "Lobby permissions setup completed!"
echo "Players can now use:"
echo "  - /lobby (custom command)"
echo "  - /l (short alias)"
echo "  - /hub (alternative)"
echo "  - /spawn (essentials spawn)"
echo "  - /mv tp lobby (multiverse command)"
