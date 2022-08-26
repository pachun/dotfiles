# Nick Pachulski's Dotfiles

[Install Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) (Do this first. It takes a long time.)

Install the fonts in `/MonoLisa`

Install `tmux-256color` for tmux

```
curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
/usr/bin/tic -xe tmux-256color terminfo.src
# details here => https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95
```

Install [homebrew](https://brew.sh)

```
brew bundle
```

Install the dotfiles

```
./install.sh
```

Install the prettier executable

```
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
npm install -g prettier
```

iTerm2 preferences

```
# functional customizations:

Profiles -> Terminal -> Scrollback lines = 0
General -> Selection -> Applications in terminal may access clipboard = CHECKED

# appearance customizations:

Appearance -> Theme -> Minimal

Appearance -> Windows -> Hide Scrollbars
Appearance -> Windows -> Show window number in title bar = UNCHECKED

Profiles -> Text -> Font -> MonoLisa
Profiles -> Text -> Font Size -> 16
Profiles -> Text -> Use thin strokes for anti-aliased text -> never

Profiles -> Colors -> Color Presets -> Import (Everforest - Dark (Hard))
```
