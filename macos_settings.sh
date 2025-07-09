#!/bin/bash

# macOS Settings Configuration
# This script sets various macOS preferences to my liking

echo "Configuring macOS settings..."

# Close System Preferences to prevent it from overriding settings
osascript -e 'tell application "System Preferences" to quit'

# Finder preferences
# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Dock preferences
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 50

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Mission Control preferences
# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Keyboard settings
# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Screenshots
# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Safari preferences
# Enable the Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Privacy: don't send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Terminal preferences
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Restart affected applications
killall Finder
killall Dock
killall SystemUIServer

echo "macOS settings configured. Note that some changes require a restart to take effect."
