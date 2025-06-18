# 🏟️ How to Join SkyWars

## 🎮 **For Players**

### **Method 1: Using the Lobby Sign (Easiest)**
1. **Join the server** - You'll spawn in the lobby
2. **Find the SkyWars sign** - Look for the blue **[SkyWars]** sign
3. **Right-click the sign** - You'll be teleported to the SkyWars arena
4. **Start fighting!** - PvP is enabled, last player standing wins

### **Method 2: Using Commands**
1. **Join the server** and spawn in lobby
2. **Type command**: `/mv tp skywars1` (if you have permission)
3. **You'll be teleported** to the SkyWars arena

### **Method 3: Ask an Admin**
1. **Ask an admin** to teleport you: `/mv tp <your_name> skywars1`

## ⚔️ **SkyWars Arena Features**

### **Arena Layout**
- 🏝️ **Center Island**: Large island with 4 chests containing good loot
- 🏝️ **8 Spawn Islands**: Smaller islands around the center, each with a chest
- 🚧 **World Border**: 100 block radius to keep the action contained
- ⚡ **PvP Enabled**: Fight other players to be the last one standing

### **Game Rules**
- ✅ **PvP Enabled**: You can attack other players
- ❌ **No Keep Inventory**: You lose items when you die
- ✅ **Natural Regeneration**: Health regenerates slowly
- 🌅 **Always Day**: Time is frozen at day

### **Strategy Tips**
1. **Loot Your Island**: Start by opening the chest on your spawn island
2. **Bridge to Center**: Build bridges to reach the center island for better loot
3. **Watch for Enemies**: Other players will be doing the same
4. **Control the Center**: The center island has the best equipment
5. **Last Player Wins**: Eliminate all other players to win

## 🔧 **For Admins**

### **Managing SkyWars Games**
```bash
# Teleport player to SkyWars
/mv tp <player> skywars1

# Return player to lobby
/mv tp <player> lobby

# Clear player inventory (for fresh start)
/clear <player>

# Set player to survival mode
/gamemode survival <player>

# Heal player
/heal <player>

# Give starting items (optional)
/give <player> stone_sword 1
/give <player> bread 5
```

### **Arena Management**
```bash
# Reset arena (if needed)
/mv delete skywars1
/mv create skywars1 NORMAL
# Then run: ./scripts/setup-basic-skywars.sh

# Check world info
/mv info skywars1

# Set world border
/worldborder set 100

# Set time to day
/time set day
```

### **Player Management**
```bash
# Spectator mode for eliminated players
/gamemode spectator <player>

# Teleport spectators to center for viewing
/tp <player> 0 70 0

# Announce winner
/say <player> wins the SkyWars match!
```

## 🎯 **Current Setup Status**

### ✅ **What's Working**
- ✅ SkyWars arena built with 8 spawn islands + center island
- ✅ Chests placed on all islands (need to be filled with loot)
- ✅ World border set to 100 blocks
- ✅ PvP enabled in SkyWars world
- ✅ Sign in lobby teleports to SkyWars arena
- ✅ Commands work for teleportation

### 🔧 **What Needs Manual Management**
- 🔧 **Chest Loot**: Admins need to fill chests with items
- 🔧 **Game Start**: Admins need to teleport players manually
- 🔧 **Game End**: Admins need to declare winners and reset
- 🔧 **Player Management**: Admins handle spectators and respawns

## 📋 **Quick Start for Admins**

### **Setting Up a SkyWars Match**
1. **Fill the chests** with loot (swords, food, blocks, etc.)
2. **Teleport players** to SkyWars: `/mv tp <player> skywars1`
3. **Clear inventories**: `/clear <player>` for fair start
4. **Set survival mode**: `/gamemode survival <player>`
5. **Announce start**: `/say SkyWars match starting!`
6. **Monitor the game** and declare winner when only one remains

### **After the Match**
1. **Congratulate winner**: `/say <winner> wins!`
2. **Return players to lobby**: `/mv tp <player> lobby`
3. **Refill chests** for next match
4. **Reset any broken blocks** if needed

## 🚀 **Ready to Play!**

The SkyWars arena is fully functional and ready for PvP battles! Players can join by clicking the sign in the lobby or using commands. Admins can manage games manually until a dedicated SkyWars plugin is added for automated gameplay.

**Have fun and may the best player win!** ⚔️
