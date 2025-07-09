#!/bin/bash

# Mac Setup Script
# This script automates the setup of a new Mac with preferred applications and settings,
# including WezTerm terminal and enhancements based on https://www.josean.com/posts/how-to-setup-wezterm-terminal

set -e  # Exit immediately if a command exits with a non-zero status

echo "🚀 Starting Mac setup..."

# Check for command line arguments
CONFIG_MODE="default"
if [ "$1" == "--interactive" ] || [ "$1" == "-i" ]; then
    CONFIG_MODE="interactive"
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Usage: ./setup.sh [OPTION]"
    echo "Options:"
    echo "  -i, --interactive    Run setup with interactive prompts for configuration"
    echo "  -c, --config FILE    Use specified config file instead of default"
    echo "  -h, --help           Display this help message"
    exit 0
elif [ "$1" == "--config" ] || [ "$1" == "-c" ]; then
    if [ -f "$2" ]; then
        cp "$2" config.sh
        echo "Using provided configuration file: $2"
    else
        echo "Error: Configuration file $2 not found."
        exit 1
    fi
fi

# If interactive mode, run the interactive configuration
if [ "$CONFIG_MODE" == "interactive" ]; then
    chmod +x ./interactive_config.sh
    ./interactive_config.sh
fi

# Ensure config.sh exists
if [ ! -f config.sh ]; then
    echo "No configuration file found. Using default configuration."
    cp config.sh.default config.sh 2>/dev/null || true
    if [ ! -f config.sh ]; then
        echo "Error: No default configuration file found."
        exit 1
    fi
fi

# Load the configuration
source ./config.sh

# Check if Homebrew is installed, install if it's not
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs if needed
    if [[ $(uname -m) == 'arm64' ]]; then
        echo "🔄 Adding Homebrew to PATH for Apple Silicon Mac..."
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew is already installed."
fi

# Update Homebrew and upgrade any already-installed formulae
echo "🔄 Updating Homebrew..."
brew update
brew upgrade

# Generate Brewfile based on configuration
chmod +x ./generate_brewfile.sh
./generate_brewfile.sh

# Install all applications from Brewfile
echo "📦 Installing applications from Brewfile..."
brew bundle

# Set macOS preferences if configured
if [ "$CONFIGURE_MACOS_SETTINGS" == "yes" ]; then
    echo "⚙️ Configuring macOS settings..."
    chmod +x ./macos_settings.sh
    ./macos_settings.sh
else
    echo "⏭️ Skipping macOS settings configuration."
fi

# Set up dotfiles
echo "📄 Setting up dotfiles..."
chmod +x ./dotfiles/dotfiles_setup.sh
./dotfiles/dotfiles_setup.sh

# Update Git configuration with user info
if [ "$INSTALL_GIT" == "yes" ]; then
    echo "🔄 Updating Git configuration with user info..."
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
fi

# Set up Obsidian with standard plugins if configured
if [ "$INSTALL_OBSIDIAN" == "yes" ] && [ "$INSTALL_OBSIDIAN_PLUGINS" == "yes" ]; then
    echo "📔 Setting up Obsidian with standard plugins..."
    chmod +x ./obsidian_setup.sh
    ./obsidian_setup.sh
elif [ "$INSTALL_OBSIDIAN" == "yes" ]; then
    echo "📔 Obsidian installed, but plugins setup skipped per configuration."
fi

# Final message
echo "✨ Setup complete! Here's what was installed:"

# List installed components based on configuration
if [ "$INSTALL_WEZTERM" == "yes" ]; then
    echo "- WezTerm terminal emulator"
fi

if [ "$INSTALL_MESLO_FONT" == "yes" ]; then
    echo "- MesloLGS Nerd Font"
fi

if [ "$INSTALL_POWERLEVEL10K" == "yes" ]; then
    echo "- Powerlevel10k theme for zsh"
fi

if [ "$INSTALL_ZSH_PLUGINS" == "yes" ]; then
    echo "- Zsh plugins (autosuggestions, syntax-highlighting)"
fi

if [ "$INSTALL_EZA" == "yes" ]; then
    echo "- Eza (better ls)"
fi

if [ "$INSTALL_ZOXIDE" == "yes" ]; then
    echo "- Zoxide (better cd)"
fi

if [ "$INSTALL_TMUX" == "yes" ]; then
    echo "- Tmux and plugins"
fi

if [ "$INSTALL_OBSIDIAN" == "yes" ]; then
    if [ "$INSTALL_OBSIDIAN_PLUGINS" == "yes" ]; then
        echo "- Obsidian knowledge base app with standard plugins:"
        echo "  - Templates, Calendar, Dataview, Kanban, Tasks"
    else
        echo "- Obsidian knowledge base app"
    fi
fi

if [ "$INSTALL_STANDARD_NOTES" == "yes" ]; then
    echo "- Standard Notes encrypted notes app"
fi

if [ "$INSTALL_VSCODE" == "yes" ]; then
    echo "- Visual Studio Code"
fi

if [ "$INSTALL_DOCKER" == "yes" ]; then
    echo "- Docker"
fi

echo ""
echo "🔍 Some next steps:"

if [ "$INSTALL_WEZTERM" == "yes" ]; then
    echo "1. Open WezTerm to start using your new terminal"
fi

if [ "$INSTALL_POWERLEVEL10K" == "yes" ]; then
    echo "2. If powerlevel10k configuration wizard doesn't start automatically, run 'p10k configure'"
fi

if [ "$INSTALL_TMUX" == "yes" ]; then
    echo "3. To install tmux plugins, open tmux and press Ctrl+a followed by Shift+I"
fi

echo ""
echo "Some changes may require a system restart to take effect."
