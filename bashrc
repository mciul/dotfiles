[ -e ~/.bashrc.local ] && source ~/.bashrc.local

# environment stuff to find things that you might need
LESS=-rXF; export LESS
EDITOR=/usr/bin/vi; export EDITOR
VISUAL=/usr/bin/vi; export VISUAL

export MANPATH
export COLUMNS

export SP_BCTF=utf-8

PATH=$PATH:~/bin

# Simple aliases to save typing

alias dus='du -s'
alias env='printenv'
alias ls='ls --color=auto'
alias lf='ls -hF'
alias lc='wc -l'
alias ll='/bin/ls -l'        # directory with size
alias lla='/bin/ls -lA'
alias lll='/bin/ls -lL'      # follow symlinks
alias llla='/bin/ls -lLA'

llth () 
{ 
    ls -lt $1 | head
}

# shares history between tabs with prompt_command
HISTSIZE=9000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups

_bash_history_sync() {
  builtin history -a         #1 appends command to histfile
  HISTFILESIZE=$HISTSIZE     #2 sets max size
  builtin history -c         #3 clears current session history
  builtin history -r         #4 reads the updated histfile and makes that the current history
}

history() {                  #5 overrides build in history to sync it before display
  _bash_history_sync
  builtin history "$@"
}

PROMPT_COMMAND=_bash_history_sync

export PERLVERSION=`perl -le '($_=$])=~s/[.0]+/./g; print'`

# Set vi as the history editor
#
# To use it, type <ESC>k at the command prompt
set -o vi

# Set shell timeout to one week
export $TMOUT=$((60*60*24*7))
