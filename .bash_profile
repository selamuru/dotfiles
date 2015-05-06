# .bash_profile
#
# based on a chunk of jpb's bash profile.
#
# Load aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:/usr/local/bin:/usr/local/sbin

# Conditional additions
if [ -d /Developer/Tools ];then
  export PATH=$PATH:/Developer/Tools:/Developer/usr/bin:/Developer/usr/sbin
fi
if [ -d /opt/local/bin ]; then
  export PATH=$PATH:/opt/local/bin
fi

if [ -d /opt/local/sbin ]; then
  export PATH=$PATH:/opt/local/sbin
fi

BASH_ENV=$HOME/.bashrc
ENV=$HOME/.bashrc

if [ -d ~/.bash_completion.d ]; then
  for c in ~/.bash_completion.d/*; do
    . "$c"
  done
fi

export BASH_ENV ENV PATH PS1 DISPLAY

# from macosxhints.com
cdf() # cd's to frontmost window of Finder
{
  cd "`osascript -e 'tell application "Finder"' \
    -e 'set myname to POSIX path of (target of window 1 as alias)' \
    -e 'end tell' 2>/dev/null`"
}

# use ssh-add -K /path/to/your/secret/key to add the key password to your
# keychain. Then the ssh-add -k below will use your keychain and not harass
# you for a password.
if [ $(ssh-add -l | grep -c "The agent has no identities." ) -eq 1 ]; then
  if [ -f /mach_kernel ]; then
    ssh-add -k
  fi
fi

bind "set completion-ignore-case on"
shopt -s cdspell