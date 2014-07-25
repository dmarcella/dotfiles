# we want the various sbins on the path along with /usr/local/bin
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:$PATH"

# put ~/bin on PATH if you have it
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

# mysql
alias mysql_start="mysql.server start"
alias mysql_stop="mysql.server stop"

# postgresql
alias psql_start="postgres -D /usr/local/var/postgres"

# mongodb
alias mongo_start="mongod --config /usr/local/etc/mongod.conf"

# filesystem
alias ..="cd .."         # Go up one directory
alias ...="cd ../.."     # Go up two directories
alias ....="cd ../../.." # Go up three directories
alias -- -="cd -"        # Go back
alias tlf="tail -f"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias l="ls"
alias ll="ls -Alh"
alias fn="find . -name"
alias hi="history | tail -20"

# shortcuts
alias d="cd ~/Dropbox"
alias reload="source ~/.bashrc"

# textmate
alias m.="mate ."
alias m="mate"

# github atom
alias a.="atom ."
alias a="atom"

# git
alias g="git"
alias ga="git add"
alias gau='git add -u'
alias gl="git log"
alias gs="git status"
alias gss="git status --short"
alias gd="git diff"
alias gds="git diff --staged"
alias gdt="git difftool"
alias gdts="git difftool --staged"
alias gm="git commit -m"
alias gma="git commit -am"
alias gb="git branch"
alias gc="git checkout"
alias gra="git remote add"
alias grr="git remote rm"
alias gpu="git pull"
alias gcl="git clone"
alias grh="git reset HEAD"
alias undo="git reset --soft HEAD^"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

export PS1='\[\033[0;36m\]\w \[\033[0;31m\]$(parse_git_branch)\[\033[0m\]$ '

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash  ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Adding npm
export PATH=$PATH:/usr/local/share/npm/bin

### Adding Activator
export PATH=$PATH:/Users/dmarcella/src/activator-1.2.3

### http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    \ls -l $MARKPATH | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
_jump() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$( ls $MARKPATH )" -- $cur) )
}
complete -F _jump jump
