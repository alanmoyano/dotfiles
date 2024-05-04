#!/bin/zsh

# Estableciendo cual será el directorio en el que guardar todas la configuraciones de zsh
export ZSH_CONFIG=~/.zsh

# Configurando el historial
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$ZSH_CONFIG/.zsh_history

# Añadiendo Bun al path
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Configuando fzf
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden"
export FZF_DEFAULT_OPTS="--preview '$ZSH_CONFIG/.fzf-preview.sh {}' --cycle --bind=ctrl-p:toggle-preview"
export FZF_CTRL_R_OPTS="--preview-window=hidden"
export FZF_CTRL_T_COMMAND="fd --hidden"

# Configurando Chrome (de Windows) como el navegador por defecto
export BROWSER="$(which firefox)"

# Activando el autocomplete case insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Cargando los binds
[ -s "$ZSH_CONFIG/.zsh_binds" ] && source $ZSH_CONFIG/.zsh_binds
# Cargando los alias
[ -s "$ZSH_CONFIG/.zsh_aliases" ] && source $ZSH_CONFIG/.zsh_aliases

# Cargando los bindings y completions de fzf
eval "$(fzf --zsh)"

# Activando Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Activando fnm
eval "$(fnm env --use-on-cd)"
eval "$(fnm completions --shell zsh)"

# Cargando los plugins
[ -s "$ZSH_CONFIG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source $ZSH_CONFIG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -s "$ZSH_CONFIG/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source $ZSH_CONFIG/zsh-autosuggestions/zsh-autosuggestions.zsh

# Activando las completions de Bun
[ -s "/home/alan/.bun/_bun" ] && source "/home/alan/.bun/_bun"

# Iniciando el prompt
eval "$(starship init zsh)"
