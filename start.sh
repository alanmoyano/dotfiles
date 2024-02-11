sudo apt update
sudo apt install nala -y

sudo nala install zsh tldr btop gh unzip exa fzf ripgrep curl -y

# Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Tema de Oh My Posh
curl -s https://raw.githubusercontent.com/alanmoyano/dotfiles/main/alan.omp.json > ~/.omp-theme/alan.omp.json

# Exportando el .zshrc
echo '" Oh My Posh
eval "$(oh-my-posh init zsh --config ~/.omp-theme/alan.omp.json)"

# Alias
alias cls=clear
alias ls="exa --icons"
alias ll="ls -l"
alias l="ls -lah"
alias lt="ll -TL=2"' > ~/.zshrc

source ~/.zshrc
