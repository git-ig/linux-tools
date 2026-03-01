# 🛠️ linux-tools

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OS](https://img.shields.io/badge/OS-Ubuntu%20%7C%20Debian-orange?logo=ubuntu)](https://ubuntu.com/)
[![Shell](https://img.shields.io/badge/Shell-Bash%20%7C%20Zsh-blue?logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![Editor](https://img.shields.io/badge/Editor-Neovim%20%2B%20NvChad-green?logo=neovim)](https://nvchad.com/)

A single-script setup for a clean, modern Linux CLI environment. Installs essential tools, configures smart aliases, and gets you from a fresh Ubuntu/Debian install to a productive terminal in under two minutes.

---

## ⚡ Quick Start

```bash
curl -sSL https://raw.githubusercontent.com/git-ig/linux-tools/main/setup.sh | bash
```

> After the script finishes, reload your shell config:
> ```bash
> source ~/.bashrc   # or source ~/.zshrc
> ```

---

## 📦 What Gets Installed

| Tool | Replaces | Description |
|------|----------|-------------|
| [eza](https://github.com/eza-community/eza) | `ls` | Modern file listing with icons, git status, and colors |
| [bat](https://github.com/sharkdp/bat) | `cat` | Syntax-highlighted file viewer |
| [btop](https://github.com/aristocratsec/btop) | `top` / `htop` | Beautiful resource monitor |
| [duf](https://github.com/muesli/duf) | `df` | Disk usage with a clean interface |
| [gdu](https://github.com/dundee/gdu) | `du` | Fast interactive disk usage analyzer |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | `docker ps/logs/...` | Terminal UI for Docker management |
| [Neovim](https://neovim.io/) + [NvChad](https://nvchad.com/) | `vim` / `nano` | Modern editor with IDE-like features out of the box |

---

## 🔧 Aliases Configured

The script automatically detects your shell (Bash or Zsh) and adds the following aliases:

### 📁 File Listing — powered by `eza`

| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `eza --icons --group-directories-first` | Clean listing with icons |
| `ll` | `eza -lha --icons --group-directories-first --git --header` | Detailed list with hidden files and git status |
| `la` | `eza -a --icons --group-directories-first` | All files including dotfiles |
| `lt` | `eza --tree --level=2 --icons` | Tree view (2 levels deep) |
| `lr` | `eza -lh --sort=modified --icons` | Files sorted by modification time |

### 🧰 Tool Shortcuts

| Alias | Runs | Description |
|-------|------|-------------|
| `vi` | `nvim` | Open Neovim |
| `vim` | `nvim` | Open Neovim |
| `bat` | `batcat` | Syntax-highlighted file preview |
| `lzd` | `lazydocker` | Open lazydocker TUI |

---

## 🖥️ Requirements

- Ubuntu 20.04+ or Debian 11+
- `sudo` access
- Internet connection

The script is safe to re-run — aliases are only added once.

---

## 📋 What the Script Does, Step by Step

1. **Updates** the system and installs base dependencies (`curl`, `wget`, `git`, `gpg`)
2. **Installs** `btop`, `duf`, `gdu`, `bat` from apt
3. **Adds the eza repository** and installs `eza`
4. **Installs lazydocker** via its official install script and moves it to `/usr/local/bin`
5. **Installs Neovim** from the unstable PPA (latest version)
6. **Clones NvChad starter** config into `~/.config/nvim` (only if not already present)
7. **Detects your shell** and appends aliases to `~/.bashrc` or `~/.zshrc`

---

## 🗂️ Repository Structure

```
linux-tools/
└── setup.sh       # Main setup script
└── README.md      # This file
```

---

## 🤝 Contributing

Found a bug or want to add a tool? PRs and issues are welcome.

1. Fork the repo
2. Create your branch: `git checkout -b feature/my-tool`
3. Commit your changes: `git commit -m 'Add my-tool'`
4. Push and open a Pull Request

---

## 📄 License

[MIT](https://opensource.org/licenses/MIT) — do whatever you want with it.
