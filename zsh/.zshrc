# use nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=20000

# --------------#
# fzf 관련 설정 #
# --------------#
FD_OPTIONS="--follow --hidden --exclude .git --exclude Library --exclude node_modules --ignore-file .gitignore"
export FZF_DEFAULT_OPTS="--height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]
] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --previe
w-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers --theme=zenburn {} || less -f {}),f2:toggle-previ
ew,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# --hidden : include hidden files, --follow : follow sym link, --exclude : exclude directory
_fzf_compgen_path() {
  fd --hidden --follow --exclude "Library" --exclude "Photos Library.photoslibrary" --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude "Library" --exclude "Photos Library.photoslibrary" --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" "$@" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

# bat 관련 설정 : https://github.com/sharkdp/bat
# export BAT_CONFIG_PATH="$HOME/.config/bat/config"
export BAT_PAGER="less -R"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# vi type key_binding
bindkey -v

# define aliase
alias vim='nvim'
alias ls='lsd'

# source plugins
source ~/.zsh_plugins.sh

# starship load
eval "$(starship init zsh)"

