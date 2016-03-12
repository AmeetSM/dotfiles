# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Added these lines for vim clipboard
if [ -e /usr/bin/vimx ]; then 
    alias vim='/usr/bin/vimx'; 
fi

add_git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ -f /home/local/PALYAM/sameet/.git-prompt.sh ]; then
    source /home/local/PALYAM/sameet/.git-prompt.sh
    export PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;30m\]\u\[\033[01;34m\] \[\e[22m\]\w\[\e[33m\]$(add_git_branch) \[\033[01;30m\]>\[\033[00m\] '
fi 


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#------------------------------------------------------------------------
# this is for XCRYSDEN 1.5.25; added by XCRYSDEN installation on
# Tue Oct  4 11:54:28 EDT 2011
#------------------------------------------------------------------------
XCRYSDEN_TOPDIR=/home/schuberm/Documents/XCrySDen-1.5.25-bin-semishared
XCRYSDEN_SCRATCH=/home/schuberm/Documents/Scratch
export XCRYSDEN_TOPDIR XCRYSDEN_SCRATCH
PATH="$XCRYSDEN_TOPDIR:$PATH:$XCRYSDEN_TOPDIR/scripts:$XCRYSDEN_TOPDIR/util"
export LD_LIBRARY_PATH=/home/schuberm/Documents/MATLAB/runtime/glnxa64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/schuberm/Documents/MATLAB/bin/glnxa64:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:$LIBRARY_PATH
export PATH=/home/schuberm/Documents/gulp/Src:$PATH
export PATH=/home/schuberm/Documents/lammps-29Jan12/src:$PATH
export PATH=/home/schuberm/Documents/MATLAB/bin:$PATH
export PATH=/home/schuberm/Documents/espresso-4.3.2/bin:$PATH


# Aliasing the commands
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'


# Diskspace usage
alias diskspace="du -S | sort -n -r |more"


#Extract all types of files
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


# Makes directory then moves into it
function mkcdr {
    mkdir -p -v $1
    cd $1
}


# Command substiution
alias ff='find / -name $1'
alias trash="rm -fr ~/.Trash"
alias df='df -h -x tmpfs -x usbfs'
alias psg='ps -ef | grep $1'
alias h='history | grep $1'
alias ..='cd ..'
alias ....='cd ../..'
alias grep='grep --ignore-case --color'
alias jiva61='cd ~/workspace/ZeOmega/Jiva_61_Feb_29/jiva_buildout'

# Coloring the manual (man command)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# Expand the history size
export HISTFILESIZE=1000000000
export HISTSIZE=1000000


# Git related
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gpo='git pull origin'
alias gpa='git push ameet'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'
alias gt='git tag'
alias gcco='git clean -f && gco -- .'
alias grv='git remote -v'
git_reset_soft(){
    git reset --soft HEAD~"$1"
}
alias grs=git_reset_soft
alias ugrs='git reset HEAD@{1}'

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth


# append to the history file, don't overwrite it
shopt -s histappend


# Create the directory and get into it
mkcd() {
        if [ $# != 1 ]; then
                echo "Usage: mkcd <dir>"
        else
                mkdir -p $1 && cd $1
        fi
}


#######################################
# Work related automation
#######################################

# Run buildout
alias rbo='./usr/bin/buildout -c linux_dev.cfg'
alias dco='./bin/develop co '
alias rz='./bin/zope_c1 fg'


# Start Jiva instance 
create_instance() {
    git clone git@github.com:zeomega/jiva_buildout.git;
    echo "##############   Executed : git clone git@github.com:zeomega/jiva_buildout.git ##################"
    cd jiva_buildout 
    echo "##############   Executed : cd jiva_buildout ##################"
    ./installpy27.sh -s
    echo "##############   Executed : ./installpy27.sh -s ################" 
    ./usr/bin/buildout -c linux_dev.cfg
    echo "##############   Executed : ./usr/bin/buildout -c linux_dev.cfg  ################" 
}

zope_start() {
    source ./bin/mssql_odbc.sh ;
    echo "##############   Executed : ./bin/mssql_odbc.sh  ##################"
    ./bin/zeo_svc start ;
    echo "##############   Executed : ./bin/zeo_svc start  ################" 
    ./bin/memcached_svc start ;
    echo "##############   Executed : ./bin/memcached_svc start   ################" 
    ./bin/mongodb_svc start ;
    echo "##############   Executed : ./bin/mongodb_svc start   ###############" 
    ./bin/zope_c1 fg ;
}

# Kill the processes related to Jiva instance
grimreaper() {
    pgrep -l "python" ;
    echo "Killing all python processes ..."
    pkill "python" ;

    pgrep -l "mongo" ;
    echo "Killing all mongodb processes ..."
    pkill "mongo" ;

    pgrep -l "memca" ;
    echo "Killing all memcache processes ..."
    pkill "memca" ;

}

# Unlock the mongodb
mongounlock() {
    rm -rf var/mongodb/data/* ;
    echo "Mongo Unlocked ... " 

}

# User specific aliases and functions
alias db='rdesktop 192.168.11.4 -u sameet -d PALYAM -g "90%"'
alias 11.4='rdesktop 192.168.11.4 -u sameet -d PALYAM -g "90%"'
alias 4.4='rdesktop 192.168.4.4 -u sameet -d PALYAM -g "90%"'

export HISTTIMEFORMAT="%d/%m/%y %T - "

# vim alias
alias vundleinstall='vim +PluginInstall +qall'

# sync with root path -- sudo pip2.7 --version was not working
alias sudo='sudo env PATH=$PATH'

# settings for virtualenvwrapper
export WORKON_HOME=$HOME/.virtual_machine
export PROJECT_HOME=$HOME/virtal_workspace
source /usr/local/bin/virtualenvwrapper.sh
