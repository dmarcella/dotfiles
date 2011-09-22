export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

alias mysql_start="sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist"
alias mysql_stop="sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist"

alias tomcat_start="src/apache-tomcat-7.0.12/bin/startup.sh"
alias tomcat_stop="src/apache-tomcat-7.0.12/bin/shutdown.sh"

alias ..='cd ..'
alias -- -='cd -'
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ...='../..'
alias l='ls'
alias ll='ls -al'
alias lh='ls -Alh'

alias m.='mate .'
alias m='mate'

alias g='git'
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

export PS1="[$YELLOW\\w$NO_COLOUR]$RED\$(parse_git_branch)$NO_COLOUR\\$ "

# git completion
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

# bash completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi