# ---------------------------------------------
# Set PATHs
# ---------------------------------------------

export PATH=$PATH:/usr/local/bin/r

# ---------------------------------------------
# Terminal History
# ---------------------------------------------

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
export HISTTIMEFORMAT='%b %d %H:%M:%S: ' # reformat timestamp
shopt -s histappend                      # append to history, don't overwrite it
set cmdhist

# ---------------------------------------------
# Terminal Colors
# ---------------------------------------------

# Add color to terminal
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS="ex=31:di=36:ln=35"
export LS_COMMON=-G
export CLICOLOR=1

# ---------------------------------------------
# Command prompt
# ---------------------------------------------

# Setup colors for git statuses in prompt
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
reset=$(tput sgr0)

# Alias g to git such that git completion rules are preserved
complete -o bashdefault -o default -o nospace -F _git g

# Git states for prompt
# * - unstaged
# + - staged
# $ - stashed
# % - untracked
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

# Prompt
export PS1='\[\e[0;31m\]♥  \[\e[1;36m\]\@ `if [ $? = 0 ]; then echo "\[\e[0;32m\]✔"; else echo "\[\e[0;31m\]✘"; fi` \[\e[00;37m\]\u\[\e[01;37m\]:$(unalias git; __git_ps1 "\[$red\][\[$green\]%s\[$red\]]\[$reset\]""%s\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

# ---------------------------------------------
# Less Configs
# ---------------------------------------------
export PAGER="less -eiMRswX"
export LESS="-eiMRswX"
export MANPAGER=$PAGER

# ---------------------------------------------
# Other Config Files
# ---------------------------------------------

# Git Prompt
if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
fi

# Autocompletion for Git
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# AWS Credentials
if [ -f ~/.awscred ]; then
  . ~/.awscred
fi

# Autocompletion
if [ -f /opt/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi