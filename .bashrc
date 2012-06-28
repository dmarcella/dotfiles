export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/Users/dmarcella/bin:$PATH"

PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')

# mysql
alias mysql_start="mysql.server start"
alias mysql_stop="mysql.server stop"

# tomcat
alias tomcat_start="src/apache-tomcat-7.0.12/bin/startup.sh"
alias tomcat_stop="src/apache-tomcat-7.0.12/bin/shutdown.sh"

# filesystem
alias ..='cd ..'
alias -- -='cd -'
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ...='../..'
alias l='ls'
alias ll='ls -al'
alias lh='ls -Alh'

# shortcuts
alias d="cd ~/Dropbox"
alias dd="cd ~/Dropbox/Development"
alias reload="source ~/.profile"

# textmate
alias m.='mate .'
alias m='mate'

# sublime text 2
alias s.='subl .'
alias s='subl'

# git
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

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

ORANGE="\e[38;5;208m"
RED="\e[38;5;196m"
NO_COLOUR="\[\033[0m\]"

export PS1="$RED\\w $NO_COLOUR$ORANGE\$(parse_git_branch)$NO_COLOUR\\$ "

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash  ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash 
fi