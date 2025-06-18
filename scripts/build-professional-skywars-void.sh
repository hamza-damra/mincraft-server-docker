#!/bin/bash

# Professional SkyWars Arena Builder for Void World
# This script creates a professional SkyWars map from scratch in a blank void world

echo "=========================================="
echo "  BUILDING PROFESSIONAL SKYWARS IN VOID  "
echo "=========================================="

# Clear the entire area to create void (remove all terrain)
echo "Creating void world - clearing all terrain..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -100 0 -100 100 100 100 air"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -100 100 -100 100 200 100 air"

# Set world properties for sky battles
echo "Setting world properties for sky battles..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "time set day"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doDaylightCycle false"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "gamerule doWeatherCycle false"

# Create the main center platform (floating in void at Y=64)
echo "Building main center platform..."
# Base foundation
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -10 60 -10 10 62 10 stone_bricks"
# Decorative border
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -8 63 -8 8 63 8 chiseled_stone_bricks"
# Main platform
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -6 64 -6 6 64 6 polished_andesite"
# Center elevated area
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -3 65 -3 3 65 3 quartz_block"

# Add decorative pillars
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 4 64 4 4 68 4 quartz_pillar"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -4 64 4 -4 68 4 quartz_pillar"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 4 64 -4 4 68 -4 quartz_pillar"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -4 64 -4 -4 68 -4 quartz_pillar"

# Place premium center chests
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 0 66 0 chest[facing=north]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 2 66 0 chest[facing=west]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -2 66 0 chest[facing=east]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 0 66 2 chest[facing=south]"

# Add enchanting table and anvil
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 1 66 1 enchanting_table"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -1 66 -1 anvil[facing=north]"

# Create 8 themed floating spawn islands
echo "Building 8 themed floating spawn islands..."

# Island 1: Forest Theme (North) - Y=64, Distance=30
echo "Building Forest Island (North)..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -3 62 -33 3 64 -27 dirt"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -2 65 -32 2 65 -28 grass_block"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 0 66 -30 oak_log"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -1 67 -31 1 69 -29 oak_leaves"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 2 66 -30 chest[facing=west]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -2 66 -29 crafting_table"

# Island 2: Desert Theme (Northeast) - Y=64
echo "Building Desert Island (Northeast)..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 18 62 -25 24 64 -19 sandstone"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 19 65 -24 23 65 -20 sand"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 21 66 -22 cactus"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 21 67 -22 cactus"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 20 66 -22 chest[facing=east]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 22 66 -21 furnace[facing=west]"

# Island 3: Mountain Theme (East) - Y=64
echo "Building Mountain Island (East)..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 27 62 -3 33 64 3 stone"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 28 65 -2 32 65 2 cobblestone"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 30 66 0 iron_block"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 30 67 0 beacon"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 29 66 0 chest[facing=east]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 31 66 1 anvil[facing=north]"

# Island 4: Nether Theme (Southeast) - Y=64
echo "Building Nether Island (Southeast)..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 18 62 19 24 64 25 netherrack"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 19 65 20 23 65 24 nether_bricks"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 21 66 22 fire"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 20 66 22 chest[facing=east]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 22 66 23 brewing_stand"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 21 67 22 glowstone"

# Island 5: Ocean Theme (South) - Y=64
echo "Building Ocean Island (South)..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -3 62 27 3 64 33 prismarine"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -2 65 28 2 65 32 prismarine_bricks"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 0 66 30 sea_lantern"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 1 66 30 chest[facing=west]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -1 66 29 sponge"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 0 67 30 conduit"

# Island 6: Ice Theme (Southwest) - Y=64
echo "Building Ice Island (Southwest)..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -24 62 19 -18 64 25 packed_ice"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -23 65 20 -19 65 24 blue_ice"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -21 66 22 ice"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -20 66 22 chest[facing=east]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -22 66 23 snow_block"

# Island 7: End Theme (West) - Y=64
echo "Building End Island (West)..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -33 62 -3 -27 64 3 end_stone"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -32 65 -2 -28 65 2 end_stone_bricks"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -30 66 0 end_rod"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -29 66 0 chest[facing=east]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -31 66 1 ender_chest"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -30 67 0 dragon_head[facing=north]"

# Island 8: Jungle Theme (Northwest) - Y=64
echo "Building Jungle Island (Northwest)..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -24 62 -25 -18 64 -19 dirt"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -23 65 -24 -19 65 -20 grass_block"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -21 66 -22 jungle_log"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -22 67 -23 -20 69 -21 jungle_leaves"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -20 66 -22 chest[facing=east]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -22 66 -21 cocoa[age=2,facing=north]"

# Create 4 floating premium islands at higher altitude (Y=80)
echo "Building floating premium islands..."

# Gold Island (Northeast sky)
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 15 78 15 17 78 17 gold_block"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 16 79 16 chest[facing=north]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 16 80 16 beacon"

# Diamond Island (Northwest sky)
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -17 78 15 -15 78 17 diamond_block"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -16 79 16 chest[facing=north]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -16 80 16 beacon"

# Emerald Island (Southeast sky)
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 15 78 -17 17 78 -15 emerald_block"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 16 79 -16 chest[facing=north]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 16 80 -16 beacon"

# Iron Island (Southwest sky)
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -17 78 -17 -15 78 -15 iron_block"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -16 79 -16 chest[facing=north]"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock -16 80 -16 beacon"

# Add connecting bridges (optional - for style)
echo "Adding decorative sky bridges..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 8 64 0 12 64 0 glass"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -12 64 0 -8 64 0 glass"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 0 64 8 0 64 12 glass"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill 0 64 -12 0 64 -8 glass"

# Create world border and death barrier
echo "Setting up world boundaries..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "worldborder center 0 0"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "worldborder set 150"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -75 30 -75 75 35 75 barrier"

# Add central sky beacon
echo "Adding central sky beacon..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "setblock 0 90 0 beacon"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -1 89 -1 1 89 1 netherite_block"

echo "=========================================="
echo "  PROFESSIONAL SKYWARS VOID MAP COMPLETE!"
echo "=========================================="
echo ""
echo "🏆 ARENA FEATURES:"
echo "✓ Completely void world (no terrain)"
echo "✓ Multi-level center platform with premium loot"
echo "✓ 8 themed floating spawn islands:"
echo "  🌲 Forest (North) - Oak trees & crafting"
echo "  🏜️ Desert (Northeast) - Cactus & furnace"
echo "  ⛰️ Mountain (East) - Iron & beacon"
echo "  🔥 Nether (Southeast) - Fire & brewing"
echo "  🌊 Ocean (South) - Sea lantern & conduit"
echo "  🧊 Ice (Southwest) - Packed ice & snow"
echo "  🌌 End (West) - End rod & dragon head"
echo "  🌿 Jungle (Northwest) - Jungle trees & cocoa"
echo "✓ 4 floating premium islands with beacons"
echo "✓ Glass bridges for style"
echo "✓ Central sky beacon"
echo "✓ World border (150 blocks)"
echo "✓ Death barriers below"
echo ""
echo "Ready for epic sky battles! 🏹⚔️"
