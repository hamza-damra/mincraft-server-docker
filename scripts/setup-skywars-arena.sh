#!/bin/bash

# Professional SkyWars Arena Setup Script
# This script creates an advanced SkyWars arena with professional design
# Features: Multi-level center island, decorative elements, varied terrain

echo "Setting up Professional SkyWars Arena..."

# Wait for server to be ready
sleep 10

# Set world properties and clear area
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "time set day"
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "weather clear"

# Clear the area first
echo "Clearing arena area..."
docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "fill -60 50 -60 60 120 60 air"

# Create professional center island (multi-level design)
echo "Creating professional center island..."

# Base level (stone foundation)
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -8 58 -8 8 60 8 stone"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -6 61 -6 6 61 6 cobblestone"

# Second level (grass platform)
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -5 62 -5 5 62 5 grass_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -4 63 -4 4 63 4 air"

# Third level (elevated center)
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -2 63 -2 2 63 2 stone_bricks"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -1 64 -1 1 64 1 air"

# Decorative pillars around center
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 3 63 3 3 66 3 stone_brick_stairs[facing=west]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -3 63 3 -3 66 3 stone_brick_stairs[facing=east]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 3 63 -3 3 66 -3 stone_brick_stairs[facing=west]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -3 63 -3 -3 66 -3 stone_brick_stairs[facing=east]"

# Place premium center chests with better positioning
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 0 64 0 chest[facing=north]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 1 64 0 chest[facing=west]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -1 64 0 chest[facing=east]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 0 64 1 chest[facing=south]"

# Add enchanting table and anvil for center island
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 2 64 2 enchanting_table"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -2 64 -2 anvil[facing=north]"

# Create professional player spawn islands (8 varied islands around center)
echo "Creating professional player spawn islands..."

# Island 1 (North) - Forest Theme
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -2 58 -27 2 60 -23 dirt"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -1 61 -26 1 61 -24 grass_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 0 62 -25 oak_log"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 0 63 -25 oak_leaves"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 0 64 -25 oak_leaves"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 1 62 -25 chest[facing=west]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -1 62 -24 crafting_table"

# Island 2 (Northeast) - Desert Theme
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 16 58 -19 20 60 -15 sandstone"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 17 61 -18 19 61 -16 sand"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 18 62 -17 cactus"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 18 63 -17 cactus"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 17 62 -17 chest[facing=east]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 19 62 -16 furnace[facing=west]"

# Island 3 (East) - Mountain Theme
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 22 58 -2 26 60 2 stone"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 23 61 -1 25 61 1 cobblestone"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 24 62 0 stone_bricks"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 24 63 0 iron_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 23 62 0 chest[facing=east]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 25 62 1 anvil[facing=north]"

# Island 4 (Southeast) - Nether Theme
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 16 58 15 20 60 19 netherrack"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 17 61 16 19 61 18 nether_bricks"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 18 62 17 fire"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 17 62 17 chest[facing=east]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 19 62 18 brewing_stand"

# Island 5 (South) - Ocean Theme
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -2 58 23 2 60 27 prismarine"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -1 61 24 1 61 26 prismarine_bricks"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 0 62 25 sea_lantern"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 1 62 25 chest[facing=west]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -1 62 24 sponge"

# Island 6 (Southwest) - Ice Theme
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -20 58 15 -16 60 19 packed_ice"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -19 61 16 -17 61 18 blue_ice"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -18 62 17 ice"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -17 62 17 chest[facing=east]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -19 62 18 snow_block"

# Island 7 (West) - End Theme
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -26 58 -2 -22 60 2 end_stone"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -25 61 -1 -23 61 1 end_stone_bricks"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -24 62 0 end_rod"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -23 62 0 chest[facing=east]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -25 62 1 ender_chest"

# Island 8 (Northwest) - Jungle Theme
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -20 58 -19 -16 60 -15 dirt"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -19 61 -18 -17 61 -16 grass_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -18 62 -17 jungle_log"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -18 63 -17 jungle_leaves"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -18 64 -17 jungle_leaves"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -17 62 -17 chest[facing=east]"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -19 62 -16 cocoa[age=2,facing=north]"

# Add floating mini-islands for extra loot
echo "Adding floating mini-islands..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 10 75 10 12 75 12 gold_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 11 76 11 chest[facing=north]"

rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -12 75 10 -10 75 12 diamond_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -11 76 11 chest[facing=north]"

rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 10 75 -12 12 75 -10 emerald_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock 11 76 -11 chest[facing=north]"

rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -12 75 -12 -10 75 -10 iron_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock -11 76 -11 chest[facing=north]"

# Create decorative sky structures
echo "Adding sky decorations..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill 0 85 0 0 90 0 beacon"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -1 84 -1 1 84 1 iron_block"

# Add floating rings around the arena
for i in {0..7}; do
    angle=$((i * 45))
    x=$((30 * $(echo "c($angle * 3.14159 / 180)" | bc -l | cut -d. -f1)))
    z=$((30 * $(echo "s($angle * 3.14159 / 180)" | bc -l | cut -d. -f1)))
    rcon-cli -H localhost -p 25575 -P minecraft_rcon "setblock $x 80 $z glowstone"
done

# Create world border and death barrier
echo "Setting world border and barriers..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "worldborder center 0 0"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "worldborder set 120"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "fill -60 45 -60 60 50 60 barrier"

# Set spawn points for SkyWars plugin with proper coordinates
echo "Configuring SkyWars arena..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw create arena1"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 1 0 62 -25"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 2 18 62 -17"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 3 24 62 0"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 4 18 62 17"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 5 0 62 25"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 6 -18 62 17"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 7 -24 62 0"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 8 -18 62 -17"

# Enable the arena
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw enable arena1"

echo "Professional SkyWars Arena setup complete!"
echo "Features added:"
echo "- Multi-level center island with decorative elements"
echo "- 8 themed spawn islands (Forest, Desert, Mountain, Nether, Ocean, Ice, End, Jungle)"
echo "- 4 floating mini-islands with premium loot"
echo "- Sky decorations and beacon"
echo "- Proper world border and death barriers"
echo "- Arena 'arena1' configured with 8 spawn points"
echo "Players can join using: /sw join arena1"

# Create world border
echo "Setting world border..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "worldborder center 0 0"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "worldborder set 100"

# Set spawn points for SkyWars plugin
echo "Setting up SkyWars arena configuration..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw create arena1"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 1 0 64 -24"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 2 18 64 -17"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 3 24 64 0"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 4 18 64 17"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 5 0 64 24"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 6 -18 64 17"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 7 -24 64 0"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw setspawn arena1 8 -18 64 -17"

# Enable the arena
rcon-cli -H localhost -p 25575 -P minecraft_rcon "sw enable arena1"

echo "SkyWars arena setup complete!"
echo "Arena 'arena1' has been created with 8 spawn points"
echo "Players can now join using /sw join arena1"
