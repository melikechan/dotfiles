#########################
########## ZSH ##########
#########################

######## HISTORY ########
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100

######### MISC ##########
setopt extendedglob
bindkey -e

###### COMPLETION #######
zstyle :compinstall filename '{{ home_dir }}/.zshrc'

autoload -Uz compinit
compinit

####### BEHAVIOR ########
# Word Seeking
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

#########################
######## EXPORTS ########
#########################
export GPG_TTY=$(tty)

#########################
####### FUNCTIONS #######
#########################

# CLEAN ORPHANED PACKAGES
package-cleanup() {
    if [[ -n $(pacman -Qdtq) ]]; then
        sudo pacman -Rns $(pacman -Qdtq)
    else
        echo "No orphaned packages found."
    fi
}


#########################
########## NVM ##########
#########################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#########################
####### MINICONDA #######
#########################
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