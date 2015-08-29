# we want the various sbins on the path along with /usr/local/bin
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:$PATH"

# put ~/bin on PATH if you have it
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

# databases
alias psql_start="postgres -D /usr/local/var/postgres"
alias mongo_start="mongod --config /usr/local/etc/mongod.conf"

# filesystem
alias ..="cd .."         # Go up one directory
alias ...="cd ../.."     # Go up two directories
alias ....="cd ../../.." # Go up three directories
alias -- -="cd -"        # Go back
alias l="ls"
alias ll="ls -Alh"
alias fn="find . -name"
alias hi="history | tail -20"

# shortcuts
alias d="cd ~/Dropbox"
alias reload="source ~/.bashrc && echo 'Done!'"
alias ps="python -m SimpleHTTPServer 4000"
alias editgit='atom ~/.gitconfig'
alias editbash='atom ~/.bashrc'

## Switch repos
DIR=~/Documents/projects
alias h='cd ~/'
alias w='cd ${DIR}'

# applications
alias a.="atom ."
alias a="atom"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

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

source ~/.jump
