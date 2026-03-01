# 🛠️ Modern Linux Tools Setup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-ubuntu%20%7C%20debian-orange)](https://ubuntu.com/)
[![Shell](https://img.shields.io/badge/shell-bash%20%7C%20zsh-blue)](https://www.gnu.org/software/bash/)

A curated collection of modern Unix tools and a high-performance terminal configuration. This script automates the installation of the "Modern Unix" stack and sets up an optimized environment for developers and sysadmins.

## 🚀 One-Liner Installation

Run the following command to transform your terminal:

```bash
curl -sSL https://raw.githubusercontent.com/git-ig/linux-tools/main/setup.sh | bash

📦 What's Included?

The setup script installs and configures the following "Top-Tier" utilities:
Tool	Description
eza	A modern, feature-rich replacement for ls.
bat	A cat clone with syntax highlighting and Git integration.
btop	An interactive resource monitor (CPU, Memory, Network, Disks).
lazydocker	A simple terminal UI for both docker and docker-compose.
duf	A better df alternative with a clean, colorful layout.
gdu	Fast disk usage analyzer with a console interface.
Neovim	Hyperextensible Vim-based text editor (Latest Unstable PPA).
NvChad	A blazing fast Neovim config providing a solid IDE-like experience.
⌨️ Custom Aliases

The script automatically detects your shell (Bash or Zsh) and appends the following productivity aliases:
Navigation & Listing (eza)

    ls → Beautiful list with icons and directories first.

    ll → Detailed long-view with headers and Git status.

    la → Show all files (including hidden).

    lt → Tree view (2 levels deep).

    lr → Sort by most recently modified (newest at bottom).

Shortcuts

    vi / vim → Launches nvim.

    bat → Launches batcat.

    lzd → Launches lazydocker.

🛠️ Manual Post-Install Steps

After the script finishes, apply the changes to your current session:
code Bash

# For Bash users
source ~/.bashrc

# For Zsh users
source ~/.zshrc

📋 Requirements

    OS: Ubuntu or Debian-based distributions.

    Privileges: Sudo access is required for package installation.

Maintained by git-ig
