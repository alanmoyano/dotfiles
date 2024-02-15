# Listando actualizaciones e instalando Nala
sudo apt update
sudo apt install nala -y

# Actualizando e instalando todos los programas
sudo nala upgrade -y
sudo nala install zsh tldr btop gh unzip exa fzf ripgrep curl neovim bat keychain -y

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Plugins de Zsh
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Exportando el .zshrc
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.zshrc >~/.zshrc
curl https://raw.githubusercontent.com/alanmoyano/dotfiles/main/.p10k.zsh >~/.p10k.zsh

# Poniendo zsh como shell
sudo chsh -s /bin/zsh $(whoami)

# Terminando
clear
echo "Reiniciar la terminal para aplicar los cambios"
