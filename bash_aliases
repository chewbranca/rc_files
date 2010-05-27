# vim:filetype=sh

#######################################
# Aliases
#######################################

# --------------
#   Bookmarks
# --------------
alias src='cd ~/src/'
alias docs='cd ~/Documents/'
alias downs='cd ~/Desktop/Downloads/'
alias zoolah='cd ~/src/zoolah/'
alias n2='cd ~/src/n2/'
alias :q="exit"
alias calc='python -ic "from math import *; from random import *"'
alias cdn='cd /home/russell/src/n2'

# --------------
#   Utilities
# --------------
# ps output sorted by lstart
alias pstimes='ps -eo lstart,comm,user --sort lstart'
# Names of open files
alias lsofnames="lsof | awk '!/^\$/ && /\// { print \$9 }' | sort -u"
alias hg='history | egrep'
alias recent="ls -lAt | head"
alias reload="source ~/.bashrc"
alias big_files="BLOCKSIZE=1048576; du -x | sort -nr | head -10"
# list current directory sizes
alias dut="du -h -c --max-depth 1"
alias systail='tail -f /var/log/syslog'
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias sys="vmstat 3"
# SSH
#alias sshpkey='echo "Sending private key to $1"; cat ~/.ssh/id_rsa.pub | ssh $1 "cat - >> ~/.ssh/authorized_keys2"'
# NET
alias openports="netstat -nape --inet"
alias myip2="curl www.whatismyip.org"
alias ns="netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail -n +2"
alias ns2="sudo watch -n 3 -d -t netstat -vantp"
alias path='echo -e ${PATH//:/\\n}'

# --------------
#   Shortcuts
# --------------
alias j=jobs
alias cls="clear; ls"
alias clr='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."'
#alias cl="cd \$1; ls"
alias f='find . -iname'
alias today='date +"%A, %B %d, %Y"'
alias yest='date -v-1d +"%A %B %d, %Y"'
alias recent='ls -lAt | head'

# --------------
#   Movement
# --------------
alias back='cd $OLDPWD'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias cd..='cd ..'
alias ..='cd ..'

# --------------
#   Git
# --------------
alias gb='git branch -v'
alias gbr='git branch -r -v'
alias gba='git branch -a -v'
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gl='git log --pretty=oneline'
alias gls='git log --stat'
alias gsr='git svn rebase'
alias gsd='git svn dcommit --edit'
alias gitk='gitk --all &'
#alias github="open \`git config -l | grep 'remote.origin.url' | sed -En 's/remote.origin.url=git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'\`"

# ---------------
#   Ruby
# ---------------
alias irb='irb --readline -r irb/completion -rubygems' 
   
# --------------
#   Rails
# --------------
alias ss='script/server' # start up the beast
alias ssd="./script/server --debugger"
alias sc='script/console' # obvious
alias sw='script/server webrick'
alias sg='script/generate'
alias a='autotest -rails' # makes autotesting even quicker
alias mongs='mongrel_rails cluster::configure -e production -N 3 -c $(pwd) --user mongrel --group mongrel -p'

# --------------
#   ls
# --------------
alias ll='ls -lh'
alias lz='ll -S'
alias lt='ll -t'
alias l='ll -CF'
alias la='ll -a'
alias lr='ll -R'
alias ls='ls --color=auto'
# ls and grep
alias lsg='ls | grep $1'
# ll and grep
alias llg='ll | grep $1'


alias duf="du -h"


# Small Functions
alias hour='while true; do clear; echo "========"; date +"%r"; echo "========"; sleep 1; done'

#alias clock='cal; echo Hour:; while true; do echo -ne "\b\b\b\b\b\b\b\b"; echo -n `date +"%r"`; sleep 1; done'
