sudo apt update
sudo apt install nala -y

sudo nala install zsh tldr btop gh unzip exa fzf ripgrep curl neovim -y

export PATH="$HOME/.oh-my-posh:$PATH"

# Oh My Posh
mkdir $HOME/.oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $HOME/.oh-my-posh/
curl -s https://raw.githubusercontent.com/alanmoyano/dotfiles/main/alan.omp.json > $HOME/.oh-my-posh/alan.omp.json

# Exportando el .zshrc
echo '# Oh My Posh
export PATH="$HOME/.oh-my-posh:$PATH"
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/alan.omp.json)"

# Alias
alias cls=clear
alias ls="exa --icons"
alias ll="ls -l"
alias l="ls -lah"
alias lt="ll -TL=2"' > ~/.zshrc

source ~/.zshrc
