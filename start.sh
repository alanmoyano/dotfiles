# Listando actualizaciones e instalando Nala
sudo apt update
sudo apt install nala -y

# Actualizando e instalando todos los programas
sudo nala upgrade -y
sudo nala install zsh tldr btop gh unzip exa fzf ripgrep curl neovim bat keychain -y

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Exportando el .zshrc
echo 'if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Alias
alias cls=clear
alias ls="exa --icons"
alias ll="ls -l"
alias l="ls -lah"
alias lt="ll -TL=2"
alias bat="batcat --paging=never"

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >~/.zshrc

# Poniendo zsh como shell
sudo chsh -s /bin/zsh $(whoami)

clear
echo "Reiniciar la terminal para aplicar los cambios"
