# use local node packages
export PATH="./node_modules/.bin:$PATH"

# paint with all the colors of the wind
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# ref: http://www.ibm.com/developerworks/linux/library/l-tip-prompt/
export PS1="\u@\h \[\e[37m\]\W \[\e[36m\]$ \[\e[0m\]"

# typing sucks
alias s="git status"
alias d="git diff"
alias git="hub"
set -o vi

# check /usr/local/bin before /usr/bin
# global could be overridden http://stackoverflow.com/q/5364614/962091
export PATH="/usr/local/bin:$PATH"

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

#source ~/.kinobi
if [ -f ~/.kinobi ]; then . ~/.kinobi; fi

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
