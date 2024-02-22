#!/bin/bash

# Estableciendo cual será el directorio en el que guardar todas la configuraciones de zsh
ZSH_CONFIG=~/.zsh

# Creando el directorio donde irán las configuraciones de zsh
mkdir -p $ZSH_CONFIG

# Listando actualizaciones (si no apt no encuentra nada) e instalando Nala
sudo apt update
sudo apt install nala -y

# Actualizando básicos
sudo nala upgrade -y

# Añadiendo Homebrew al path
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH" 

# Instalando Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instalando todo
brew install -q gcc gh fzf wget curl git tlrc neovim ripgrep unzip btop zsh bat starship

# Activando los bindings de fzf
/home/linuxbrew/.linuxbrew/opt/fzf/install --all 

# Moviendo el archivo de fzf a la carpeta ZSH_CONFIG
mv ~/.fzf.zsh $ZSH_CONFIG/.fzf.zsh

# Instalando los plugins de zsh
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CONFIG/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CONFIG/zsh-autosuggestions

# Configuración de Zsh
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.zshrc > $ZSH_CONFIG/.zshrc
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.zsh_aliases > $ZSH_CONFIG/.zsh_aliases
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.zsh_binds > $ZSH_CONFIG/.zsh_binds

sudo ln -s /home/linuxbrew/.linuxbrew/bin/zsh /bin/zsh

# Poniendo zsh como shell por defecto
sudo chsh -s /bin/zsh $(whoami)

# Terminando
exec zsh
