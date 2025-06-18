#!/bin/bash

# Lobby NPCs and Interactive Elements Setup
# This script creates NPCs, interactive signs, and teleportation systems

echo "Setting up Interactive Lobby Elements..."

# Function to execute RCON command
execute_command() {
    local cmd="$1"
    echo "Executing: $cmd"
    docker exec docker-minecraft-server-mc-1 rcon-cli "$cmd"
    sleep 1
}

echo "=== Creating Interactive Signs ==="

# Central Game Selector Sign
execute_command "setblock 0 66 0 oak_sign[rotation=0]{Text1:'{\"text\":\"Game Selector\",\"color\":\"gold\",\"bold\":true}',Text2:'{\"text\":\"Choose Your Adventure\",\"color\":\"yellow\"}',Text3:'{\"text\":\"Click portals to travel\",\"color\":\"gray\"}',Text4:'{\"text\":\"Welcome to the server!\",\"color\":\"green\"}'}"

# Information Signs for each portal area
echo "=== Setting up Portal Information ==="

# Survival Portal Information
execute_command "setblock -2 65 -25 oak_sign[rotation=8]{Text1:'{\"text\":\"Survival Mode\",\"color\":\"green\",\"bold\":true}',Text2:'{\"text\":\"Build, Mine, Survive\",\"color\":\"dark_green\"}',Text3:'{\"text\":\"Difficulty: Easy\",\"color\":\"yellow\"}',Text4:'{\"text\":\"Click to Enter\",\"color\":\"blue\"}'}"
execute_command "setblock 2 65 -25 oak_sign[rotation=8]{Text1:'{\"text\":\"Features:\",\"color\":\"green\",\"bold\":true}',Text2:'{\"text\":\"• PvP Enabled\",\"color\":\"red\"}',Text3:'{\"text\":\"• Economy System\",\"color\":\"gold\"}',Text4:'{\"text\":\"• Player Homes\",\"color\":\"blue\"}'}"

# SkyWars Portal Information  
execute_command "setblock -2 65 25 oak_sign[rotation=0]{Text1:'{\"text\":\"SkyWars Arena\",\"color\":\"blue\",\"bold\":true}',Text2:'{\"text\":\"Battle in the Sky\",\"color\":\"dark_blue\"}',Text3:'{\"text\":\"Last Player Standing\",\"color\":\"red\"}',Text4:'{\"text\":\"Click to Join\",\"color\":\"aqua\"}'}"
execute_command "setblock 2 65 25 oak_sign[rotation=0]{Text1:'{\"text\":\"Game Info:\",\"color\":\"blue\",\"bold\":true}',Text2:'{\"text\":\"• 12 Players Max\",\"color\":\"yellow\"}',Text3:'{\"text\":\"• 5 Minute Rounds\",\"color\":\"green\"}',Text4:'{\"text\":\"• Rewards Winner\",\"color\":\"gold\"}'}"

# Creative Portal Information
execute_command "setblock 25 65 -2 oak_sign[rotation=4]{Text1:'{\"text\":\"Creative World\",\"color\":\"yellow\",\"bold\":true}',Text2:'{\"text\":\"Build Anything\",\"color\":\"gold\"}',Text3:'{\"text\":\"Unlimited Resources\",\"color\":\"green\"}',Text4:'{\"text\":\"Click to Build\",\"color\":\"blue\"}'}"
execute_command "setblock 25 65 2 oak_sign[rotation=4]{Text1:'{\"text\":\"Creative Features:\",\"color\":\"yellow\",\"bold\":true}',Text2:'{\"text\":\"• Fly Mode\",\"color\":\"aqua\"}',Text3:'{\"text\":\"• WorldEdit\",\"color\":\"light_purple\"}',Text4:'{\"text\":\"• Plot System\",\"color\":\"green\"}'}"

# Mini-Games Portal Information
execute_command "setblock -25 65 -2 oak_sign[rotation=12]{Text1:'{\"text\":\"Mini-Games\",\"color\":\"aqua\",\"bold\":true}',Text2:'{\"text\":\"Fun Activities\",\"color\":\"light_purple\"}',Text3:'{\"text\":\"Coming Soon!\",\"color\":\"gold\"}',Text4:'{\"text\":\"Stay Tuned\",\"color\":\"gray\"}'}"
execute_command "setblock -25 65 2 oak_sign[rotation=12]{Text1:'{\"text\":\"Planned Games:\",\"color\":\"aqua\",\"bold\":true}',Text2:'{\"text\":\"• Parkour\",\"color\":\"green\"}',Text3:'{\"text\":\"• Spleef\",\"color\":\"yellow\"}',Text4:'{\"text\":\"• Hide & Seek\",\"color\":\"blue\"}'}"

echo "=== Creating Information Center Content ==="

# Inside Information Center
execute_command "setblock -30 66 -30 oak_sign[rotation=0]{Text1:'{\"text\":\"Server Rules\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"1. No Griefing\",\"color\":\"red\"}',Text3:'{\"text\":\"2. Be Respectful\",\"color\":\"green\"}',Text4:'{\"text\":\"3. No Cheating\",\"color\":\"red\"}'}"

execute_command "setblock -32 66 -30 oak_sign[rotation=0]{Text1:'{\"text\":\"More Rules:\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"4. No Spam\",\"color\":\"red\"}',Text3:'{\"text\":\"5. English Only\",\"color\":\"yellow\"}',Text4:'{\"text\":\"6. Have Fun!\",\"color\":\"green\"}'}"

execute_command "setblock -28 66 -30 oak_sign[rotation=0]{Text1:'{\"text\":\"Staff Contact\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"Need Help?\",\"color\":\"yellow\"}',Text3:'{\"text\":\"Use /helpop\",\"color\":\"green\"}',Text4:'{\"text\":\"Or visit Discord\",\"color\":\"blue\"}'}"

execute_command "setblock -30 66 -32 oak_sign[rotation=8]{Text1:'{\"text\":\"Server Stats\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"Online: /list\",\"color\":\"green\"}',Text3:'{\"text\":\"Playtime: /playtime\",\"color\":\"yellow\"}',Text4:'{\"text\":\"Balance: /bal\",\"color\":\"gold\"}'}"

echo "=== Setting up Building Information ==="

# Administration Building
execute_command "setblock 29 66 -30 oak_sign[rotation=4]{Text1:'{\"text\":\"Report System\",\"color\":\"dark_gray\",\"bold\":true}',Text2:'{\"text\":\"Report Players:\",\"color\":\"red\"}',Text3:'{\"text\":\"/report <player>\",\"color\":\"yellow\"}',Text4:'{\"text\":\"Staff will review\",\"color\":\"green\"}'}"

execute_command "setblock 31 66 -30 oak_sign[rotation=4]{Text1:'{\"text\":\"Appeals\",\"color\":\"dark_gray\",\"bold\":true}',Text2:'{\"text\":\"Banned? Appeal at:\",\"color\":\"red\"}',Text3:'{\"text\":\"our website\",\"color\":\"blue\"}',Text4:'{\"text\":\"or Discord\",\"color\":\"blue\"}'}"

# Community Center
execute_command "setblock 29 66 30 oak_sign[rotation=4]{Text1:'{\"text\":\"Events\",\"color\":\"dark_green\",\"bold\":true}',Text2:'{\"text\":\"Weekly Events:\",\"color\":\"green\"}',Text3:'{\"text\":\"Saturdays 8PM\",\"color\":\"yellow\"}',Text4:'{\"text\":\"Join the fun!\",\"color\":\"gold\"}'}"

execute_command "setblock 31 66 30 oak_sign[rotation=4]{Text1:'{\"text\":\"Community\",\"color\":\"dark_green\",\"bold\":true}',Text2:'{\"text\":\"Discord Server:\",\"color\":\"blue\"}',Text3:'{\"text\":\"discord.gg/server\",\"color\":\"aqua\"}',Text4:'{\"text\":\"Join us!\",\"color\":\"green\"}'}"

# Market Hall
execute_command "setblock -29 66 30 oak_sign[rotation=12]{Text1:'{\"text\":\"Player Shops\",\"color\":\"gold\",\"bold\":true}',Text2:'{\"text\":\"Rent a shop:\",\"color\":\"yellow\"}',Text3:'{\"text\":\"/shop rent\",\"color\":\"green\"}',Text4:'{\"text\":\"$1000/week\",\"color\":\"red\"}'}"

execute_command "setblock -31 66 30 oak_sign[rotation=12]{Text1:'{\"text\":\"Economy\",\"color\":\"gold\",\"bold\":true}',Text2:'{\"text\":\"Check balance:\",\"color\":\"yellow\"}',Text3:'{\"text\":\"/balance\",\"color\":\"green\"}',Text4:'{\"text\":\"Earn by playing!\",\"color\":\"blue\"}'}"

echo "=== Creating Direction Signs ==="

# Direction signs around spawn
execute_command "setblock 5 65 5 oak_sign[rotation=2]{Text1:'{\"text\":\"Directions\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"↑ Survival\",\"color\":\"green\"}',Text3:'{\"text\":\"→ Creative\",\"color\":\"yellow\"}',Text4:'{\"text\":\"↓ SkyWars\",\"color\":\"blue\"}'}"

execute_command "setblock -5 65 5 oak_sign[rotation=6]{Text1:'{\"text\":\"Buildings\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"← Mini-Games\",\"color\":\"aqua\"}',Text3:'{\"text\":\"↖ Info Center\",\"color\":\"gray\"}',Text4:'{\"text\":\"↙ Market\",\"color\":\"gold\"}'}"

execute_command "setblock 5 65 -5 oak_sign[rotation=14]{Text1:'{\"text\":\"Services\",\"color\":\"dark_blue\",\"bold\":true}',Text2:'{\"text\":\"↗ Admin\",\"color\":\"red\"}',Text3:'{\"text\":\"↘ Community\",\"color\":\"green\"}',Text4:'{\"text\":\"Commands: /help\",\"color\":\"yellow\"}'}"

execute_command "setblock -5 65 -5 oak_sign[rotation=10]{Text1:'{\"text\":\"Welcome!\",\"color\":\"gold\",\"bold\":true}',Text2:'{\"text\":\"New Player?\",\"color\":\"yellow\"}',Text3:'{\"text\":\"Visit Info Center\",\"color\":\"blue\"}',Text4:'{\"text\":\"Need help? /helpop\",\"color\":\"green\"}'}"

echo "Interactive elements setup completed!"
echo "Your lobby now has:"
echo "  ✅ Interactive portal signs"
echo "  ✅ Information center content"
echo "  ✅ Building information signs"
echo "  ✅ Direction and navigation signs"
echo "  ✅ Server rules and contact info"
echo "  ✅ Community and event information"
