#!/bin/bash

# Lobby Structures Building Script
# This script builds the professional buildings and structures

echo "Building Lobby Structures..."

# Function to execute RCON command
execute_command() {
    local cmd="$1"
    echo "Executing: $cmd"
    docker exec docker-minecraft-server-mc-1 rcon-cli "$cmd"
    sleep 1
}

# Build Game Portal Areas
echo "=== Building Game Portal Areas ==="

# Survival Portal (North)
execute_command "fill -5 64 -30 5 64 -20 grass_block"
execute_command "fill -3 65 -28 3 68 -22 air"
execute_command "fill -3 65 -28 3 65 -22 oak_planks"
execute_command "fill -3 68 -28 3 68 -22 oak_planks"
execute_command "fill -3 65 -28 -3 68 -22 oak_planks"
execute_command "fill 3 65 -28 3 68 -22 oak_planks"
# Portal frame
execute_command "fill -2 66 -25 2 67 -25 obsidian"
execute_command "setblock 0 69 -25 oak_sign[rotation=8]{Text1:'{\"text\":\"Survival World\",\"color\":\"green\",\"bold\":true}',Text2:'{\"text\":\"Click to Enter\",\"color\":\"gray\"}',Text3:'{\"text\":\"Difficulty: Easy\",\"color\":\"yellow\"}',Text4:'{\"text\":\"/mv tp world\",\"color\":\"blue\"}'}"

# SkyWars Portal (South)
execute_command "fill -5 64 20 5 64 30 end_stone"
execute_command "fill -3 65 22 3 68 28 air"
execute_command "fill -3 65 22 3 65 28 quartz_block"
execute_command "fill -3 68 22 3 68 28 quartz_block"
execute_command "fill -3 65 22 -3 68 28 quartz_block"
execute_command "fill 3 65 22 3 68 28 quartz_block"
# Portal frame
execute_command "fill -2 66 25 2 67 25 obsidian"
execute_command "setblock 0 69 25 oak_sign[rotation=0]{Text1:'{\"text\":\"SkyWars Arena\",\"color\":\"blue\",\"bold\":true}',Text2:'{\"text\":\"Click to Enter\",\"color\":\"gray\"}',Text3:'{\"text\":\"PvP Combat\",\"color\":\"red\"}',Text4:'{\"text\":\"/mv tp skywars1\",\"color\":\"blue\"}'}"

# Creative Portal (East)
execute_command "fill 20 64 -5 30 64 5 wool"
execute_command "fill 22 65 -3 28 68 3 air"
execute_command "fill 22 65 -3 28 65 3 white_concrete"
execute_command "fill 22 68 -3 28 68 3 white_concrete"
execute_command "fill 22 65 -3 22 68 3 white_concrete"
execute_command "fill 28 65 -3 28 68 3 white_concrete"
# Portal frame
execute_command "fill 25 66 -2 25 67 2 obsidian"
execute_command "setblock 25 69 0 oak_sign[rotation=4]{Text1:'{\"text\":\"Creative World\",\"color\":\"yellow\",\"bold\":true}',Text2:'{\"text\":\"Click to Enter\",\"color\":\"gray\"}',Text3:'{\"text\":\"Build Freely\",\"color\":\"green\"}',Text4:'{\"text\":\"/gamemode creative\",\"color\":\"blue\"}'}"

# Mini-Games Portal (West)
execute_command "fill -30 64 -5 -20 64 5 prismarine"
execute_command "fill -28 65 -3 -22 68 3 air"
execute_command "fill -28 65 -3 -22 65 3 dark_prismarine"
execute_command "fill -28 68 -3 -22 68 3 dark_prismarine"
execute_command "fill -28 65 -3 -28 68 3 dark_prismarine"
execute_command "fill -22 65 -3 -22 68 3 dark_prismarine"
# Portal frame
execute_command "fill -25 66 -2 -25 67 2 obsidian"
execute_command "setblock -25 69 0 oak_sign[rotation=12]{Text1:'{\"text\":\"Mini-Games\",\"color\":\"aqua\",\"bold\":true}',Text2:'{\"text\":\"Click to Enter\",\"color\":\"gray\"}',Text3:'{\"text\":\"Fun Activities\",\"color\":\"light_purple\"}',Text4:'{\"text\":\"Coming Soon!\",\"color\":\"gold\"}'}"

echo "=== Building Information Center ==="
# Information Center (-30, 65, -30)
execute_command "fill -37 64 -37 -23 64 -23 polished_andesite"
execute_command "fill -36 65 -36 -24 72 -24 air"
# Walls
execute_command "fill -36 65 -36 -24 70 -36 quartz_block"
execute_command "fill -36 65 -24 -24 70 -24 quartz_block"
execute_command "fill -36 65 -36 -36 70 -24 quartz_block"
execute_command "fill -24 65 -36 -24 70 -24 quartz_block"
# Roof
execute_command "fill -37 71 -37 -23 71 -23 quartz_slab"
# Windows
execute_command "fill -35 66 -36 -25 69 -36 glass"
execute_command "fill -35 66 -24 -25 69 -24 glass"
# Door
execute_command "fill -30 65 -24 -30 66 -24 air"
# Sign
execute_command "setblock -30 67 -23 oak_sign[rotation=0]{Text1:'{\"text\":\"Information Center\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"Server Rules\",\"color\":\"blue\"}',Text3:'{\"text\":\"Player Stats\",\"color\":\"blue\"}',Text4:'{\"text\":\"News & Updates\",\"color\":\"blue\"}'}"

echo "Lobby structures phase completed!"
echo "Run build-lobby-details.sh for decorations and final touches."
