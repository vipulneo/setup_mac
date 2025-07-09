#!/bin/bash

# obsidian_setup.sh
# This script sets up Obsidian with recommended community plugins

echo "Setting up Obsidian with community plugins..."

# Define the Obsidian directory
OBSIDIAN_DIR="$HOME/Documents/Obsidian"
OBSIDIAN_VAULT="$OBSIDIAN_DIR/MainVault"
PLUGINS_DIR="$OBSIDIAN_VAULT/.obsidian/plugins"

# Create Obsidian directories if they don't exist
mkdir -p "$OBSIDIAN_VAULT/.obsidian/plugins"
mkdir -p "$OBSIDIAN_VAULT/Daily Notes"
mkdir -p "$OBSIDIAN_VAULT/Templates"

# Function to install a plugin
install_plugin() {
    local plugin_id="$1"
    local plugin_name="$2"
    local plugin_dir="$PLUGINS_DIR/$plugin_id"
    
    echo "Installing $plugin_name plugin..."
    
    if [ -d "$plugin_dir" ]; then
        echo "$plugin_name is already installed."
        return
    fi
    
    mkdir -p "$plugin_dir"
    
    # Download the latest release from GitHub
    local release_url="https://github.com/obsidianmd/$plugin_id/releases/latest/download/main.js"
    local manifest_url="https://github.com/obsidianmd/$plugin_id/releases/latest/download/manifest.json"
    
    curl -sSL "$release_url" -o "$plugin_dir/main.js"
    curl -sSL "$manifest_url" -o "$plugin_dir/manifest.json"
    
    if [ $? -eq 0 ]; then
        echo "Successfully installed $plugin_name plugin."
    else
        echo "Failed to install $plugin_name plugin."
    fi
}

# Create a welcome note
WELCOME_NOTE="$OBSIDIAN_VAULT/Welcome.md"
cat > "$WELCOME_NOTE" << 'EOL'
# Welcome to Your Obsidian Vault

This vault has been set up with some common plugins to enhance your note-taking experience.

## Installed Plugins

- **Templates**: Create and use templates for consistent note formats
- **Calendar**: Navigate your daily notes with a calendar view
- **Dataview**: Query and view your notes as a database
- **Kanban**: Create kanban boards for project management
- **Tasks**: Track tasks across your vault

## Getting Started

1. Open the Settings (gear icon in the left sidebar)
2. Explore the plugins and enable them
3. Try creating a daily note using the calendar
4. Start organizing your thoughts!

Happy note-taking!
EOL

# Create a basic template
DAILY_TEMPLATE="$OBSIDIAN_VAULT/Templates/Daily Note.md"
mkdir -p "$(dirname "$DAILY_TEMPLATE")"
cat > "$DAILY_TEMPLATE" << 'EOL'
---
date: {{date:YYYY-MM-DD}}
tags: daily-note
---

# {{date:dddd, MMMM D, YYYY}}

## Tasks
- [ ] 

## Notes

## Journal

## Things I'm Grateful For
1. 
2. 
3. 
EOL

# Create obsidian configuration
CONFIG_FILE="$OBSIDIAN_VAULT/.obsidian/app.json"
cat > "$CONFIG_FILE" << 'EOL'
{
  "promptDelete": false,
  "alwaysUpdateLinks": true,
  "attachmentFolderPath": "Attachments",
  "newFileLocation": "folder",
  "newFileFolderPath": "Notes",
  "showUnsupportedFiles": true,
  "strictLineBreaks": true,
  "autoPairBrackets": true,
  "autoPairMarkdown": true,
  "readableLineLength": true,
  "showLineNumber": true,
  "showIndentGuide": true,
  "defaultViewMode": "preview"
}
EOL

# Install popular community plugins
install_plugin "obsidian-templates" "Templates"
install_plugin "obsidian-calendar-plugin" "Calendar"
install_plugin "obsidian-dataview" "Dataview"
install_plugin "obsidian-kanban" "Kanban"
install_plugin "obsidian-tasks" "Tasks"

echo "✅ Obsidian setup completed with standard plugins!"
echo "Your vault is located at: $OBSIDIAN_VAULT"
echo "Launch Obsidian and open this vault to start using it."
