# Listando actualizaciones (si no apt no encuentra nada) e instalando Nala
sudo apt update
sudo apt install nala -y

# Actualizando básicos
sudo nala upgrade -y

# Instalando Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instalando todo
brew install gcc gh fzf wget curl git tlrc neovim ripgrep unzip btop zsh

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' > .zshrc

exec zsh