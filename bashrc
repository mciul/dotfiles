# detect what kind of system we're running on
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='freebsd'
fi

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
if [[ $platform == 'linux' ]]; then
  alias ls='ls --color=auto'
elif [[ $platform == 'freebsd' ]]; then
  alias ls='ls -G'
fi
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

# commented out because I'm not sure I like it anymore,
# and it's having problems on Mac

# SHELL_SESSION_HISTORY=0
# HISTSIZE=9000
# HISTFILESIZE=$HISTSIZE
# HISTCONTROL=ignorespace:ignoredups

# _bash_history_sync() {
#   builtin history -a         #1 appends command to histfile
#   HISTFILESIZE=$HISTSIZE     #2 sets max size
#   builtin history -c         #3 clears current session history
#   builtin history -r         #4 reads the updated histfile and makes that the current history
# }

# history() {                  #5 overrides build in history to sync it before display
#   _bash_history_sync
#   builtin history "$@"
# }

# PROMPT_COMMAND=_bash_history_sync

# Include date and time in prompt
export PS1='\D{%b%d %T} \[\e[1m\]\h:\W $\[\e[0m\] '

export PERLVERSION=`perl -le '($_=$])=~s/[.0]+/./g; print'`

# Set vi as the history editor
#
# To use it, type <ESC>k at the command prompt
set -o vi

# Set shell timeout to one week
export TMOUT=$((60*60*24*7))

# force tmux to use 256 colors
alias tmux='tmux -2'

# print out the header line and line $1 of file $2 and transpose columns
tabline ()
{
    sed -n -e 1p -e $1p $2 | transpose-tsv
}

[ -f ~/.aws_credentials ] && source ~/.aws_credentials

[ -e ~/.bashrc.local ] && source ~/.bashrc.local
