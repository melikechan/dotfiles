# melikechan's zsh config

# History
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100

# Misc
setopt extendedglob
bindkey -e

# Completion
zstyle :compinstall filename '{{ home_dir }}/.zshrc'

autoload -Uz compinit
compinit

# Behavior
# Word seeking
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Prompt
PROMPT='%n@%m:%F{cyan}%~%f %# '

# Exports
export GPG_TTY=$(tty)

# Functions
# Clean orphaned packages
package-cleanup() {
    local found=0
    if command -v paru &>/dev/null && [[ -n $(paru -Qdtq) ]]; then
        paru -Rns $(paru -Qdtq)
        found=1
    fi
    if [[ -n $(pacman -Qdtq) ]]; then
        sudo pacman -Rns $(pacman -Qdtq)
        found=1
    fi
    if [[ $found -eq 0 ]]; then
        echo "No orphaned packages found."
    fi
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/melikechan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Miniconda
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('{{ home_dir }}/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "{{ home_dir }}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "{{ home_dir }}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="{{ home_dir }}/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Activate default env
conda activate {{ start_env_name }}

# zoxide
eval "$(zoxide init zsh)"