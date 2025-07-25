# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# Marsupilami Minecraft Add-on Development Guide

## Project Overview
We are creating a Minecraft Bedrock Edition add-on featuring Marsupilami, the beloved comic character. This add-on will include new mobs, items, blocks, and gameplay mechanics inspired by the Marsupilami universe.

## Development Environment Setup

### Prerequisites
- **Minecraft Bedrock Edition** (latest version)
- **Minecraft Preview** (for testing beta features)
- **Code Editor** (VS Code recommended with Blockception extensions)
- **Git** for version control
- **Node.js** (for build tools if needed)

### Directory Structure
```
marsu-addon/
├── behavior_pack/
│   ├── manifest.json
│   ├── pack_icon.png
│   ├── entities/
│   ├── items/
│   ├── blocks/
│   ├── recipes/
│   ├── loot_tables/
│   ├── spawn_rules/
│   └── scripts/
├── resource_pack/
│   ├── manifest.json
│   ├── pack_icon.png
│   ├── textures/
│   ├── models/
│   ├── sounds/
│   ├── animations/
│   └── entity/
├── docs/
├── README.md
└── .mcpack files (for distribution)
```

## Key Features to Implement

### 1. Marsupilami Entity
**Priority: HIGH**
- **File Location**: `behavior_pack/entities/marsupilami.json`
- **Behavior**: Friendly, tameable jungle creature
- **Special Abilities**: 
  - Tail swinging between trees
  - Super jump mechanics
  - "Houba!" sound effects
- **Spawning**: Jungle biomes only, rare spawn rate
- **Taming**: Use tropical fruits (new items)

### 2. New Items
**Priority: MEDIUM**
- **Marsupilami Egg**: Rare drop/find, can hatch baby Marsupilami
- **Tropical Fruits**: Bananas, mangoes (for taming/feeding)
- **Spotted Tail Rope**: Crafted item for enhanced climbing
- **Marsupilami Whistle**: Summons nearby tamed Marsupilami

### 3. New Blocks
**Priority: MEDIUM**
- **Spotted Yellow Wool**: Decorative block with Marsupilami pattern
- **Bouncy Vine Block**: Enhanced jungle vines with spring properties
- **Palombian Wood**: New jungle wood variant

### 4. Enhanced Jungle Biome
**Priority: LOW**
- **Taller Jungle Trees**: Modified world generation
- **Tree Houses**: New jungle structures
- **Hidden Caves**: Special loot locations

### 5. Gameplay Mechanics
**Priority: HIGH**
- **Tail Swinging**: Movement mechanic when near Marsupilami
- **Super Jump**: Temporary ability boost
- **Friendship System**: Marsupilami loyalty mechanics

## Technical Implementation Guidelines

### Behavior Pack Development
1. **Entity Definition**: Use `minecraft:behavior` components for AI
2. **Custom Animations**: Implement tail swinging and acrobatic moves
3. **Sound Integration**: Custom "Houba!" and jungle sounds
4. **Spawn Rules**: Jungle-specific, rare occurrence

### Resource Pack Development
1. **Textures**: High-quality Marsupilami textures (32x32 base)
2. **Models**: Custom 3D model for Marsupilami entity
3. **Animations**: Smooth tail movement and jumping animations
4. **UI Elements**: Custom inventory icons and GUI elements

### Scripting (if needed)
- Use Minecraft Script API for complex interactions
- Implement tail-swinging mechanics
- Handle special item effects

## Development Workflow

### Phase 1: Basic Setup
1. Create manifest files for both packs
2. Set up basic Marsupilami entity (static model)
3. Create placeholder textures and sounds
4. Test basic spawning in creative mode

### Phase 2: Core Features
1. Implement Marsupilami AI behaviors
2. Add taming mechanics with tropical fruits
3. Create tail swinging animations
4. Add sound effects and custom noises

### Phase 3: Items & Blocks
1. Design and implement new items
2. Create custom blocks with special properties
3. Set up crafting recipes
4. Add loot tables for rare items

### Phase 4: Advanced Features
1. Implement gameplay mechanics (super jump, etc.)
2. Enhanced jungle biome modifications
3. Special structures and loot locations
4. Polish animations and effects

### Phase 5: Testing & Polish
1. Extensive gameplay testing
2. Performance optimization
3. Bug fixes and balancing
4. Final art and sound polish

## File Naming Conventions
- Entity files: `marsupilami.json`, `baby_marsupilami.json`
- Item files: `tropical_fruit.json`, `marsupilami_egg.json`
- Texture files: `marsupilami.png`, `marsupilami_baby.png`
- Sound files: `marsupilami_houba.ogg`, `marsupilami_jump.ogg`

## Common Development Commands

### Testing and Installation
- **Install Packs**: Place both behavior_pack and resource_pack in `%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\`
- **Create Test World**: Enable experimental features when creating new world
- **Test Entities**: Use `/summon` commands for testing entities
- **Test Modes**: Test in both Creative and Survival modes

### File Validation
- Validate JSON syntax in all manifest.json files
- Ensure UUID consistency between behavior and resource packs
- Check file paths match exactly between packs (case-sensitive)

## Architecture Overview

This is a Minecraft Bedrock Edition add-on with dual-pack architecture:

### Behavior Pack (`behavior_pack/`)
- **Entities**: AI behaviors, spawn rules, loot tables
- **Items**: Item definitions and behaviors
- **Blocks**: Block behaviors and properties
- **Scripts**: GameTest/Script API code for complex interactions
- **Recipes**: Crafting and furnace recipes

### Resource Pack (`resource_pack/`)
- **Textures**: Visual assets for entities, items, blocks
- **Models**: 3D geometry definitions
- **Animations**: Entity animations and controllers
- **Sounds**: Audio assets and sound definitions
- **UI**: Custom interface elements

### Key Integration Points
- **manifest.json**: Both packs must have matching UUIDs for dependencies
- **Entity Files**: Behavior pack defines logic, resource pack defines visuals
- **Identifier Consistency**: All custom content uses `marsu:` namespace

## Testing Instructions
1. Place both packs in `%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\`
2. Create new world with experimental features enabled
3. Use `/summon` commands for testing entities
4. Test in both Creative and Survival modes

## Version Control
- Use semantic versioning (1.0.0, 1.1.0, etc.)
- Update manifest.json version numbers
- Tag releases in Git
- Keep changelog updated

## Distribution Preparation
- Create .mcpack files for easy installation
- Test on multiple devices/platforms
- Prepare marketing materials (screenshots, videos)
- Write comprehensive installation instructions

## Known Limitations
- Bedrock Edition scripting limitations
- Marketplace certification requirements
- Performance considerations for mobile devices
- Copyright considerations for Marsupilami character

## Resources
- [Minecraft Creator Documentation](https://learn.microsoft.com/en-us/minecraft/creator/)
- [Bedrock Edition Technical Documentation](https://wiki.bedrock.dev/)
- [Blockception VS Code Extensions](https://marketplace.visualstudio.com/publishers/BlockceptionLtd)

## Contact & Support
- Development : bat-cha
- Version: 1.0.0-dev
- Target Minecraft Version: 1.21+