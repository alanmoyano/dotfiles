#!/bin/zsh

# Estableciendo cual será el directorio en el que guardar todas la configuraciones de zsh
export ZSH_CONFIG=~/.zsh

# Configurando el historial
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$ZSH_CONFIG/.zsh_history

# Cargando los binds
source $ZSH_CONFIG/.zsh_binds
# Cargando los alias
source $ZSH_CONFIG/.zsh_aliases

# Configuando fzf
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden"
export FZF_DEFAULT_OPTS="--preview '~/.fzf-preview.sh {}' --cycle --bind=ctrl-p:toggle-preview"
export FZF_CTRL_R_OPTS="--preview-window=hidden"
export FZF_CTRL_T_COMMAND="fd --hidden"

# Cargando los bindings y completions de fzf
[ -f $ZSH_CONFIG/.fzf.zsh ] && source $ZSH_CONFIG/.fzf.zsh

# Cargando los plugins
source $ZSH_CONFIG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CONFIG/zsh-autosuggestions/zsh-autosuggestions.zsh

# Añadiendo Homebrew al path
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Configurando Chrome (de Windows) como el navegador por defecto
export BROWSER="/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe"

# Activando las completions de Bun
[ -s "/home/alan/.bun/_bun" ] && source "/home/alan/.bun/_bun"

# Añadiendo Bun al path
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Configurando nvm
export NVM_DIR="$HOME/.nvm"

# Activando nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  

# Activando las completions de nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  

# Iniciando el prompt
eval "$(starship init zsh)"
