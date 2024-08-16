#!/bin/bash

# Determine if the system is in dark mode
CURRENT_THEME=$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light")

# Re-source the appropriate TMUX config based on the current theme
if [ "$CURRENT_THEME" == "Dark" ]; then
    tmux source-file ~/.tmux.dark-theme.conf
else
    tmux source-file ~/.tmux.light-theme.conf
fi

# Re-source the main TMUX config to apply the changes
tmux source-file ~/.tmux.conf
