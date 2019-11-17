set -U fish_greeting "Impress me."

set -x PATH $PATH $HOME/Documents/notes/scripts
set -x PATH $PATH $HOME/go/bin
set -x PATH $PATH $HOME/flutter/bin

alias vim=nvim
alias ls=lsd
alias cat=bat

fish_vi_key_bindings

source $HOME/.cargo/env
