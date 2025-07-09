#!/bin/bash

# interactive_config.sh
# This script interactively prompts the user for configuration options

echo "🔧 Interactive Setup Configuration"
echo "=================================="
echo "Answer the following questions to customize your Mac setup."
echo "Press Enter to accept the default value (shown in brackets)."
echo ""

# Helper function to prompt for yes/no
prompt_yes_no() {
    local prompt="$1"
    local default="$2"
    local response
    
    if [ "$default" == "yes" ]; then
        prompt="$prompt [Y/n]"
    else
        prompt="$prompt [y/N]"
    fi
    
    read -p "$prompt " response
    response=${response:-$default}
    
    case "${response,,}" in
        y|yes) echo "yes" ;;
        *) echo "no" ;;
    esac
}

# Create a new config file
cat > config.sh << 'EOL'
# Configuration for Mac setup
# Generated interactively on $(date)
EOL

# Terminal and Shell
echo "
# Terminal and Shell" >> config.sh

INSTALL_WEZTERM=$(prompt_yes_no "Install WezTerm terminal?" "yes")
echo "INSTALL_WEZTERM=\"$INSTALL_WEZTERM\"" >> config.sh

INSTALL_MESLO_FONT=$(prompt_yes_no "Install MesloLGS Nerd Font?" "yes")
echo "INSTALL_MESLO_FONT=\"$INSTALL_MESLO_FONT\"" >> config.sh

INSTALL_POWERLEVEL10K=$(prompt_yes_no "Install Powerlevel10k theme for zsh?" "yes")
echo "INSTALL_POWERLEVEL10K=\"$INSTALL_POWERLEVEL10K\"" >> config.sh

INSTALL_ZSH_PLUGINS=$(prompt_yes_no "Install zsh plugins (autosuggestions, syntax-highlighting)?" "yes")
echo "INSTALL_ZSH_PLUGINS=\"$INSTALL_ZSH_PLUGINS\"" >> config.sh

INSTALL_EZA=$(prompt_yes_no "Install eza (better ls replacement)?" "yes")
echo "INSTALL_EZA=\"$INSTALL_EZA\"" >> config.sh

INSTALL_ZOXIDE=$(prompt_yes_no "Install zoxide (better cd replacement)?" "yes")
echo "INSTALL_ZOXIDE=\"$INSTALL_ZOXIDE\"" >> config.sh

INSTALL_TMUX=$(prompt_yes_no "Install tmux (terminal multiplexer)?" "yes")
echo "INSTALL_TMUX=\"$INSTALL_TMUX\"" >> config.sh

# Development Tools
echo "
# Development Tools" >> config.sh

INSTALL_GIT=$(prompt_yes_no "Install Git?" "yes")
echo "INSTALL_GIT=\"$INSTALL_GIT\"" >> config.sh

INSTALL_NODE=$(prompt_yes_no "Install Node.js?" "yes")
echo "INSTALL_NODE=\"$INSTALL_NODE\"" >> config.sh

INSTALL_PYTHON=$(prompt_yes_no "Install Python?" "yes")
echo "INSTALL_PYTHON=\"$INSTALL_PYTHON\"" >> config.sh

INSTALL_VSCODE=$(prompt_yes_no "Install Visual Studio Code?" "yes")
echo "INSTALL_VSCODE=\"$INSTALL_VSCODE\"" >> config.sh

INSTALL_DOCKER=$(prompt_yes_no "Install Docker?" "yes")
echo "INSTALL_DOCKER=\"$INSTALL_DOCKER\"" >> config.sh

# Productivity Apps
echo "
# Productivity Apps" >> config.sh

INSTALL_RECTANGLE=$(prompt_yes_no "Install Rectangle (window manager)?" "yes")
echo "INSTALL_RECTANGLE=\"$INSTALL_RECTANGLE\"" >> config.sh

INSTALL_OBSIDIAN=$(prompt_yes_no "Install Obsidian (knowledge base app)?" "yes")
echo "INSTALL_OBSIDIAN=\"$INSTALL_OBSIDIAN\"" >> config.sh

if [ "$INSTALL_OBSIDIAN" == "yes" ]; then
    INSTALL_OBSIDIAN_PLUGINS=$(prompt_yes_no "Install standard plugins for Obsidian?" "yes")
    echo "INSTALL_OBSIDIAN_PLUGINS=\"$INSTALL_OBSIDIAN_PLUGINS\"" >> config.sh
else
    echo "INSTALL_OBSIDIAN_PLUGINS=\"no\"" >> config.sh
fi

INSTALL_STANDARD_NOTES=$(prompt_yes_no "Install Standard Notes (encrypted notes app)?" "yes")
echo "INSTALL_STANDARD_NOTES=\"$INSTALL_STANDARD_NOTES\"" >> config.sh

# Browsers
echo "
# Browsers" >> config.sh

INSTALL_CHROME=$(prompt_yes_no "Install Google Chrome?" "yes")
echo "INSTALL_CHROME=\"$INSTALL_CHROME\"" >> config.sh

INSTALL_FIREFOX=$(prompt_yes_no "Install Firefox?" "yes")
echo "INSTALL_FIREFOX=\"$INSTALL_FIREFOX\"" >> config.sh

# Communication
echo "
# Communication" >> config.sh

INSTALL_SLACK=$(prompt_yes_no "Install Slack?" "yes")
echo "INSTALL_SLACK=\"$INSTALL_SLACK\"" >> config.sh

INSTALL_ZOOM=$(prompt_yes_no "Install Zoom?" "yes")
echo "INSTALL_ZOOM=\"$INSTALL_ZOOM\"" >> config.sh

# Utilities
echo "
# Utilities" >> config.sh

INSTALL_UNARCHIVER=$(prompt_yes_no "Install The Unarchiver?" "yes")
echo "INSTALL_UNARCHIVER=\"$INSTALL_UNARCHIVER\"" >> config.sh

# macOS Configuration
echo "
# macOS Configuration" >> config.sh

CONFIGURE_MACOS_SETTINGS=$(prompt_yes_no "Configure recommended macOS settings?" "yes")
echo "CONFIGURE_MACOS_SETTINGS=\"$CONFIGURE_MACOS_SETTINGS\"" >> config.sh

# Git Configuration
echo "
# Git Configuration" >> config.sh

read -p "Enter your Git username [Vipul Vikram]: " GIT_USER_NAME
GIT_USER_NAME=${GIT_USER_NAME:-"Vipul Vikram"}
echo "GIT_USER_NAME=\"$GIT_USER_NAME\"" >> config.sh

read -p "Enter your Git email [vipul.vikram@brambles.com]: " GIT_USER_EMAIL
GIT_USER_EMAIL=${GIT_USER_EMAIL:-"vipul.vikram@brambles.com"}
echo "GIT_USER_EMAIL=\"$GIT_USER_EMAIL\"" >> config.sh

echo "
Configuration has been saved to config.sh."
