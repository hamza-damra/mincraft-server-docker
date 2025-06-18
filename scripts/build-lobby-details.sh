#!/bin/bash

# Lobby Details and Decorations Script
# This script adds professional decorations, lighting, and final touches

echo "Adding Professional Details to Lobby..."

# Function to execute RCON command
execute_command() {
    local cmd="$1"
    echo "Executing: $cmd"
    docker exec docker-minecraft-server-mc-1 rcon-cli "$cmd"
    sleep 1
}

echo "=== Adding Professional Buildings ==="

# Administration Building (30, 65, -30)
execute_command "fill 23 64 -37 37 64 -23 gray_concrete"
execute_command "fill 24 65 -36 36 75 -24 air"
# Modern office building structure
execute_command "fill 24 65 -36 36 65 -36 white_concrete"
execute_command "fill 24 65 -24 36 65 -24 white_concrete"
execute_command "fill 24 65 -36 24 65 -24 white_concrete"
execute_command "fill 36 65 -36 36 65 -24 white_concrete"
# Multiple floors
execute_command "fill 24 68 -36 36 68 -24 white_concrete"
execute_command "fill 24 71 -36 36 71 -24 white_concrete"
execute_command "fill 24 74 -36 36 74 -24 white_concrete"
# Windows
execute_command "fill 25 66 -36 35 67 -36 glass"
execute_command "fill 25 69 -36 35 70 -36 glass"
execute_command "fill 25 72 -36 35 73 -36 glass"
# Entrance
execute_command "fill 30 65 -24 30 67 -24 air"
execute_command "setblock 30 68 -23 oak_sign[rotation=0]{Text1:'{\"text\":\"Administration\",\"color\":\"dark_gray\",\"bold\":true}',Text2:'{\"text\":\"Staff Office\",\"color\":\"gray\"}',Text3:'{\"text\":\"Reports & Appeals\",\"color\":\"gray\"}',Text4:'{\"text\":\"Authorized Only\",\"color\":\"red\"}'}"

# Community Center (30, 65, 30)
execute_command "fill 23 64 23 37 64 37 brick"
execute_command "fill 24 65 24 36 72 36 air"
# Community hall structure
execute_command "fill 24 65 24 36 65 36 bricks"
execute_command "fill 24 65 24 36 70 24 bricks"
execute_command "fill 24 65 36 36 70 36 bricks"
execute_command "fill 24 65 24 24 70 36 bricks"
execute_command "fill 36 65 24 36 70 36 bricks"
# Arched roof
execute_command "fill 24 71 24 36 71 36 oak_planks"
# Large windows
execute_command "fill 25 66 24 35 69 24 glass"
execute_command "fill 25 66 36 35 69 36 glass"
execute_command "fill 24 66 25 24 69 35 glass"
execute_command "fill 36 66 25 36 69 35 glass"
# Main entrance
execute_command "fill 29 65 24 31 68 24 air"
execute_command "setblock 30 69 23 oak_sign[rotation=0]{Text1:'{\"text\":\"Community Center\",\"color\":\"dark_green\",\"bold\":true}',Text2:'{\"text\":\"Events & Meetings\",\"color\":\"green\"}',Text3:'{\"text\":\"Player Interaction\",\"color\":\"green\"}',Text4:'{\"text\":\"Welcome All!\",\"color\":\"yellow\"}'}"

# Shop/Economy Building (-30, 65, 30)
execute_command "fill -37 64 23 -23 64 37 stone_bricks"
execute_command "fill -36 65 24 -24 70 36 air"
# Market hall design
execute_command "fill -36 65 24 -24 65 36 stone_bricks"
execute_command "fill -36 65 24 -36 69 36 stone_bricks"
execute_command "fill -24 65 24 -24 69 36 stone_bricks"
execute_command "fill -36 65 24 -24 69 24 stone_bricks"
execute_command "fill -36 65 36 -24 69 36 stone_bricks"
# Market stalls inside
execute_command "fill -34 65 26 -32 66 28 oak_planks"
execute_command "fill -34 65 32 -32 66 34 oak_planks"
execute_command "fill -28 65 26 -26 66 28 oak_planks"
execute_command "fill -28 65 32 -26 66 34 oak_planks"
# Roof
execute_command "fill -37 70 23 -23 70 37 red_terracotta"
# Shop entrance
execute_command "fill -30 65 24 -30 67 24 air"
execute_command "setblock -30 68 23 oak_sign[rotation=0]{Text1:'{\"text\":\"Market Hall\",\"color\":\"gold\",\"bold\":true}',Text2:'{\"text\":\"Player Shops\",\"color\":\"yellow\"}',Text3:'{\"text\":\"Economy Center\",\"color\":\"yellow\"}',Text4:'{\"text\":\"Buy & Sell\",\"color\":\"green\"}'}"

echo "=== Adding Landscaping and Decorations ==="

# Gardens around spawn
execute_command "fill -15 64 -15 -11 64 -11 grass_block"
execute_command "fill 11 64 -15 15 64 -11 grass_block"
execute_command "fill -15 64 11 -11 64 15 grass_block"
execute_command "fill 11 64 11 15 64 15 grass_block"

# Trees
execute_command "setblock -13 65 -13 oak_log"
execute_command "fill -14 66 -14 -12 68 -12 oak_leaves"
execute_command "setblock 13 65 -13 oak_log"
execute_command "fill 12 66 -14 14 68 -12 oak_leaves"
execute_command "setblock -13 65 13 oak_log"
execute_command "fill -14 66 12 -12 68 14 oak_leaves"
execute_command "setblock 13 65 13 oak_log"
execute_command "fill 12 66 12 14 68 14 oak_leaves"

# Flowers
execute_command "setblock -12 65 -12 red_tulip"
execute_command "setblock -14 65 -12 yellow_tulip"
execute_command "setblock 12 65 -12 blue_orchid"
execute_command "setblock 14 65 -12 orange_tulip"

echo "=== Adding Professional Lighting ==="

# Lamp posts along pathways
execute_command "setblock -5 65 -15 iron_bars"
execute_command "setblock -5 66 -15 iron_bars"
execute_command "setblock -5 67 -15 glowstone"
execute_command "setblock 5 65 -15 iron_bars"
execute_command "setblock 5 66 -15 iron_bars"
execute_command "setblock 5 67 -15 glowstone"

execute_command "setblock -5 65 15 iron_bars"
execute_command "setblock -5 66 15 iron_bars"
execute_command "setblock -5 67 15 glowstone"
execute_command "setblock 5 65 15 iron_bars"
execute_command "setblock 5 66 15 iron_bars"
execute_command "setblock 5 67 15 glowstone"

execute_command "setblock -15 65 -5 iron_bars"
execute_command "setblock -15 66 -5 iron_bars"
execute_command "setblock -15 67 -5 glowstone"
execute_command "setblock 15 65 -5 iron_bars"
execute_command "setblock 15 66 -5 iron_bars"
execute_command "setblock 15 67 -5 glowstone"

execute_command "setblock -15 65 5 iron_bars"
execute_command "setblock -15 66 5 iron_bars"
execute_command "setblock -15 67 5 glowstone"
execute_command "setblock 15 65 5 iron_bars"
execute_command "setblock 15 66 5 iron_bars"
execute_command "setblock 15 67 5 glowstone"

# Hidden lighting under pathways
execute_command "fill -2 63 -25 2 63 -11 glowstone"
execute_command "fill -2 63 11 2 63 25 glowstone"
execute_command "fill 11 63 -2 25 63 2 glowstone"
execute_command "fill -25 63 -2 -11 63 2 glowstone"

echo "=== Setting Spawn Point ==="
execute_command "setworldspawn 0 65 0"
execute_command "spawnpoint @a 0 65 0"

echo "Professional lobby construction completed!"
echo "Your lobby now features:"
echo "  ✅ Central spawn platform with glass dome"
echo "  ✅ Four game portal areas with signs"
echo "  ✅ Information Center building"
echo "  ✅ Administration building"
echo "  ✅ Community Center"
echo "  ✅ Market Hall"
echo "  ✅ Professional landscaping"
echo "  ✅ Lighting system"
echo "  ✅ Clear pathways and navigation"
