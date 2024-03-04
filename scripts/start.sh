#!/bin/bash

# Estableciendo cual será el directorio en el que guardar todas la configuraciones de zsh
ZSH_CONFIG=~/.zsh

# Creando el directorio donde irán las configuraciones de zsh
mkdir -p $ZSH_CONFIG

# Sacando el mensaje diario de wsl
touch ~/.hushlogin

# Listando actualizaciones (si no apt no encuentra nada) e instalando Nala
sudo apt update
sudo apt install nala -y

# Actualizando básicos
sudo nala upgrade -y

# Instalando build-essential
sudo nala install build-essential -y

# Añadiendo Homebrew al path
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"' >>.bashrc
source .bashrc

# Instalando Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instalando todo
brew install gh fzf wget curl git tlrc neovim ripgrep unzip btop zsh bat starship eza file fd nvm

# Creando el directorio para que nvm anda
mkdir -p ~/.nvm

# Activando los bindings de fzf
/home/linuxbrew/.linuxbrew/opt/fzf/install --all

# Moviendo el archivo de fzf a la carpeta ZSH_CONFIG
mv ~/.fzf.zsh $ZSH_CONFIG/.fzf.zsh

# Descargando el script de preview para fzf
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.fzf-preview.sh >~/.fzf-preview.sh
chmod +x ~/.fzf-preview.sh

# Instalando los plugins de zsh
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CONFIG/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CONFIG/zsh-autosuggestions

# Configuración de Zsh
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.zshrc >$ZSH_CONFIG/.zshrc
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.zsh_aliases >$ZSH_CONFIG/.zsh_aliases
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.zsh_binds >$ZSH_CONFIG/.zsh_binds

# Creando el directorio para la configuración del prompt
mkdir -p ~/.config

# Configuración del prompt
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/starship.toml >~/.config/starship.toml

# Haciendo los enlaces para anden las cosas
sudo ln -s /home/linuxbrew/.linuxbrew/bin/zsh /bin/zsh
rm ~/.zshrc
ln -s ~/.zsh/.zshrc ~/.zshrc

# Poniendo zsh como shell por defecto
sudo chsh -s /bin/zsh $(whoami)
export SHELL=/bin/zsh

# Instalando Bun
curl -fsSL https://bun.sh/install | bash

# Terminando
exec zsh
