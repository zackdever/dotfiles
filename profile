### path ##################################################
export PATH="./node_modules/.bin:$PATH"
export PATH="$PATH:/opt/android-sdk-macosx/tools:/opt/android-sdk-macosx/platform-tools"
# check /usr/local/bin before /usr/bin
# global could be overridden http://stackoverflow.com/q/5364614/962091
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/share/python:$PATH
export PYTHONPATH="$PYTHONPATH:$(brew --prefix)/lib/python2.7/site-packages"

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

### alias #################################################
# git
alias git="hub"
alias ga="git add"
alias gs="git status"
alias gd="git diff"
alias gc="git commit -v"
alias gca="git commit -a -v"
alias glol="git log --format=oneline"
alias gpush="git push"
alias gpull="git pull"
alias gpushtags="git push --tags"

alias ..='cd ..'
alias l='ls -l'
alias la='ls -la'
alias icanhaz='brew install'
alias ppj='python -mjson.tool'
alias stripformat='pbpaste | pbcopy'

function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

### bash ##################################################
# paint with all the colors of the wind
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# ref: http://www.ibm.com/developerworks/linux/library/l-tip-prompt/
export PS1="\u@\h \[\e[37m\]\W \[\e[36m\]$ \[\e[0m\]"
set -o vi

### source ################################################
if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash; fi
if [ -f ~/.kinobi ]; then . ~/.kinobi; fi

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
