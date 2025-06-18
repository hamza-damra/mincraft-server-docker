#!/bin/bash

# Complete Professional Lobby Builder
# This master script builds the entire professional lobby system

echo "🏗️ BUILDING COMPLETE PROFESSIONAL LOBBY"
echo "======================================="
echo ""

# Function to run script and check result
run_script() {
    local script="$1"
    local description="$2"
    
    echo "📋 $description"
    echo "Running: $script"
    echo "---"
    
    if [ -f "$script" ]; then
        chmod +x "$script"
        ./"$script"
        if [ $? -eq 0 ]; then
            echo "✅ $description - COMPLETED"
        else
            echo "❌ $description - FAILED"
            return 1
        fi
    else
        echo "❌ Script not found: $script"
        return 1
    fi
    
    echo ""
    echo "Waiting 5 seconds before next phase..."
    sleep 5
    echo ""
}

echo "Starting professional lobby construction..."
echo "This will build a complete professional lobby with:"
echo "  • Central spawn platform with glass dome"
echo "  • Four game portal areas"
echo "  • Professional buildings (Info, Admin, Community, Market)"
echo "  • Interactive signs and navigation"
echo "  • Decorative elements and landscaping"
echo "  • Protection and optimization"
echo ""
echo "Estimated time: 5-10 minutes"
echo ""
read -p "Press Enter to start construction..."

# Phase 1: Foundation and Core Structure
run_script "scripts/build-professional-lobby.sh" "Phase 1: Building Foundation and Core Structure"

# Phase 2: Buildings and Structures
run_script "scripts/build-lobby-structures.sh" "Phase 2: Building Professional Structures"

# Phase 3: Interactive Elements
run_script "scripts/setup-lobby-npcs.sh" "Phase 3: Setting Up Interactive Elements"

# Phase 4: Decorations and Details
run_script "scripts/add-lobby-decorations.sh" "Phase 4: Adding Professional Decorations"

# Phase 5: Protection and Rules
run_script "scripts/configure-lobby-protection.sh" "Phase 5: Configuring Protection and Rules"

# Phase 6: Testing and Optimization
run_script "scripts/test-professional-lobby.sh" "Phase 6: Testing and Optimization"

echo "🎉 PROFESSIONAL LOBBY CONSTRUCTION COMPLETED!"
echo "============================================="
echo ""
echo "✨ Your server now features a world-class professional lobby!"
echo ""
echo "🏗️ What was built:"
echo "  ✅ Central spawn platform with beacon and glass dome"
echo "  ✅ Four themed portal areas (Survival, SkyWars, Creative, Mini-Games)"
echo "  ✅ Information Center with server rules and help"
echo "  ✅ Administration building for staff and reports"
echo "  ✅ Community Center for events and interaction"
echo "  ✅ Market Hall for player economy"
echo "  ✅ Professional lighting system with sea lanterns"
echo "  ✅ Water features and decorative fountains"
echo "  ✅ Garden areas with flowers and trees"
echo "  ✅ Pathways with decorative borders"
echo "  ✅ Seating areas for players"
echo "  ✅ Professional banners and flags"
echo "  ✅ Interactive signs and navigation"
echo ""
echo "🛡️ Protection features:"
echo "  ✅ No building/breaking allowed"
echo "  ✅ PvP disabled for safety"
echo "  ✅ Adventure mode enforced"
echo "  ✅ Weather and time locked"
echo "  ✅ Mob spawning disabled"
echo "  ✅ Professional game rules"
echo ""
echo "🎮 Player commands available:"
echo "  • /lobby - Return to lobby"
echo "  • /survival - Go to survival world"
echo "  • /skywars - Join SkyWars arena"
echo "  • /creative - Enter creative world"
echo "  • /info - Server information"
echo "  • /help - Get help"
echo ""
echo "📍 Spawn coordinates: 0, 65, 0"
echo ""
echo "🚀 Your professional lobby is ready for players!"
echo "Players will be impressed by the quality and professionalism."
echo ""
echo "Next steps:"
echo "1. Test the lobby by joining the server"
echo "2. Verify all teleport commands work"
echo "3. Check that signs are interactive"
echo "4. Invite players to experience the new lobby!"
