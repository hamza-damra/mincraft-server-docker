# Professional SkyWars Arena Guide

## Overview
This guide covers the setup and features of the professional SkyWars arena designed for epic sky battles. The arena features themed islands, multi-level structures, and enhanced gameplay mechanics.

## Arena Features

### 🏰 Center Island (Multi-Level Design)
- **Base Level**: Stone foundation with cobblestone platform
- **Grass Level**: Main fighting area with decorative pillars
- **Premium Level**: Elevated center with 4 premium chests
- **Special Items**: Enchanting table and anvil for equipment upgrades
- **Sky Beacon**: Towering beacon visible from all islands

### 🏝️ Themed Spawn Islands (8 Unique Islands)

#### 1. Forest Island (North)
- **Theme**: Woodland survival
- **Materials**: Dirt, grass, oak logs and leaves
- **Special Items**: Crafting table, bow, arrows
- **Strategy**: Good for ranged combat preparation

#### 2. Desert Island (Northeast) 
- **Theme**: Arid survival
- **Materials**: Sandstone, sand, cactus
- **Special Items**: Furnace for smelting
- **Strategy**: Defensive position with cactus traps

#### 3. Mountain Island (East)
- **Theme**: Rocky highlands
- **Materials**: Stone, cobblestone, iron blocks
- **Special Items**: Anvil, iron ingots
- **Strategy**: Strong defensive materials

#### 4. Nether Island (Southeast)
- **Theme**: Hellish combat
- **Materials**: Netherrack, nether bricks
- **Special Items**: Fire charges, brewing stand
- **Strategy**: Aggressive fire-based combat

#### 5. Ocean Island (South)
- **Theme**: Aquatic warfare
- **Materials**: Prismarine, sea lanterns
- **Special Items**: Sponge, trident (rare)
- **Strategy**: Water-based tactics

#### 6. Ice Island (Southwest)
- **Theme**: Frozen wasteland
- **Materials**: Packed ice, blue ice, snow
- **Special Items**: Snowballs for knockback
- **Strategy**: Slippery terrain advantage

#### 7. End Island (West)
- **Theme**: Dimensional warfare
- **Materials**: End stone, end rods
- **Special Items**: Ender chest, ender pearls
- **Strategy**: Teleportation tactics

#### 8. Jungle Island (Northwest)
- **Theme**: Tropical combat
- **Materials**: Jungle logs, vines
- **Special Items**: Cocoa beans, enhanced bow
- **Strategy**: Stealth and archery

### 💎 Floating Premium Islands (4 Sky Fortresses)
- **Gold Island**: Northeast sky position with rare golden items
- **Diamond Island**: Northwest sky position with diamond gear
- **Emerald Island**: Southeast sky position with enchanted items
- **Iron Island**: Southwest sky position with utility items

## Gameplay Mechanics

### ⏱️ Game Phases
1. **Preparation Phase** (30 seconds): Grace period, no PvP
2. **Combat Phase** (5 minutes): Full PvP enabled
3. **Border Shrink** (5+ minutes): World border starts shrinking
4. **Deathmatch** (10+ minutes): Forced final battle

### 🎯 Victory Conditions
- **Primary**: Last player standing
- **Secondary**: Most kills if time limit reached
- **Spectator Mode**: Eliminated players can watch

### 📦 Loot Distribution
- **Island Chests**: Basic survival gear, themed items
- **Center Chests**: Premium weapons, armor, golden apples
- **Floating Chests**: Rare items, enchanted gear, totems
- **Refill System**: Chests refill every 3 minutes

## Deployment Instructions

### Quick Setup
```bash
# Make script executable
chmod +x scripts/deploy-professional-skywars.sh

# Deploy the arena
./scripts/deploy-professional-skywars.sh
```

### Manual Setup Steps
1. **Start Server**: Ensure Minecraft server is running
2. **Create World**: Generate void world for SkyWars
3. **Build Structures**: Run arena construction script
4. **Configure Plugin**: Set up SkyWars plugin settings
5. **Set Permissions**: Configure player access rights
6. **Add Lobby NPC**: Create teleport NPC in lobby
7. **Test Arena**: Verify all systems working

## Player Commands

### Basic Commands
- `/sw join arena1` - Join the SkyWars arena
- `/sw leave` - Leave current game
- `/sw spectate arena1` - Spectate ongoing game
- `/lobby` - Return to lobby

### Information Commands
- `/sw stats` - View your statistics
- `/sw top` - View leaderboards
- `/sw info arena1` - Arena information

## Admin Commands

### Arena Management
- `/sw list` - List all arenas
- `/sw info <arena>` - Detailed arena info
- `/sw forcestart <arena>` - Force start game
- `/sw stop <arena>` - Stop current game
- `/sw reload` - Reload plugin configuration

### Player Management
- `/sw kick <player>` - Remove player from game
- `/sw setspawn <arena> <id> <x> <y> <z>` - Set spawn point
- `/sw enable <arena>` - Enable arena
- `/sw disable <arena>` - Disable arena

## Configuration Files

### Arena Configuration (`plugins/SkyWars/arenas.yml`)
- Spawn point coordinates
- Game settings and timers
- World boundaries
- Special features

### Chest Configuration (`plugins/SkyWars/chests.yml`)
- Loot tables for each chest type
- Item probabilities and amounts
- Themed island loot
- Refill settings

### Main Configuration (`plugins/SkyWars/main-config.yml`)
- Global plugin settings
- Database configuration
- Economy integration
- Reward systems

## Troubleshooting

### Common Issues
1. **Arena not loading**: Check world generation settings
2. **Chests empty**: Verify loot table configuration
3. **Spawn points wrong**: Reconfigure spawn coordinates
4. **Plugin errors**: Check server logs and reload plugin

### Performance Optimization
- Limit concurrent games
- Regular world cleanup
- Monitor server resources
- Optimize chunk loading

## Tips for Epic Battles

### For Players
- **Early Game**: Secure island chest quickly
- **Mid Game**: Control center island for premium loot
- **Late Game**: Use floating islands for final gear
- **Strategy**: Master ender pearl usage for mobility

### For Admins
- **Balance**: Adjust loot tables based on gameplay
- **Events**: Host tournaments and competitions
- **Rewards**: Set up winner rewards and statistics
- **Community**: Create leaderboards and achievements

## Future Enhancements

### Planned Features
- Multiple arena variants
- Seasonal themed events
- Custom enchantments
- Team-based modes
- Spectator tools

### Community Suggestions
- Vote for new island themes
- Custom kit selections
- Ranked competitive play
- Replay system

---

**Ready for Epic Sky Battles!** ⚔️🏹

The professional SkyWars arena is now ready to host intense PvP battles in the sky. May the best warrior survive!
