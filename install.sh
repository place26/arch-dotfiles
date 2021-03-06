# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
# for MacOS
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.which \
	nixpkgs.antibody \
    # nixpkgs.wireguard-go \
    nixpkgs.wireguard-tools \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.direnv \
	nixpkgs.starship \
	nixpkgs.lsd \
	nixpkgs.xclip

source ~/.nix-profile/etc/profile.d/nix.sh

# stow dotfiles
stow git
stow nvim
stow tmux
stow zsh
stow starsihp

# make zsh as a default shell
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install neovim plugins
# nvim --headless +PlugInstall +qall

# install tmux plugin manager
# git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
# tmux source ~/.tmux.conf
