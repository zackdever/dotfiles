### path ##################################################
# check /usr/local/bin before /usr/bin
# global could be overridden http://stackoverflow.com/q/5364614/962091
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/share/python:$PATH
export PYTHONPATH="$PYTHONPATH:$(brew --prefix)/lib/python2.7/site-packages"
export PYTHONPATH="$PYTHONPATH:$HOME/lib/python/"
export PYTHONPATH="$PYTHONPATH:$HOME/repo/rdio/contrib"
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/opt/arcanist/bin
export PATH=$PATH:$HOME/bin
export PATH="./node_modules/.bin:$PATH"
export PATH=$PATH:/usr/local/share/npm/bin

export EDITOR=/usr/bin/vim
# virtualenvwrapper
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/repo:$HOME/sandbox
#source /usr/local/bin/virtualenvwrapper.sh

### alias #################################################
# git
alias git="hub"
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
#git diff --name-only master <branch> // List of the changed files

alias arcpaste='arc paste | copyarcpaste'
alias runserver='./manage.py runcpdebug 0.0.0.0:8000'
alias copy='pbcopy <'
alias ..='cd ..'
alias l='ls -l'
alias la='ls -la'
alias icanhaz='brew install'
alias ppj='python -m json.tool'
alias stripformat='pbpaste | pbcopy'
alias delpyc="find . -name '*.py[co]' -exec rm -v {} \;"

function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

### bash ##################################################
# paint with all the colors of the wind
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# ref: http://www.ibm.com/developerworks/linux/library/l-tip-prompt/
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[37m\]\W \[\e[36m\]\$(parse_git_branch)$ \[\e[0m\]"
set -o vi

### source ################################################
#if [ -f ~/.git-completion.bash ]; then . ~/.git-completion.bash; fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source /usr/local/opt/arcanist/resources/shell/bash-completion

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

. ~/.completion/django_bash_completion
