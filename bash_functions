# vim:filetype=sh

# Quick Utility Functions
#function cdgem { cd /usr/local/lib/ruby/gems/1.8/gems/; cd `ls|grep $1|sort|tail -1` }

#myip - finds your current IP if your connected to the internet
function myip () { lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'; }

function sshpkey() {
	echo "Sending private key to $1";
	cat ~/.ssh/id_rsa.pub | ssh $1 "cat - >> ~/.ssh/authorized_keys2"
}

function cl() { cd $1 && ls; }

# messes with completion
#function google	{ IFS='+'; command lynx -nolist -force_html -display_charset=windows-1251 -dump http://www.google.com/search\?q="$*" ;}
#google () { links http://google.com/search?q=$(echo "$@" | sed s/\ /+/g) }

#function gdef	{ google "define:$@" ;}
#function gluck	{ google "$@&btnI=1" ;}

function log	{ echo -e `date '+%Y-%m-%d %T'`"\t$*" >> ~/.log;}

# syntax error
#function mcd() { mkdir "$@" && cd "${!#}" }

function cdl() { cd "$@" && ls; }

# pushd to a specified package's documentation directory and ls it
#function doc { pushd "/usr/share/doc/$1" && ls }

# Cool History Summerizer
historyawk(){ history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head; }



#grab() {
#        sudo chown -R ${USER} ${1:-.}
#}

psgrep() {
        if [ ! -z $1 ] ; then
                echo "Grepping for processes matching $1..."
                ps aux | grep $1 | grep -v grep
        else
                echo "!! Need name to grep for"
        fi
}

unigrep() {
        if [ ! -z $1 ] ; then
                echo "Grepping for unicorn processes matching $1..."
                ps aux | grep unicorn | grep $1 | grep -v grep
        else
                echo "!! Need name to grep for"
        fi
}

makepasswords() {
    perl <<EOPERL
        my @a = ("a".."z","A".."Z","0".."9",(split //, q{#@,.<>$%&()*^}));
        for (1..10) {
            print join "", map { \$a[rand @a] } (1..rand(3)+10);
            print qq{\n}
        }
EOPERL
}

#alias pacs="pacsearch"
#pacsearch () {
#       echo -e "$(pacman -Ss $@ | sed \
#       -e 's#core/.*#\\033[1;31m&\\033[0;37m#g' \
#       -e 's#extra/.*#\\033[0;32m&\\033[0;37m#g' \
#       -e 's#community/.*#\\033[1;35m&\\033[0;37m#g' \
#       -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' )"
#}  

# backup 
bu () { cp $1 ~/.backup/`basename $1`-`date +%Y%m%d%H%M`.backup ; }  


# simple encryption
function blow()
{
    [ -z "$1" ] && echo 'Encrypt: blow FILE' && return 1
    openssl bf-cbc -salt -in "$1" -out "$1.bf"
}
function fish()
{
    test -z "$1" -o -z "$2" && echo \
        'Decrypt: fish INFILE OUTFILE' && return 1
    openssl bf-cbc -d -salt -in "$1" -out "$2"
}

# processes
function p_cpu()
{
    ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu \
        | sed '/^ 0.0 /d' | pr -TW$COLUMNS
}
function p_mem()
{
    ps -e -orss=,args= | sort -b -k1,1n | pr -TW$COLUMNS
}
function p_user() { ps aux | grep "^$USER" | pr -TW$COLUMNS; }
alias p='p_user'

# gc      => git checkout master
# gc bugs => git checkout bugs
function gc {
	if [ -z "$1" ]; then
		git checkout master
	else
		git checkout $1
	fi
}


# sudo vim
function svim {
        sudo vim $@
}

# edit ~/.bashrc and reload it
function ebrc {
	vim ~/.bashrc
	reload
}

#clock - A bash clock that can run in your terminal window.
clock ()
{
	while true;do
		clear;
		echo “===========”;
		date +”%r”;
		echo “===========”;
		sleep 1;
	done
}

#netinfo - shows network information for your system
netinfo ()
{
	echo “————— Network Information —————”
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	/sbin/ifconfig | awk /'inet addr/ {print $4}'
	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	#myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed ‘/^$/d; s/^[ ]*//g; s/[ ]*$//g’ `
	echo
	#echo “${myip}”
	echo “`myip`”
	echo “—————————————————”
}

#shot - takes a screenshot of your current window
shot ()
{
	import -w root -quality 75 “$HOME/shot-$(date +%s).png”
}

#translate ()
# {
#	TRANSLATED=`lynx -dump “http://dictionary.reference.com/browse/${1}” | grep -i -m 1 -w “Portuguese (Brazil):” | sed ’s/^[ \t]*//;s/[ \t]*$//’`
#	if [[ ${#TRANSLATED} != 0 ]] ;then
#		echo “\”${1}\” in ${TRANSLATED}”
#	else
#		echo “Sorry, I can not translate \”${1}\” to Portuguese (Brazil)”
#	fi
#}

###
###   Handy Daemons Commands
###
dstart()
{
    for arg in $*
    do
        sudo /etc/init.d/$arg start
    done
}
dstop()
{
        for arg in $*
        do
        sudo /etc/init.d/$arg stop
    done
}
drestart()
{
        for arg in $*
        do
        sudo /etc/init.d/$arg restart
    done
}
drcreload()
{
        for arg in $*
        do
        sudo /etc/init.d/$arg reload
    done
}

# nh - run command detached from terminal and without output
# Usage: nh <command>
nh() {
    nohup "$@" &>/dev/null &
}
