@echo off
setlocal enabledelayedexpansion

echo 🚀 Marsupilami Add-on Deployment Script
echo =======================================

set "SCRIPT_DIR=%~dp0"
set "BEHAVIOR_PACK_DIR=%SCRIPT_DIR%behavior_pack"
set "RESOURCE_PACK_DIR=%SCRIPT_DIR%resource_pack"

REM Check for Minecraft installation
set "MINECRAFT_DIR=%LOCALAPPDATA%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang"

if not exist "%MINECRAFT_DIR%" (
    echo ❌ Minecraft Bedrock Edition not found!
    echo.
    echo Please ensure Minecraft Bedrock Edition is installed from Microsoft Store.
    echo Expected location: %MINECRAFT_DIR%
    echo.
    echo You can also manually copy the behavior_pack and resource_pack folders
    echo to your Minecraft installation directory.
    pause
    exit /b 1
)

echo 📁 Minecraft directory: %MINECRAFT_DIR%

REM Create directories if they don't exist
if not exist "%MINECRAFT_DIR%\behavior_packs" mkdir "%MINECRAFT_DIR%\behavior_packs"
if not exist "%MINECRAFT_DIR%\resource_packs" mkdir "%MINECRAFT_DIR%\resource_packs"

set "BP_TARGET=%MINECRAFT_DIR%\behavior_packs\MarsupillamiBP"
set "RP_TARGET=%MINECRAFT_DIR%\resource_packs\MarsupilamiRP"

REM Remove existing installations
if exist "%BP_TARGET%" (
    echo 🗑️  Removing existing behavior pack...
    rmdir /s /q "%BP_TARGET%"
)

if exist "%RP_TARGET%" (
    echo 🗑️  Removing existing resource pack...
    rmdir /s /q "%RP_TARGET%"
)

REM Copy packs
echo 📦 Copying behavior pack...
xcopy "%BEHAVIOR_PACK_DIR%" "%BP_TARGET%\" /e /i /h /y

echo 🎨 Copying resource pack...
xcopy "%RESOURCE_PACK_DIR%" "%RP_TARGET%\" /e /i /h /y

echo ✅ Packs deployed successfully!
echo.
echo 📋 Next steps:
echo   1. Open Minecraft Bedrock Edition
echo   2. Create a new world or edit existing world
echo   3. Go to Resource Packs and activate 'Marsupilami Resource Pack'
echo   4. Go to Behavior Packs and activate 'Marsupilami Behavior Pack'
echo   5. Enable experimental features if prompted
echo   6. Test with: /summon marsu:marsupilami
echo.
pause