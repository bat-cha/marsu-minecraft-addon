#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BEHAVIOR_PACK_DIR="$SCRIPT_DIR/behavior_pack"
RESOURCE_PACK_DIR="$SCRIPT_DIR/resource_pack"

echo "🚀 Marsupilami Add-on Deployment Script"
echo "======================================="

check_minecraft_installation() {
    # Check for Windows Minecraft installation (WSL/native Windows)
    local MINECRAFT_PATHS=(
        "/mnt/c/Users/$USER/AppData/Local/Packages/Microsoft.MinecraftUWP_8wekyb3d8bbwe/LocalState/games/com.mojang"
        "/mnt/c/Users/*/AppData/Local/Packages/Microsoft.MinecraftUWP_8wekyb3d8bbwe/LocalState/games/com.mojang"
        "$HOME/.local/share/mcpelauncher/games/com.mojang"  # Linux MCPE Launcher
    )
    
    for path in "${MINECRAFT_PATHS[@]}"; do
        # Handle wildcard paths
        if [[ "$path" == *"*"* ]]; then
            for expanded_path in $path; do
                if [[ -d "$expanded_path" ]]; then
                    echo "$expanded_path"
                    return 0
                fi
            done
        else
            if [[ -d "$path" ]]; then
                echo "$path"
                return 0
            fi
        fi
    done
    
    return 1
}

deploy_packs() {
    local minecraft_dir="$1"
    local bp_target="$minecraft_dir/behavior_packs/MarsupillamiBP"
    local rp_target="$minecraft_dir/resource_packs/MarsupilamiRP"
    
    echo "📁 Minecraft directory: $minecraft_dir"
    
    # Create directories if they don't exist
    mkdir -p "$minecraft_dir/behavior_packs"
    mkdir -p "$minecraft_dir/resource_packs"
    
    # Remove existing installations
    if [[ -d "$bp_target" ]]; then
        echo "🗑️  Removing existing behavior pack..."
        rm -rf "$bp_target"
    fi
    
    if [[ -d "$rp_target" ]]; then
        echo "🗑️  Removing existing resource pack..."
        rm -rf "$rp_target"
    fi
    
    # Copy packs
    echo "📦 Copying behavior pack..."
    cp -r "$BEHAVIOR_PACK_DIR" "$bp_target"
    
    echo "🎨 Copying resource pack..."
    cp -r "$RESOURCE_PACK_DIR" "$rp_target"
    
    echo "✅ Packs deployed successfully!"
    echo ""
    echo "📋 Next steps:"
    echo "  1. Open Minecraft Bedrock Edition"
    echo "  2. Create a new world or edit existing world"
    echo "  3. Go to Resource Packs and activate 'Marsupilami Resource Pack'"
    echo "  4. Go to Behavior Packs and activate 'Marsupilami Behavior Pack'"
    echo "  5. Enable experimental features if prompted"
    echo "  6. Test with: /summon marsu:marsupilami"
}

# Main execution
echo "🔍 Searching for Minecraft installation..."

if MINECRAFT_DIR=$(check_minecraft_installation); then
    deploy_packs "$MINECRAFT_DIR"
else
    echo "❌ Minecraft Bedrock Edition not found!"
    echo ""
    echo "Please ensure Minecraft Bedrock Edition is installed."
    echo "Supported locations:"
    echo "  - Windows (WSL): /mnt/c/Users/[username]/AppData/Local/Packages/Microsoft.MinecraftUWP_8wekyb3d8bbwe/LocalState/games/com.mojang"
    echo "  - Linux MCPE Launcher: ~/.local/share/mcpelauncher/games/com.mojang"
    echo ""
    echo "You can also manually copy the behavior_pack and resource_pack folders to your Minecraft installation."
    exit 1
fi