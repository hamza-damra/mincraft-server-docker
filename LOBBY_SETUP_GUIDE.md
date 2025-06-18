# Lobby System Setup Guide

This guide will help you set up the multi-world lobby system with Survival and SkyWars modes.

## Overview

The server now includes:
- **Lobby World**: A central hub where players spawn and select game modes
- **Survival World**: Traditional survival gameplay
- **SkyWars Arena**: PvP minigame with multiple arenas

## Initial Setup Steps

### 1. Start the Server
```bash
docker-compose up -d
```

### 2. Wait for Initial Setup
The server will automatically download and install all required plugins:
- Multiverse-Core (world management)
- Multiverse-Portals (portal creation)
- WorldEdit (world editing)
- SkyWars (minigame plugin)
- AuthMe (authentication)
- Essentials (basic commands)

### 3. Create Worlds
Once the server is running, execute the world setup script:
```bash
docker exec -it <container_name> bash /scripts/setup-worlds.sh
```

Or run the commands manually via RCON or in-game console.

### 4. Build the Lobby
Execute the lobby setup commands:
```bash
# Copy and paste commands from scripts/lobby-commands.txt
# Or run them via RCON
```

### 5. Set Up SkyWars Arena
Execute the SkyWars arena setup:
```bash
docker exec -it <container_name> bash /scripts/setup-skywars-arena.sh
```

### 6. Configure Permissions
Set up player permissions:
```bash
# Copy and paste commands from scripts/setup-permissions.txt
# Or configure via LuckPerms web editor
```

## World Configuration

### Lobby World
- **Type**: Flat world with stone/dirt/grass layers
- **Game Mode**: Adventure
- **PvP**: Disabled
- **Monsters**: Disabled
- **Weather**: Disabled
- **Features**: Game selection signs, spawn protection

### Survival World  
- **Type**: Default world generation
- **Game Mode**: Survival
- **PvP**: Enabled
- **Monsters**: Enabled
- **Weather**: Enabled
- **Features**: Full survival experience

### SkyWars Arena
- **Type**: Void world with custom islands
- **Game Mode**: Survival (during games)
- **PvP**: Enabled
- **Monsters**: Disabled
- **Weather**: Disabled
- **Features**: 8 spawn islands, center island with chests

## Player Experience

### New Player Flow
1. Player joins server
2. Spawns in lobby world
3. Receives compass (game selector)
4. Can click signs or use compass to select game mode
5. Gets teleported to chosen world

### Game Mode Selection
- **Survival Sign**: Teleports to survival world
- **SkyWars Sign**: Joins SkyWars queue
- **Lobby Sign**: Returns to lobby (available in other worlds)

## Admin Commands

### World Management
- `/mv create <world> <environment> <generator>` - Create new world
- `/mv tp <player> <world>` - Teleport player to world
- `/mv list` - List all worlds
- `/mv info <world>` - Get world information

### SkyWars Management
- `/sw create <arena>` - Create new arena
- `/sw setspawn <arena> <number>` - Set spawn point
- `/sw enable <arena>` - Enable arena
- `/sw disable <arena>` - Disable arena
- `/sw forcestart <arena>` - Force start game

### Player Management
- `/lp user <player> group add <group>` - Add player to group
- `/lp group <group> permission set <permission> <true/false>` - Set permissions

## Troubleshooting

### Common Issues

1. **Players spawn in wrong world**
   - Check Multiverse config: `/mvs config firstspawnworld lobby`
   - Verify lobby world exists: `/mv list`

2. **Signs not working**
   - Check Essentials signs.yml configuration
   - Verify player has sign use permissions

3. **SkyWars not starting**
   - Check arena configuration: `/sw info <arena>`
   - Verify minimum players setting
   - Check world exists and is loaded

4. **Permission issues**
   - Check LuckPerms groups: `/lp listgroups`
   - Verify player group: `/lp user <player> info`
   - Check specific permissions: `/lp user <player> permission check <permission>`

### Log Locations
- Server logs: `./logs/`
- Plugin logs: `./plugins/<plugin>/logs/`
- Database logs: Check MySQL container logs

## Customization

### Adding More Game Modes
1. Create new world with Multiverse
2. Configure world settings
3. Add teleportation signs in lobby
4. Set up appropriate permissions

### Modifying Lobby Design
1. Enter creative mode in lobby
2. Edit the lobby structure
3. Update sign locations in scripts
4. Test teleportation functionality

### SkyWars Arena Customization
1. Create new arena world
2. Build custom island layout
3. Configure arena in SkyWars plugin
4. Set spawn points and chest locations

## Backup and Maintenance

### Regular Backups
- World data: `./data/`
- Plugin configurations: `./plugins/`
- Database: MySQL container volume

### Updates
- Monitor plugin updates
- Test changes in development environment
- Backup before applying updates

## Support

For additional help:
1. Check plugin documentation
2. Review server logs for errors
3. Test commands in creative mode first
4. Use `/mv debug 3` for detailed Multiverse logging
