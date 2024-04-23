# -----------
# zsh
# -----------
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/zprofile" ~/.zprofile
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
# psql (use vim hokeys in psql)
# -----------
ln -s "$PWD/inputrc" ~/.inputrc

# -----------
# neovim
# -----------
ln -s "$PWD/vimrc" ~/.vimrc
mkdir -p ~/.config/nvim
ln -s "$PWD/config/nvim/init.vim" ~/.config/nvim/init.vim
ln -s "$PWD/config/nvim/coc-defaults.vim" ~/.config/nvim/coc-defaults.vim
ln -s "$PWD/config/nvim/coc-settings.json" ~/.config/nvim/coc-settings.json

# -----------
# iCloud (enables: `vim ~/iCloud/...` without remembering where icloud docs are stored, keeping file/folder name completion)
# -----------
ln -s "/Users/$USER/Library/Mobile Documents/com~apple~CloudDocs" ~/iCloud

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

vim +'PlugInstall --sync' +qa
