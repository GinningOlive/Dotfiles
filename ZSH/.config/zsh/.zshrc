#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Stop weird glob error
setopt nonomatch

# Let lowercase match uppercase
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Do not save commands starting with a space to history
setopt HIST_IGNORE_SPACE

# If a command is a duplicate of any previous command, remove the older copy
setopt HIST_IGNORE_ALL_DUPS

# Save commands to history as you run them and import the commands run in other terminals into history
setopt SHARE_HISTORY

# Enable autocd
setopt AUTO_CD

# Recognize comments on the command line
setopt INTERACTIVE_COMMENTS

# Error on a redirections which would overwrite an existing file
setopt NO_CLOBBER

# Disable multios
setopt NO_MULTIOS

# Disable flow control
setopt NO_FLOW_CONTROL

# Use vim in ranger
export VISUAL=vim
export EDITOR="$VISUAL"

# Enable colors and change prompt:
autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

LFCD="/path/to/lfcd.sh"
if [ -f "$LFCD" ]; then
	source "$LFCD"
fi

bindkey -s '^o' '^U^Klfcd\n'
# bindkey -s '^o' '^U^K. ranger\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"

# Enable zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting; should be last.
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable powerlevel10k
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Enable ZVM
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# Export Terminal
export TERMINAL='Kitty'

# Enable fast-syntax-highlighting
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Added paths
PATH="$HOME/.local/bin:$PATH"

# Autojump or j
plugins=(
 autojump
)

# Pywal
(cat ~/.cache/wal/sequences &)
