source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle command-not-found
antigen bundle git
antigen bundle lein
antigen bundle pip
antigen bundle vi-mode

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
antigen theme agnoster
#antigen theme pygmalion
# antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Created by `userpath` on 2019-10-09 22:49:18

# https://medium.com/@briantorresgil/definitive-guide-to-python-on-mac-osx-65acd8d969d0
# pipx
export PATH="$PATH:~/.local/bin"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# poetry
# export PATH="$HOME/.poetry/bin:$PATH"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# commands to override pip restriction above.
# use `gpip` or `gpip3` to force installation of
# a package in the global python environment
# Never do this! It is just an escape hatch.
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}
# https://github.com/brandonbloom/fipp/issues/60#issuecomment-470468952
#alias lein="LEIN_USE_BOOTCLASSPATH=no lein"
export LEIN_USE_BOOTCLASSPATH=no

## History file configuration
# [ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=$HISTSIZE
export HIST_STAMPS="mm/dd/yyyy"

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
alias stripformat='pbpaste | pbcopy'

# git
alias gg="git grep -n --break --heading"
alias ga="git add"
alias gs="git status -sb"
alias gd="git diff"
alias gc="git commit -v"
alias gca="git commit -a -v"
alias glol="git log --format=oneline"
alias gpush="git push"
alias gpull="git pull"
alias gpushtags="git push --tags"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
