set -o vi

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   #export EDITOR='nvim'
   export EDITOR='vim'
 fi

# paint with all the colors of the wind
export CLICOLOR=1

# ref: http://www.ibm.com/developerworks/linux/library/l-tip-prompt/
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \[\e[37m\]\W \[\e[36m\]\$(parse_git_branch)❯ \[\e[0m\]"

alias stripformat="pbpaste | pbcopy"

# git
alias gg="git grep -n --break --heading"
alias ga="git add"
alias gs="git status -sb"
alias gd="git diff"
alias gc="git commit -v"
alias gca="git commit -a -v"
alias glol="git log --format=oneline"
alias gdmno="git diff master --name-only"
alias gpom="git pull origin master"
alias gconflicts="git diff --name-only --diff-filter=U"

# hub
alias gist="hub gist create -oc"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

alias git-clean-branches='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

# silence mac zsh by default message
export BASH_SILENCE_DEPRECATION_WARNING=1

### Eternal bash history #####################################
# ---------------------
# from: https://stackoverflow.com/a/19533853/962091
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
########################################################
