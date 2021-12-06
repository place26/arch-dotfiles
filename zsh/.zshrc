[[ $TMUX = "" ]] && export TERM="xterm-256color"

# zsh prompt
# # Personal prompt setting: simplicity is best
# # 참조: https://www.youtube.com/watch?v=nEvsWQrKVcQ
# # use git status info
# autoload -Uz vcs_info
# precmd() { vcs_info }
# precmd_functions+=( precmd_vcs_info )

# zstyle ':vcs_info:git:*' formats 'on branch %b '
# setopt PROMPT_SUBST

# PROMPT='%F{040}%n%f  %F{166}%m%f  %F{031}${PWD/#$HOME/~}%f ${vcs_info_msg_0_}
# %{$fg_bold[white]%}>%{$reset_color%} '

# # Format the git branch name in the prompt
# zstyle ':vcs_info:git:*' formats 'on %F{011} %b%f'

# yubico 키 사용을 위한 설정
# 참고: https://aditsachde.com/posts/yubikey-ssh/
# SSH_AUTH_SOCK="~/.ssh/agent"

HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=20000

# vi type key_binding
bindkey -v

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/settings:$PATH
export PATH=$HOME/.nix-profile/bin/zsh

# 한글 환경을 위한 locale 설정: synologynote/MacOS/Mac에서 Locale 오류 해결 법
# LC_ALL=ko_KR.UTR-8로 설정할 경우 모든 시스템 메시지가 한글로 표시 됨
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# --------------#
# fzf 관련 설정 #
# --------------#
FD_OPTIONS="--follow --hidden --exclude .git --exclude Library --exclude node_modules --ignore-file .gitignore"
export FZF_DEFAULT_OPTS="--height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers --theme=zenburn {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
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

# GnuPG와 관련된 설정, 해당 터미널과 해당 ssh 세션으로 정보창 표시
# .gnupg/gpg-agent.confd에서 pinentry 설정
export GPG_TTY=$(tty)
# export GPG_TTY

# 해당 ssh 세션창: https://juliansimioni.com/blog/troubleshooting-gpg-git-commit-signing/
# if [[ -n "$SSH_CONNECTION" ]]; then
  # export PINENTRY_USER_DATA="USE_CURSES=1"
# fi

# 관리 일원화를 위한 환경설정 파일 처리: 모두 ~/.config/ 아래에서 통합관리
# export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.config/nvim/init.vim'
.tmux.conf path 설정 : ~/.config/tmux/tmux.conf

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# Homebrew Domain
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# For MacOS show/hide hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias vim=nvim
alias ll="exa -alh"
alias ls="lsd"

# WireGuard
# alias txwireguard="wg-quick up wg0"

# source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# # kitty autocomplete enable  
# autoload -Uz compinit 
# compinit 
# # Completion for kitty 
# kitty + complete setup zsh | source /dev/stdin

# [ -f ~/.config/fzf/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh

# starship load
eval "$(starship init zsh)"

# use nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; finder
