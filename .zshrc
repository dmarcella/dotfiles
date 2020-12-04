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
alias reload="source ~/.zshrc && echo 'Done!'"
alias ps="python -m SimpleHTTPServer 4000"
alias editgit='code ~/.gitconfig'
alias editzsh='code ~/.zshrc'

# Find and set branch name var if in git repository.
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%F{green}%~%f %F{red}$(parse_git_branch)%f:'
