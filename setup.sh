#!/bin/bash

# 1. Update system and install base dependencies
echo "--- Updating system and installing base packages ---"
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git gpg software-properties-common

# 2. Install standard tools (btop, duf, gdu, bat, ripgrep, fzf)
echo "--- Installing btop, duf, gdu, bat, ripgrep, fzf ---"
sudo apt install -y btop duf gdu bat ripgrep fzf

# 3. Install eza
echo "--- Installing eza ---"
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# 4. Install zoxide (smart cd)
echo "--- Installing zoxide ---"
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
sudo cp $HOME/.local/bin/zoxide /usr/local/bin/

# 5. Install curlie (human-friendly curl)
echo "--- Installing curlie ---"
CURLIE_VERSION=$(curl -s https://api.github.com/repos/rs/curlie/releases/latest | grep tag_name | cut -d '"' -f 4)
wget -q "https://github.com/rs/curlie/releases/download/${CURLIE_VERSION}/curlie_${CURLIE_VERSION#v}_linux_amd64.tar.gz"
tar -xzf curlie_${CURLIE_VERSION#v}_linux_amd64.tar.gz curlie
sudo install curlie /usr/local/bin/
rm curlie*

# 6. Install ctop (top for Docker containers)
echo "--- Installing ctop ---"
CTOP_VERSION=$(curl -sSL https://api.github.com/repos/bcicen/ctop/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
sudo wget -qO /usr/local/bin/ctop "https://github.com/bcicen/ctop/releases/download/${CTOP_VERSION}/ctop-${CTOP_VERSION#v}-linux-amd64"
sudo chmod +x /usr/local/bin/ctop

# 7. Install lazydocker
echo "--- Installing lazydocker ---"
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
sudo install $HOME/.local/bin/lazydocker /usr/local/bin/

# 8. Install latest Neovim and NvChad
echo "--- Installing Neovim (unstable PPA) and NvChad ---"
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install -y neovim
if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1
fi

# 9. Detect Shell and Add Aliases
echo "--- Configuring aliases ---"
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    CONF_FILE="$HOME/.zshrc"
else
    CONF_FILE="$HOME/.bashrc"
fi

# Use a marker to avoid double-entry
if ! grep -q "# --- CUSTOM ALIASES ---" "$CONF_FILE"; then
cat << 'EOF' >> "$CONF_FILE"

# --- CUSTOM ALIASES ---
alias vi="nvim"
alias vim="nvim"
alias bat="batcat"
alias lzd="lazydocker"
alias rg="rg --color=auto"
alias curl="curlie"

# --- EZA ALIASES ---
alias ls='eza --icons --group-directories-first'
alias ll='eza -lha --icons --group-directories-first --git --header'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias lr='eza -lh --sort=modified --icons'

# --- TOOLS INIT ---
eval "$(zoxide init bash)"
# FZF integration
source <(fzf --bash)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
EOF
    echo "Aliases and tools init added to $CONF_FILE"
else
    echo "Aliases already exist in $CONF_FILE, skipping."
fi

echo "--------------------------------------------------"
echo "SETUP COMPLETED SUCCESSFULLY!"
echo "Run: source $CONF_FILE"
echo "--------------------------------------------------"
