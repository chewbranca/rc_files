# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# functions for prompt
function jobcount {    stopped="$(jobs -s | wc -l | tr -d " ")";    running="$(jobs -r | wc -l | tr -d " ")";    echo -n "${running}r/${stopped}s"; }
function parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'; }

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# setup PATH
export PATH=/var/lib/gems/1.8/bin:$PATH:/opt/android-sdk/tools

# prepend /usr/local paths if anything is installed there
if [ -e /usr/local ] ; then
  export PATH=/usr/local/bin:$PATH
  export MANPATH=/usr/local/share/man:$MANPATH
  export INFOPATH=/usr/local/share/info:$INFOPATH
fi

# prepend $HOME/bin to the path if it exists
if [ -e $HOME/bin ] ; then
  export PATH=$HOME/bin:$PATH
fi


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] (\$(jobcount))\$(parse_git_branch)\[\033[0;36m\]]\[\e[0m\] \\$ '
    PS1="${debian_chroot:+($debian_chroot)}\[\033[1;32m\][\[\033[1;37m\]\\u\[\033[1;37m\]@\[\033[1;37m\]\\H \[\033[0;31m\](\\w\[\033[0;31m\]) (\$(jobcount))\$(parse_git_branch)\[\033[0;36m\]]\[\e[0m\] \\$ "
    #PS1="${debian_chroot:+($debian_chroot)}\[\033[0;36m\][\[\033[1;37m\]\\u\[\033[1;37m\]@\[\033[1;37m\]\\H \[\033[0;31m\](\\w\[\033[0;31m\]) (\$(jobcount))\$(parse_git_branch)\[\033[0;36m\]]\[\e[0m\] \\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --exclude=*.git* --color=auto'
    alias fgrep='fgrep --exclude=*.git* --color=auto'
    alias egrep='egrep --exclude=*.git* --color=auto'
fi

# directory aliases
alias cdn='cd /home/russell/src/n2'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Function definitions
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions;
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias reload="source ~/.bashrc"


##########################
#  EXPORT OPTIONS
##########################
export PAGER=less
export EDITOR=vim
export LESS='-R'
# When running less, always ignore case on searches; prompt verbosely; display colors;
#  chop long lines; highlight first new line; tabs are 4 chars wide.
#export LESS='-I -M -R -S -W -x4'
export HISTSIZE=50000

# search home directory as well as current directory when changing directory
export CDPATH=.:~/
export RAILS_ENV='development'

# Ignore words ending with these suffixes, when doing tab completion.
export FIGNORE='~:.o:.svn:vmlinuz'

#export MANPATH=/usr/share/man:/usr/local/share/man:/usr/X11R6/man:/opt/local/man:/usr/local/git/man
#for d in /usr /{usr,opt}/{local,share,local/share,git,git/share} ~{,/home,/perl}
#do
    #test -d $d/bin && PATH=$d/bin:$PATH
    #test -d $d/man && MANPATH=$d/man:$MANPATH
#done

##########################
#  shopt settings
##########################
shopt -s cdspell
#set -o vi  # vi mode -- see http://www.hypexr.org/bash_tutorial.php#vi
set -o noclobber         # prevent overwriting files with cat

# set vi mode
set -o vi
set editing-mode vi
set keymap vi
set convert-meta on

# ^l clear screen
bind -m vi-insert "\C-l":clear-screen

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize



#################################
# Welcome and auto start
#################################

# MOTD:
#clear
echo -e ""
echo -ne "Today is "; date
#echo -e ""; cal ;
echo -ne "Uptime:";uptime | awk /'up/
#{print $3,$4}'
echo "";
fortune
