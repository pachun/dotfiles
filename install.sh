ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/hushlogin" ~/.hushlogin

# -----------
# git
# -----------
ln -s "$PWD/gitignore" ~/.gitignore
ln -s "$PWD/gitconfig" ~/.gitconfig

# -----------
# tmux
# -----------
ln -s "$PWD/tmux.conf" ~/.tmux.conf

# -----------
# neovim
# -----------
ln -s "$PWD/config" ~/.config

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

vim +'PlugInstall --sync' +qa
