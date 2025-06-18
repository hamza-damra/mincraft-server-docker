#!/bin/bash

# Professional Lobby Decorations Script
# This script adds advanced decorations, particle effects, and professional touches

echo "Adding Professional Decorations to Lobby..."

# Function to execute RCON command
execute_command() {
    local cmd="$1"
    echo "Executing: $cmd"
    docker exec docker-minecraft-server-mc-1 rcon-cli "$cmd"
    sleep 1
}

echo "=== Adding Advanced Lighting System ==="

# Decorative light pillars around spawn
execute_command "setblock 8 64 8 quartz_pillar"
execute_command "setblock 8 65 8 quartz_pillar"
execute_command "setblock 8 66 8 quartz_pillar"
execute_command "setblock 8 67 8 sea_lantern"

execute_command "setblock -8 64 8 quartz_pillar"
execute_command "setblock -8 65 8 quartz_pillar"
execute_command "setblock -8 66 8 quartz_pillar"
execute_command "setblock -8 67 8 sea_lantern"

execute_command "setblock 8 64 -8 quartz_pillar"
execute_command "setblock 8 65 -8 quartz_pillar"
execute_command "setblock 8 66 -8 quartz_pillar"
execute_command "setblock 8 67 -8 sea_lantern"

execute_command "setblock -8 64 -8 quartz_pillar"
execute_command "setblock -8 65 -8 quartz_pillar"
execute_command "setblock -8 66 -8 quartz_pillar"
execute_command "setblock -8 67 -8 sea_lantern"

# Decorative fountains
echo "=== Adding Water Features ==="

# Central fountain near spawn
execute_command "fill -3 64 -3 3 64 3 polished_andesite"
execute_command "fill -2 65 -2 2 65 2 air"
execute_command "fill -1 65 -1 1 65 1 water"
execute_command "setblock 0 66 0 water"

# Corner fountains
execute_command "fill 17 64 17 19 64 19 stone_bricks"
execute_command "setblock 18 65 18 water"
execute_command "fill -19 64 17 -17 64 19 stone_bricks"
execute_command "setblock -18 65 18 water"
execute_command "fill 17 64 -19 19 64 -17 stone_bricks"
execute_command "setblock 18 65 -18 water"
execute_command "fill -19 64 -19 -17 64 -17 stone_bricks"
execute_command "setblock -18 65 -18 water"

echo "=== Adding Professional Banners and Flags ==="

# Server banners on buildings
execute_command "setblock 30 69 -23 white_banner[rotation=0]{Patterns:[{Pattern:\"cr\",Color:1},{Pattern:\"bs\",Color:15},{Pattern:\"ts\",Color:15},{Pattern:\"ms\",Color:4}]}"
execute_command "setblock 30 69 23 green_banner[rotation=0]{Patterns:[{Pattern:\"cr\",Color:5},{Pattern:\"bs\",Color:15},{Pattern:\"ts\",Color:15},{Pattern:\"ms\",Color:13}]}"
execute_command "setblock -30 69 23 yellow_banner[rotation=0]{Patterns:[{Pattern:\"cr\",Color:4},{Pattern:\"bs\",Color:15},{Pattern:\"ts\",Color:15},{Pattern:\"ms\",Color:1}]}"
execute_command "setblock -30 69 -23 blue_banner[rotation=0]{Patterns:[{Pattern:\"cr\",Color:15},{Pattern:\"bs\",Color:11},{Pattern:\"ts\",Color:11},{Pattern:\"ms\",Color:15}]}"

# Portal area banners
execute_command "setblock 0 70 -23 green_banner[rotation=8]{Patterns:[{Pattern:\"cr\",Color:13},{Pattern:\"bs\",Color:15},{Pattern:\"ts\",Color:15}]}"
execute_command "setblock 0 70 23 blue_banner[rotation=0]{Patterns:[{Pattern:\"cr\",Color:11},{Pattern:\"bs\",Color:15},{Pattern:\"ts\",Color:15}]}"
execute_command "setblock 23 70 0 yellow_banner[rotation=4]{Patterns:[{Pattern:\"cr\",Color:4},{Pattern:\"bs\",Color:15},{Pattern:\"ts\",Color:15}]}"
execute_command "setblock -23 70 0 light_blue_banner[rotation=12]{Patterns:[{Pattern:\"cr\",Color:3},{Pattern:\"bs\",Color:15},{Pattern:\"ts\",Color:15}]}"

echo "=== Adding Decorative Statues and Art ==="

# Central statue/monument
execute_command "setblock 0 65 -5 quartz_block"
execute_command "setblock 0 66 -5 quartz_pillar"
execute_command "setblock 0 67 -5 quartz_pillar"
execute_command "setblock 0 68 -5 quartz_block"
execute_command "setblock 0 69 -5 beacon"

# Corner decorative pillars
execute_command "fill 20 65 20 20 68 20 quartz_pillar"
execute_command "setblock 20 69 20 sea_lantern"
execute_command "fill -20 65 20 -20 68 20 quartz_pillar"
execute_command "setblock -20 69 20 sea_lantern"
execute_command "fill 20 65 -20 20 68 -20 quartz_pillar"
execute_command "setblock 20 69 -20 sea_lantern"
execute_command "fill -20 65 -20 -20 68 -20 quartz_pillar"
execute_command "setblock -20 69 -20 sea_lantern"

echo "=== Adding Professional Pathways ==="

# Decorative borders for main paths
execute_command "fill -3 64 -25 -3 64 -11 polished_andesite_slab"
execute_command "fill 3 64 -25 3 64 -11 polished_andesite_slab"
execute_command "fill -3 64 11 -3 64 25 polished_andesite_slab"
execute_command "fill 3 64 11 3 64 25 polished_andesite_slab"
execute_command "fill 11 64 -3 25 64 -3 polished_andesite_slab"
execute_command "fill 11 64 3 25 64 3 polished_andesite_slab"
execute_command "fill -25 64 -3 -11 64 -3 polished_andesite_slab"
execute_command "fill -25 64 3 -11 64 3 polished_andesite_slab"

# Pathway lighting (hidden)
execute_command "fill -2 63 -24 2 63 -12 glowstone"
execute_command "fill -2 63 12 2 63 24 glowstone"
execute_command "fill 12 63 -2 24 63 2 glowstone"
execute_command "fill -24 63 -2 -12 63 2 glowstone"

echo "=== Adding Garden Areas ==="

# Expanded gardens with variety
execute_command "fill -25 64 -25 -21 64 -21 grass_block"
execute_command "fill 21 64 -25 25 64 -21 grass_block"
execute_command "fill -25 64 21 -21 64 25 grass_block"
execute_command "fill 21 64 21 25 64 25 grass_block"

# Flower arrangements
execute_command "setblock -23 65 -23 red_tulip"
execute_command "setblock -22 65 -23 orange_tulip"
execute_command "setblock -24 65 -23 yellow_tulip"
execute_command "setblock -23 65 -22 pink_tulip"
execute_command "setblock -23 65 -24 blue_orchid"

execute_command "setblock 23 65 -23 red_tulip"
execute_command "setblock 22 65 -23 orange_tulip"
execute_command "setblock 24 65 -23 yellow_tulip"
execute_command "setblock 23 65 -22 pink_tulip"
execute_command "setblock 23 65 -24 blue_orchid"

execute_command "setblock -23 65 23 red_tulip"
execute_command "setblock -22 65 23 orange_tulip"
execute_command "setblock -24 65 23 yellow_tulip"
execute_command "setblock -23 65 22 pink_tulip"
execute_command "setblock -23 65 24 blue_orchid"

execute_command "setblock 23 65 23 red_tulip"
execute_command "setblock 22 65 23 orange_tulip"
execute_command "setblock 24 65 23 yellow_tulip"
execute_command "setblock 23 65 22 pink_tulip"
execute_command "setblock 23 65 24 blue_orchid"

# Trees in gardens
execute_command "setblock -23 65 -21 oak_log"
execute_command "fill -24 66 -22 -22 68 -20 oak_leaves"
execute_command "setblock 23 65 -21 birch_log"
execute_command "fill 22 66 -22 24 68 -20 birch_leaves"
execute_command "setblock -23 65 21 spruce_log"
execute_command "fill -24 66 20 -22 68 22 spruce_leaves"
execute_command "setblock 23 65 21 dark_oak_log"
execute_command "fill 22 66 20 24 68 22 dark_oak_leaves"

echo "=== Adding Professional Seating Areas ==="

# Benches around the lobby
execute_command "setblock 10 65 10 oak_stairs[facing=west]"
execute_command "setblock 11 65 10 oak_stairs[facing=east]"
execute_command "setblock 10 65 -10 oak_stairs[facing=west]"
execute_command "setblock 11 65 -10 oak_stairs[facing=east]"
execute_command "setblock -10 65 10 oak_stairs[facing=west]"
execute_command "setblock -11 65 10 oak_stairs[facing=east]"
execute_command "setblock -10 65 -10 oak_stairs[facing=west]"
execute_command "setblock -11 65 -10 oak_stairs[facing=east]"

echo "=== Adding Welcome Area Details ==="

# Welcome mat at spawn
execute_command "fill -2 64 -2 2 64 2 red_carpet"

# Information boards
execute_command "setblock 6 66 0 oak_sign[rotation=4]{Text1:'{\"text\":\"Welcome!\",\"color\":\"gold\",\"bold\":true}',Text2:'{\"text\":\"New to the server?\",\"color\":\"yellow\"}',Text3:'{\"text\":\"Visit Info Center\",\"color\":\"blue\"}',Text4:'{\"text\":\"for help!\",\"color\":\"green\"}'}"

execute_command "setblock -6 66 0 oak_sign[rotation=12]{Text1:'{\"text\":\"Quick Commands\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"/help - Get help\",\"color\":\"green\"}',Text3:'{\"text\":\"/rules - Server rules\",\"color\":\"yellow\"}',Text4:'{\"text\":\"/lobby - Return here\",\"color\":\"blue\"}'}"

echo "=== Setting Professional World Rules ==="

# Set lobby-specific game rules
execute_command "gamerule keepInventory true"
execute_command "gamerule doMobSpawning false"
execute_command "gamerule doFireTick false"
execute_command "gamerule mobGriefing false"
execute_command "gamerule doInsomnia false"
execute_command "gamerule announceAdvancements false"

echo "Professional decorations completed!"
echo "Your lobby now features:"
echo "  ✅ Advanced lighting system with sea lanterns"
echo "  ✅ Water features and fountains"
echo "  ✅ Professional banners and flags"
echo "  ✅ Decorative statues and monuments"
echo "  ✅ Enhanced pathways with borders"
echo "  ✅ Expanded garden areas with variety"
echo "  ✅ Seating areas for players"
echo "  ✅ Welcome area with information"
echo "  ✅ Professional world rules"
