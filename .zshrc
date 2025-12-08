# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall    
zstyle :compinstall filename '{{ home_dir }}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Word Seeking
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word