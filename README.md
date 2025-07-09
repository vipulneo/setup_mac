# Mac Setup Automation

This repository contains scripts to automate the setup of a new Mac with preferred applications and settings, focusing on an enhanced terminal experience with WezTerm.

## Overview

This setup is based on [Josean Martinez's WezTerm setup guide](https://www.josean.com/posts/how-to-setup-wezterm-terminal) and includes:

- **WezTerm** - A GPU-accelerated terminal emulator written in Rust
- **Powerlevel10k** - A beautiful and fast ZSH theme
- **Tmux** - Terminal multiplexer for managing sessions
- **ZSH enhancements** - Autosuggestions, syntax highlighting, and more
- **Modern CLI tools** - Replacements for common Unix commands:
  - **eza** instead of ls
  - **zoxide** instead of cd
- **Productivity apps**:
  - **Obsidian** - Knowledge base and note-taking app that works with Markdown files
    - Includes setup for standard plugins: Templates, Calendar, Dataview, Kanban, Tasks
  - **Standard Notes** - Encrypted notes app for sensitive information

## Files in this Repository

- `setup.sh`: Main script that orchestrates the entire setup process
- `config.sh`: Configuration file for customizing what gets installed
- `interactive_config.sh`: Script for interactive configuration
- `generate_brewfile.sh`: Script that generates a Brewfile based on configuration
- `macos_settings.sh`: Script to configure macOS preferences
- `obsidian_setup.sh`: Script to set up Obsidian with standard plugins
- `dotfiles/`: Directory containing configuration files for various applications
  - `.zshrc`: ZSH shell configuration
  - `.gitconfig`: Git configuration
  - `.gitignore_global`: Global Git ignore patterns
  - `.wezterm.lua`: WezTerm terminal configuration
  - `.tmux.conf`: Tmux configuration
  - `dotfiles_setup.sh`: Script to install dotfiles to your home directory

## Installation

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/setup_mac.git
   cd setup_mac
   ```

2. Choose a configuration method:

   **Option 1**: Use the default configuration
   ```bash
   ./setup.sh
   ```

   **Option 2**: Interactive mode (answer prompts)
   ```bash
   ./setup.sh --interactive
   ```

   **Option 3**: Use a custom config file
   ```bash
   ./setup.sh --config /path/to/your/config.sh
   ```

3. Edit the configuration file (`config.sh`) directly to customize what gets installed:
   ```bash
   # Edit config file with your preferences
   vim config.sh
   
   # Then run the setup
   ./setup.sh
   ```
   ./setup.sh
   ```

## What it Does

1. Installs Homebrew (package manager for macOS)
2. Installs applications defined in the Brewfile
3. Sets up preferred macOS settings
4. Sets up dotfiles for various applications
   - WezTerm configuration
   - ZSH with powerlevel10k
   - Git configuration
   - Tmux configuration

## Post-Installation

After the script completes:

1. Open WezTerm to start using your new terminal
2. If the powerlevel10k configuration wizard doesn't start automatically, run `p10k configure`
3. To install tmux plugins, open tmux and press `Ctrl+a` followed by `Shift+I`

## Customization

- **Terminal Theme**: Edit `.wezterm.lua` to change the terminal theme
- **Shell Prompt**: Customize powerlevel10k by running `p10k configure`
- **Applications**: Edit `Brewfile` to add or remove applications
- **macOS Settings**: Modify `macos_settings.sh` to change macOS preferences

## Troubleshooting

- If you encounter any issues with Homebrew installation, visit [Homebrew's website](https://brew.sh)
- For WezTerm configuration help, see [WezTerm's documentation](https://wezfurlong.org/wezterm/index.html)
- For powerlevel10k issues, check [powerlevel10k's GitHub page](https://github.com/romkatv/powerlevel10k)
