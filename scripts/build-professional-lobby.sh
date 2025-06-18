#!/bin/bash

# Professional Lobby Building Script
# This script builds a complete professional lobby with WorldEdit commands

echo "Building Professional Lobby..."

# Function to execute RCON command
execute_command() {
    local cmd="$1"
    echo "Executing: $cmd"
    docker exec docker-minecraft-server-mc-1 rcon-cli "$cmd"
    sleep 1
}

# Teleport to lobby and prepare
echo "=== Preparing Lobby World ==="
execute_command "mv tp console lobby"
execute_command "tp @a 0 100 0"
execute_command "time set day"
execute_command "weather clear"
execute_command "gamerule doDaylightCycle false"
execute_command "gamerule doWeatherCycle false"

# Clear the area first
echo "=== Clearing Build Area ==="
execute_command "fill -100 50 -100 100 90 100 air"

# Build the foundation platform
echo "=== Building Foundation ==="
execute_command "fill -50 60 -50 50 60 50 polished_blackstone"
execute_command "fill -45 61 -45 45 61 45 stone_bricks"

# Build central spawn platform
echo "=== Building Central Spawn Platform ==="
# Circular platform (approximated with squares)
execute_command "fill -10 64 -10 10 64 10 polished_blackstone"
execute_command "fill -8 64 -8 8 64 8 gold_block"
execute_command "fill -6 64 -6 6 64 6 polished_blackstone"

# Compass rose design
execute_command "fill -1 64 -6 1 64 6 gold_block"
execute_command "fill -6 64 -1 6 64 1 gold_block"

# Spawn point beacon
execute_command "setblock 0 63 0 beacon"
execute_command "fill -1 62 -1 1 62 1 iron_block"

# Glass dome over spawn
echo "=== Building Glass Dome ==="
execute_command "fill -12 65 -12 12 65 12 glass"
execute_command "fill -10 66 -10 10 66 10 glass"
execute_command "fill -8 67 -8 8 67 8 glass"
execute_command "fill -6 68 -6 6 68 6 glass"
execute_command "fill -4 69 -4 4 69 4 glass"
execute_command "fill -2 70 -2 2 70 2 glass"
execute_command "setblock 0 71 0 glass"

# Build pathways to game areas
echo "=== Building Pathways ==="
# North path (to Survival)
execute_command "fill -2 64 -25 2 64 -11 stone_bricks"
execute_command "fill -1 64 -25 1 64 -11 polished_andesite"

# South path (to SkyWars)
execute_command "fill -2 64 11 2 64 25 stone_bricks"
execute_command "fill -1 64 11 1 64 25 polished_andesite"

# East path (to Creative)
execute_command "fill 11 64 -2 25 64 2 stone_bricks"
execute_command "fill 11 64 -1 25 64 1 polished_andesite"

# West path (to Mini-Games)
execute_command "fill -25 64 -2 -11 64 2 stone_bricks"
execute_command "fill -25 64 -1 -11 64 1 polished_andesite"

echo "Building script phase 1 completed!"
echo "Run build-lobby-structures.sh for buildings and details."
