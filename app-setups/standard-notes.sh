#!/bin/bash

# Install and Setup Standard Notes

## Download The AppImage from https://standardnotes.com/plans?downloaded=linux

## Make life easy by saving paths to reusable variables
appImagesPath="$HOME/.local/AppImages"
desktopEntryPath="$HOME/.local/share/applications"
iconsPath="$HOME/.local/share/icons"

## Save it to common AppImage dir
mkdir -p "$appImagesPath"
mv "$HOME/Downloads/standard-notes"*.AppImage "$appImagesPath/standard-notes.AppImage"

## Make it executable
chmod a+x "$appImagesPath/standard-notes.AppImage"

## Download an icon for the desktop entry
mkdir -p "$iconsPath"
curl -L -o "$iconsPath/standard-notes.png" "https://raw.githubusercontent.com/homarr-labs/dashboard-icons/main/png/standard-notes.png"

## Make the desktop entry
mkdir -p "$desktopEntryPath"
cat << EOF > "$desktopEntryPath/standard-notes.desktop"
[Desktop Entry]
Name=Standard Notes
Comment=Secure, end‑to‑end encrypted note taking
Exec=$HOME/.local/AppImages/standard-notes.AppImage %U
Terminal=false
Type=Application
Icon=$HOME/.local/share/icons/standard-notes.png
Categories=Office;
StartupNotify=true
MimeType=text/plain;application/x-standardnotes;
EOF

## Update Dekstop Entry Database
update-desktop-database ~/.local/share/applications
