# ---------------------------------------------
# Git
# ---------------------------------------------
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gr='git rebase'
alias gb='git branch'
alias gcp='git cherry-pick'
alias gl='git l'
alias gg='git grep'
alias git='hub'
alias clean_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# ---------------------------------------------
# Unix
# ---------------------------------------------
alias ls='ls -F $LS_COMMON'
alias ll='ls -FGlAhp'
alias grep='grep --color=auto'

# ---------------------------------------------
# Useful Functions
# ---------------------------------------------

# Set title of terminal window
function title { echo -ne "\033]0;$1\007"; }

# Moves a file to the MacOS trash
function trash { command mv "$@" ~/.Trash; }

# Extract most know archives with one command
function extract {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
       esac
   else
       echo "'$1' is not a valid file"
   fi
}

# Find file under the current directory
function ff { find . -name "$@"; }

# Pull all git repos and print output
function pull {
  find ~/repos -type d -name .git \
    | xargs -n 1 dirname \
    | sort \
    | while read line; do echo $line && cd $line && git pull; done
}