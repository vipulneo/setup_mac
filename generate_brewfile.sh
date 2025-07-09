#!/bin/bash

# generate_brewfile.sh
# This script generates a Brewfile based on the configuration

echo "Generating Brewfile based on configuration..."

# Load the configuration
source ./config.sh

# Start with an empty Brewfile
cat > Brewfile << 'EOL'
# Brewfile
# This file was automatically generated based on your configuration
EOL

# Terminal and Shell Utilities
echo "" >> Brewfile
echo "# Terminal and Shell Utilities" >> Brewfile

if [ "$INSTALL_GIT" == "yes" ]; then
    echo 'brew "git"' >> Brewfile
fi

if [ "$INSTALL_WEZTERM" == "yes" ]; then
    echo 'cask "wezterm"' >> Brewfile
fi

if [ "$INSTALL_MESLO_FONT" == "yes" ]; then
    echo 'cask "font-meslo-lg-nerd-font"' >> Brewfile
fi

if [ "$INSTALL_POWERLEVEL10K" == "yes" ]; then
    echo 'brew "powerlevel10k"' >> Brewfile
fi

if [ "$INSTALL_ZSH_PLUGINS" == "yes" ]; then
    echo 'brew "zsh-autosuggestions"' >> Brewfile
    echo 'brew "zsh-syntax-highlighting"' >> Brewfile
fi

if [ "$INSTALL_EZA" == "yes" ]; then
    echo 'brew "eza"  # Better ls replacement' >> Brewfile
fi

if [ "$INSTALL_ZOXIDE" == "yes" ]; then
    echo 'brew "zoxide"  # Better cd replacement' >> Brewfile
fi

if [ "$INSTALL_TMUX" == "yes" ]; then
    echo 'brew "tmux"  # Terminal multiplexer' >> Brewfile
    echo 'brew "bash"  # Newer version of bash (for tmux theme)' >> Brewfile
fi

# CLI Tools
echo "" >> Brewfile
echo "# CLI Tools" >> Brewfile
echo 'brew "wget"' >> Brewfile
echo 'brew "curl"' >> Brewfile
echo 'brew "ripgrep"  # Better grep' >> Brewfile
echo 'brew "tree"     # Directory listings as trees' >> Brewfile
echo 'brew "jq"       # JSON processor' >> Brewfile
echo 'brew "htop"     # Interactive process viewer' >> Brewfile
echo 'brew "ffmpeg"   # Media processing' >> Brewfile

# Development Tools
echo "" >> Brewfile
echo "# Development Tools" >> Brewfile

if [ "$INSTALL_NODE" == "yes" ]; then
    echo 'brew "node"' >> Brewfile
fi

if [ "$INSTALL_PYTHON" == "yes" ]; then
    echo 'brew "python"' >> Brewfile
fi

if [ "$INSTALL_VSCODE" == "yes" ]; then
    echo 'cask "visual-studio-code"' >> Brewfile
fi

if [ "$INSTALL_DOCKER" == "yes" ]; then
    echo 'cask "docker"' >> Brewfile
fi

# Productivity
echo "" >> Brewfile
echo "# Productivity" >> Brewfile

if [ "$INSTALL_RECTANGLE" == "yes" ]; then
    echo 'cask "rectangle"  # Window manager' >> Brewfile
fi

if [ "$INSTALL_OBSIDIAN" == "yes" ]; then
    echo 'cask "obsidian"   # Knowledge base and note-taking app' >> Brewfile
fi

if [ "$INSTALL_STANDARD_NOTES" == "yes" ]; then
    echo 'cask "standard-notes"  # Encrypted notes app' >> Brewfile
fi

# Browsers
echo "" >> Brewfile
echo "# Browsers" >> Brewfile

if [ "$INSTALL_CHROME" == "yes" ]; then
    echo 'cask "google-chrome"' >> Brewfile
fi

if [ "$INSTALL_FIREFOX" == "yes" ]; then
    echo 'cask "firefox"' >> Brewfile
fi

# Communication
echo "" >> Brewfile
echo "# Communication" >> Brewfile

if [ "$INSTALL_SLACK" == "yes" ]; then
    echo 'cask "slack"' >> Brewfile
fi

if [ "$INSTALL_ZOOM" == "yes" ]; then
    echo 'cask "zoom"' >> Brewfile
fi

# Utilities
echo "" >> Brewfile
echo "# Utilities" >> Brewfile

if [ "$INSTALL_UNARCHIVER" == "yes" ]; then
    echo 'cask "the-unarchiver"' >> Brewfile
fi

echo "Brewfile has been generated based on your configuration."
