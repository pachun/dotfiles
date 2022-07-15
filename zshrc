if [ "$TMUX" = "" ]; then exec tmux; fi

# enable colorized output
export CLICOLOR=1

# use vim keybindings
bindkey -v
switch_to_vim_command_mode=jj
bindkey -M viins $switch_to_vim_command_mode vi-cmd-mode

export EDITOR=nvim

alias t=tmux
alias e=exit
alias c=clear
alias vim=nvim
alias x=gitx
alias gs="git status"
alias pr="git pull-request"
alias mr="lab mr create origin develop3"
alias gco="git checkout"
alias gri="git rebase -i"
alias gl="git log"
alias gb="git branch"
alias gm="git merge"
alias wip="git add .; git commit -am 'wip' --no-verify"
alias lanip="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print \$2}'"
alias todos="vim ~/Library/Mobile\ Documents/com~apple~CloudDocs/Todos/$(date +%m-%d-%Y).todo.md"

# enable git completions
# https://www.macinstruct.com/tutorials/how-to-enable-git-tab-autocomplete-on-your-mac/
autoload -Uz compinit && compinit

# ZSH + Homebrew -> https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# ZSH syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function use_custom_prompt {
  # https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
  function allow_prompt_string_interpolation {
    setopt promptsubst
  }

  function directory {
    echo "%F{blue}%1~%f "
  }

  function vim_mode {
    if [[ $VIMODE == 'vicmd' ]]; then
      echo "%F{red}✘%f "
    else
      echo "%F{green}✔%f "
    fi
  }

  function keep_vim_mode_current {
    function zle-line-init zle-keymap-select {
      VIMODE=$KEYMAP
      zle reset-prompt
    }

    function editing {
      return $VIMODE == 'main'
    }

    zle -N zle-line-init
    zle -N zle-keymap-select
  }

  function status_colored_git_branch {
    if $(git rev-parse --is-inside-work-tree > /dev/null 2>&1)
    then
      git_branch=$(git branch | awk '/\*/ { print $2; }')
      git_status=$(git status)
      if [ -n "$(echo $git_status | grep "Changes not staged")" ]; then
        echo "%F{red}$git_branch%f "
      elif [ -n "$(echo $git_status | grep "rebasing")" ]; then
        echo "%F{red}(rebase in progress)%f "
      elif [ -n "$(echo $git_status | grep "Changes to be committed")" ]; then
        echo "%F{yellow}$git_branch%f "
      elif [ -n "$(echo $git_status | grep "Untracked files")" ]; then
        echo "%F{cyan}$git_branch%f "
      else
        echo "%F{green}$git_branch%f "
      fi
    else
      echo ""
    fi
  }

  allow_prompt_string_interpolation
  keep_vim_mode_current

  PROMPT='$(directory)$(status_colored_git_branch)$(vim_mode)'
}

use_custom_prompt
