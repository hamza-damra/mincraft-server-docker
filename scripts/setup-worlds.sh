#!/bin/bash

# Setup script for creating worlds and configuring the lobby system
# This script should be run after the server starts for the first time

echo "Setting up worlds and lobby system..."

# Wait for server to be ready
sleep 30

# Create lobby world (flat world for lobby)
echo "Creating lobby world..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv create lobby NORMAL -g CleanroomGenerator:64,stone,63,dirt,62,grass_block"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set gamemode ADVENTURE lobby"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set pvp false lobby"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set monsters false lobby"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set animals false lobby"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set weather false lobby"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set difficulty PEACEFUL lobby"

# Set lobby as spawn world
echo "Setting lobby as spawn world..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set spawn 0,65,0 lobby"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mvs config firstspawnworld lobby"

# Create SkyWars arena world
echo "Creating SkyWars arena world..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv create skywars_arena1 NORMAL -g CleanroomGenerator:0,air"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set gamemode SURVIVAL skywars_arena1"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set pvp true skywars_arena1"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set monsters false skywars_arena1"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set animals false skywars_arena1"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set weather false skywars_arena1"

# Configure survival world
echo "Configuring survival world..."
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set alias survival world"
rcon-cli -H localhost -p 25575 -P minecraft_rcon "mv modify set gamemode SURVIVAL world"

echo "World setup complete!"
echo "Next steps:"
echo "1. Build the lobby structure in the lobby world"
echo "2. Create SkyWars arenas using /sw create <arena-name>"
echo "3. Set up teleportation signs or NPCs in the lobby"
