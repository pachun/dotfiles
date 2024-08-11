# my dotfiles

![iTerm](https://i.imgur.com/B4s6HPG.png)

[Install Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) (Do this first. It takes a long time.)

While you wait,

- Clean up all the stock apps in the dock
- Zip through and tweak each system preference (definitely remap caps lock to control)
- Adjust the preset folders on the left of each Finder window (definitely add your home folder)

[Install homebrew](https://brew.sh)

```sh
eval "$(/opt/homebrew/bin/brew shellenv)"
```

[Do this GitHub thing](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [this other GitHub thing](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

Clone this repository

```sh
git clone git@github.com:pachun/dotfiles.git
```

Install the fonts in `/MonoLisa`

Install `tmux-256color` for tmux

```sh
curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
/usr/bin/tic -xe tmux-256color terminfo.src
# details here => https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95
```

Install homebrew packages

```sh
brew bundle
```

Install the dotfiles

```sh
./install.sh
```

Install the vim plugs

```sh
vim +'PlugInstall --sync' +qa
```

Start postgres now & every time you login (it's important to do this before `bundle`ing a rails project including the `pg` gem.)

```sh
brew services start postgresql
```

Install the prettier executable

```sh
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
npm install -g prettier # in a new terminal tab or window to source the npm installation
```

iTerm2 preferences:

- Profiles 👉 Terminal 👉 Scrollback lines = 0
- General 👉 Selection 👉 Applications in terminal may access clipboard = CHECKED
- Appearance 👉 Theme 👉 Minimal
- Appearance 👉 Windows 👉 Hide Scrollbars
- Appearance 👉 Windows 👉 Show window number in title bar = UNCHECKED
- Profiles 👉 Text 👉 Font 👉 MonoLisa
- Profiles 👉 Text 👉 Font Size 👉 16
- Profiles 👉 Text 👉 Use thin strokes for anti-aliased text 👉 never
- Profiles 👉 Colors 👉 Color Presets 👉 Import 👉 Everforest - Dark (Hard) (_and then select it_)

Other useful things for a new machine...

```sh
# for yourself
brew install --cask rectangle # https://formulae.brew.sh/cask/rectangle
brew install --cask spotify # https://formulae.brew.sh/cask/spotify

# for work
brew install --cask nordvpn # https://formulae.brew.sh/cask/nordvpn
brew install --cask slack # https://formulae.brew.sh/cask/slack

# for fun
brew install --cask discord # https://formulae.brew.sh/cask/discord
brew install --cask telegram # https://formulae.brew.sh/cask/telegram
```

[Install Newtown](https://newtonhq.com)

# New Notes

After brew install, set iterm font to meslo nerd font

brew install ripgrep & we want node; they do it with brew; we use asdf

Install both iterm themes and set them to the system color
