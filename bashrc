source /home/skel/common_bashrc

# environment stuff to find things that you might need
LESS=-rXF; export LESS
EDITOR=/usr/bin/vi; export EDITOR
VISUAL=/usr/bin/vi; export VISUAL

PRINTER=LDC-Mailroom;	export PRINTER
PSPRINTER=$PRINTER;	export PSPRINTER
export MANPATH
export COLUMNS

export SHLOOP_PATH=/pkg/ldc/pubs/shl:~/shl:/ldc/projects/lvdid_cts/bin
export SQL_PATH=/pkg/ldc/pubs/sql:~/sql:/ldc/projects/lvdid_cts/sql
export SP_BCTF=utf-8

PATH=$PATH:/XBanks/Arabic/bin/:~/bin:~/sanity
if [[ `uname -n` == 'thing4.ldc.upenn.edu' ]]; then
    # alias svn='~/bin/svn'
    # alias svnadmin='~/bin/svnadmin'
    # alias svndumpfilter='~/bin/svndumpfilter'
    # alias svnlook='~/bin/svnlook'
    # alias svnserve='~/bin/svnserve'
    # alias svnsync='~/bin/svnsync'
    # alias svnversion='~/bin/svnversion'
    PATH=~/bin:$PATH
fi

# Simple aliases to save typing

unalias rm
alias dus='du -s'
alias env='printenv'
alias ll='/bin/ls -l'        # directory with size
alias lla='/bin/ls -lA'
alias lll='/bin/ls -lL'      # follow symlinks
alias llla='/bin/ls -lLA'

alias dget='lexget -a moodle_d'
alias mget='lexget -a moodle'

alias btu='ped -r Buckwalter -w utf8'
alias utb="ped -r utf8 -e 's/(\p{InArabic}+)/encode(\"Buckwalter\",\$1)/eg'"

llth () 
{ 
    ls -lt $1 | head
}

PERLLIB=$PERLLIB:/usr/local/lib/perl5/site_perl/5.8.7:/usr/local/lib/perl5/site_perl/5.8.7/mach
# PYTHONPATH=/pkg/ldc/freebsd/pkg/aglib-sk-2.0.1-2/lib/ag/python; export PYTHONPATH
export PERLVERSION=`perl -le '($_=$])=~s/[.0]+/./g; print'`
export PERL5LIB=/ldc/lib/perl5/site_perl:/ldc/lib/perl5/site_perl/$PERLVERSION:/ldc/lib/perl5/site_perl/$PERLVERSION/mach
export PERLLIB=$PERL5LIB

# Set vi as the history editor
#
# To use it, type <ESC>k at the command prompt
set -o vi

PATH=/usr/local/rvm/bin:$PATH # Add RVM to PATH for scripting

rvm use 2.3.0@mciul
