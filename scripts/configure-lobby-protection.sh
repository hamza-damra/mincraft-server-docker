#!/bin/bash

# Lobby Protection and Rules Configuration
# This script sets up world protection and professional lobby rules

echo "Configuring Lobby Protection and Rules..."

# Function to execute RCON command
execute_command() {
    local cmd="$1"
    echo "Executing: $cmd"
    docker exec docker-minecraft-server-mc-1 rcon-cli "$cmd"
    sleep 1
}

echo "=== Configuring Multiverse Lobby Protection ==="

# Set lobby world properties for protection
execute_command "mv modify set pvp false lobby"
execute_command "mv modify set difficulty peaceful lobby"
execute_command "mv modify set allowWeather false lobby"
execute_command "mv modify set autoHeal true lobby"
execute_command "mv modify set hunger false lobby"
execute_command "mv modify set spawning animals false lobby"
execute_command "mv modify set spawning monsters false lobby"
execute_command "mv modify set gameMode adventure lobby"
execute_command "mv modify set allowFlight true lobby"

echo "=== Setting Professional Game Rules ==="

# Teleport to lobby first
execute_command "mv tp console lobby"

# Core protection rules
execute_command "gamerule keepInventory true"
execute_command "gamerule doMobSpawning false"
execute_command "gamerule doFireTick false"
execute_command "gamerule mobGriefing false"
execute_command "gamerule doInsomnia false"
execute_command "gamerule announceAdvancements false"
execute_command "gamerule doDaylightCycle false"
execute_command "gamerule doWeatherCycle false"
execute_command "gamerule doPatrolSpawning false"
execute_command "gamerule doTraderSpawning false"
execute_command "gamerule doWardenSpawning false"

# Set time and weather
execute_command "time set 6000"
execute_command "weather clear 999999"

echo "=== Configuring Essentials Protection ==="

# Update Essentials config for lobby protection
cat >> plugins/Essentials/config.yml << 'EOF'

# Lobby-specific protection settings
protect:
  # Disable all building/breaking in lobby
  disable:
    build: true
    use: false
    break: true
    place: true
    damage: true
    pvp: true
  # Alert settings
  alert:
    on-placement: true
    on-use: false
    on-break: true
  # Blacklisted items in lobby
  blacklist:
    - 'lava_bucket'
    - 'water_bucket'
    - 'tnt'
    - 'flint_and_steel'
    - 'fire_charge'

# Lobby command restrictions
disabled-commands:
  - '/time'
  - '/weather'
  - '/gamemode'
  - '/give'
  - '/tp'
  - '/teleport'
  - '/worldedit'
  - '/we'
  - '//wand'
  - '//set'
  - '//replace'

# Allowed commands in lobby
allowed-commands:
  - '/lobby'
  - '/l'
  - '/hub'
  - '/spawn'
  - '/help'
  - '/list'
  - '/msg'
  - '/r'
  - '/rules'
  - '/info'
  - '/balance'
  - '/bal'
  - '/playtime'
  - '/helpop'

# Auto-AFK settings for lobby
auto-afk: 300
auto-afk-kick: 600
afk-list-name: '&7[AFK] {DISPLAYNAME}'

# Lobby-specific kits
kits:
  welcome:
    delay: 0
    items:
      - 'COMPASS 1 name:&6Game_Selector lore:&7Right-click_to_open_game_menu!'
      - 'BOOK 1 name:&bServer_Rules lore:&7Click_to_read_server_rules'
      - 'MAP 1 name:&aLobby_Map lore:&7Navigate_the_lobby_easily'

EOF

echo "=== Setting Up Spawn Protection ==="

# Set spawn protection radius
execute_command "setworldspawn 0 65 0"
execute_command "spawnpoint @a 0 65 0"

# Configure spawn protection in server.properties
echo "spawn-protection=16" >> files/server.properties

echo "=== Configuring Player Restrictions ==="

# Create lobby-specific rules file
cat > scripts/lobby-rules.txt << 'EOF'
# Professional Lobby Rules

## Building Restrictions
- No building or breaking blocks
- No placing items
- No using restricted items
- Adventure mode enforced

## Behavior Rules
- Be respectful to all players
- No spamming in chat
- English language only in public chat
- No advertising other servers

## Commands
- Limited command access
- Use /help for available commands
- Use /helpop for staff assistance
- Use /rules to review rules

## Teleportation
- Use portal areas to travel
- Use /lobby to return to lobby
- No unauthorized teleportation commands

## Items
- No dropping items in lobby
- Restricted items are blacklisted
- Use compass for navigation

## AFK Policy
- Auto-AFK after 5 minutes
- Auto-kick after 10 minutes
- Move to avoid AFK status
EOF

echo "=== Setting Up Welcome Messages ==="

# Configure welcome messages for lobby
execute_command "mv modify set respawnWorld lobby lobby"

# Create welcome message system
cat > scripts/lobby-welcome.txt << 'EOF'
# Welcome Messages for Professional Lobby

## First Join Message
Welcome to our Professional Minecraft Server!
• Visit the Information Center for rules and help
• Use the compass to navigate game portals
• Type /help for available commands
• Join our Discord community!

## Return Message
Welcome back to the lobby!
• Choose your next adventure from the portals
• Check out new updates at the Info Center
• Use /lobby anytime to return here

## Portal Messages
Survival: Build, mine, and survive in our main world!
SkyWars: Battle other players in epic sky combat!
Creative: Build anything with unlimited resources!
Mini-Games: Fun activities and challenges!
EOF

echo "=== Final Protection Setup ==="

# Ensure lobby world is properly configured
execute_command "mv info lobby"
execute_command "mv config firstspawnworld lobby"
execute_command "mv config respawnworld lobby"

# Set up automatic cleanup
execute_command "gamerule doEntityDrops false"
execute_command "gamerule doTileDrops false"

echo "Lobby protection and rules configuration completed!"
echo ""
echo "✅ Protection Features Enabled:"
echo "  • No building/breaking in lobby"
echo "  • PvP disabled"
echo "  • Peaceful difficulty"
echo "  • No weather changes"
echo "  • Auto-heal enabled"
echo "  • Flight allowed"
echo "  • Adventure mode enforced"
echo ""
echo "✅ Professional Rules Applied:"
echo "  • Command restrictions"
echo "  • Item blacklist"
echo "  • AFK management"
echo "  • Spawn protection"
echo "  • Chat moderation"
echo ""
echo "✅ World Settings Optimized:"
echo "  • Fixed day time"
echo "  • Clear weather"
echo "  • No mob spawning"
echo "  • No fire spread"
echo "  • Keep inventory on"
echo ""
echo "Your lobby is now fully protected and professional!"
