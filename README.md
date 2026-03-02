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

### 📁 File & Navigation
| Tool | Replaces | Description |
|------|----------|-------------|
| [eza](https://github.com/eza-community/eza) | `ls` | Modern file listing with icons, git status, and colors |
| [yazi](https://github.com/sxyazi/yazi) | `ranger` / `lf` | Blazing-fast terminal file manager |
| [bat](https://github.com/sharkdp/bat) | `cat` | Syntax-highlighted file viewer |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `cd` | Smart directory jumper — learns your habits |
| [fzf](https://github.com/junegunn/fzf) | — | Fuzzy finder for files, history, and anything else |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | `grep` | Blazing-fast search that respects `.gitignore` |

### 📊 System Monitoring
| Tool | Replaces | Description |
|------|----------|-------------|
| [btop](https://github.com/aristocratsec/btop) | `top` / `htop` | Beautiful resource monitor |
| [duf](https://github.com/muesli/duf) | `df` | Disk usage with a clean interface |
| [gdu](https://github.com/dundee/gdu) | `du` | Fast interactive disk usage analyzer |
| [ctop](https://github.com/bcicen/ctop) | `docker stats` | Top-like interface for Docker containers |

### 🐳 Docker & Development
| Tool | Replaces | Description |
|------|----------|-------------|
| [lazydocker](https://github.com/jesseduffield/lazydocker) | `docker ps/logs/...` | Full Docker TUI — manage containers, logs, stats |
| [Neovim](https://neovim.io/) + [NvChad](https://nvchad.com/) | `vim` / `nano` | Modern editor with IDE-like features out of the box |

### 🌐 Network
| Tool | Replaces | Description |
|------|----------|-------------|
| [curlie](https://github.com/rs/curlie) | `curl` | curl with httpie-style output — readable by humans |

---

## 🔧 Aliases Configured

The script automatically detects your shell (Bash or Zsh) and adds the following aliases.

### 📁 File Listing — powered by `eza`

| Alias | Description |
|-------|-------------|
| `ls` | Clean listing with icons, directories first |
| `ll` | Detailed list with hidden files and git status |
| `la` | All files including dotfiles |
| `lt` | Tree view, 2 levels deep |
| `lr` | Files sorted by modification time |

### 🧰 Tool Shortcuts

| Alias | Runs | Description |
|-------|------|-------------|
| `vi` / `vim` | `nvim` | Open Neovim |
| `bat` | `batcat` | Syntax-highlighted file preview |
| `lzd` | `lazydocker` | Open lazydocker TUI |
| `yz` | `yazi` | Open yazi file manager |
| `rg` | `rg --color=auto` | Colorized ripgrep search |
| `curl` | `curlie` | Human-readable HTTP requests |

### 🚀 Shell Enhancements

| Feature | Description |
|---------|-------------|
| `z <name>` | Jump to a frequently used directory with zoxide |
| `Ctrl+R` | Fuzzy search through command history with fzf |
| fzf + rg | fzf is configured to use ripgrep as its file engine |

---

## 🖥️ Requirements

- Ubuntu 20.04+ or Debian 11+
- `sudo` access
- Internet connection
- Docker installed (for `ctop` and `lazydocker` to be useful)

The script is safe to re-run — aliases are only added once.

---

## 📋 What the Script Does, Step by Step

1. **Updates** the system and installs base dependencies
2. **Installs** `btop`, `duf`, `gdu`, `bat`, `ripgrep`, `fzf` from apt
3. **Adds the eza repository** and installs `eza`
4. **Installs yazi** — fetches the latest release binary from GitHub
5. **Installs zoxide** via official script and moves it to `/usr/local/bin`
6. **Installs curlie** via official script
7. **Installs ctop** — fetches the latest release binary from GitHub
8. **Installs lazydocker** via its official install script
9. **Installs Neovim** from the unstable PPA (latest version)
10. **Clones NvChad starter** config into `~/.config/nvim` (only if not already present)
11. **Detects your shell** and appends aliases + zoxide/fzf init to `~/.bashrc` or `~/.zshrc`

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
