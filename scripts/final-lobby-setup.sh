#!/bin/bash

echo "🎮 Final Lobby Setup - Configuring Signs and Commands"

# Function to run RCON commands
run_rcon() {
    docker exec docker-minecraft-server-mc-1 rcon-cli --host localhost --port 25575 --password minecraft_rcon "$1"
}

echo "📋 Setting up Essentials signs..."

# Configure survival sign
echo "Setting up Survival sign..."
run_rcon "data merge block 5 66 0 {Text1:'{\"text\":\"[Survival]\",\"color\":\"green\",\"bold\":true}',Text2:'{\"text\":\"Click to join\",\"color\":\"gray\"}',Text3:'{\"text\":\"Survival Mode\",\"color\":\"dark_green\"}',Text4:'{\"text\":\"\"}'}'"

# Configure SkyWars sign  
echo "Setting up SkyWars sign..."
run_rcon "data merge block -5 66 0 {Text1:'{\"text\":\"[SkyWars]\",\"color\":\"blue\",\"bold\":true}',Text2:'{\"text\":\"Click to join\",\"color\":\"gray\"}',Text3:'{\"text\":\"PvP Arena\",\"color\":\"dark_blue\"}',Text4:'{\"text\":\"\"}'}'"

# Configure welcome sign
echo "Setting up Welcome sign..."
run_rcon "data merge block 0 66 -5 {Text1:'{\"text\":\"Welcome to\",\"color\":\"gold\",\"bold\":true}',Text2:'{\"text\":\"Our Server!\",\"color\":\"gold\",\"bold\":true}',Text3:'{\"text\":\"Choose your\",\"color\":\"gray\"}',Text4:'{\"text\":\"game mode\",\"color\":\"gray\"}'}'"

echo "🔧 Configuring world settings..."

# Set lobby as first spawn world
run_rcon "mv config firstspawnworld lobby"

# Configure world aliases
run_rcon "mv modify set alias lobby lobby"
run_rcon "mv modify set alias survival survival"  
run_rcon "mv modify set alias skywars skywars1"

echo "⚙️ Setting up game rules..."

# Lobby game rules
run_rcon "gamerule keepInventory true"
run_rcon "gamerule mobGriefing false"
run_rcon "gamerule doFireTick false"

echo "✅ Lobby setup complete!"
echo ""
echo "🎯 What's been set up:"
echo "  ✅ Lobby world with game selection platform"
echo "  ✅ Survival world ready for gameplay"
echo "  ✅ SkyWars arena world created"
echo "  ✅ Game selection signs placed"
echo "  ✅ World settings configured"
echo "  ✅ Spawn system configured"
echo ""
echo "📝 Next steps for players:"
echo "  1. Join the server - you'll spawn in the lobby"
echo "  2. Click the [Survival] sign to go to survival mode"
echo "  3. Click the [SkyWars] sign to join SkyWars (when plugin is added)"
echo "  4. Use /lobby or /spawn to return to lobby anytime"
echo ""
echo "🔧 Admin commands:"
echo "  /mv tp <player> <world>  - Teleport player to world"
echo "  /mv list                 - List all worlds"
echo "  /mv info <world>         - Get world information"
echo "  /essentials reload       - Reload Essentials config"
echo ""
echo "🎮 Server is ready for players!"
