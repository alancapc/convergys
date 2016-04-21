# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#---------------
# Terminal Title
#---------------
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
MANDWCPAZ7763=148.181.22.149
export SWT_GTK3=0
export LIBOVERLAY_SCROLLBAR=1
#------------------
# Colored man pages
#------------------
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
# export LESS_TERMCAP_us=$'\E[01;32m'

#-------------------
# 10k not blown away
#-------------------
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
# Export DISPLAY for cygwin
export DISPLAY=:0
# Eases locating files on mounted servers
export MOUNT_PATH_=/mnt/
export CDN2=${MOUNT_PATH_}cdn2
export SXDEV64=${MOUNT_PATH_}sxdev64
export MALT=${MOUNT_PATH_}malt
export PREPAID=${SXDEV64}/home/alan/src/man/SMSC/trunk/prepaid
export PREPAID_MALT=${MALT}/home/alan/src/man/SMSC/trunk/prepaid
export VSDCDF2=148.181.16.64
export VSDCDF2_PWD=omn44
export PATH=$PATH:~/.local/bin

#========
# Folders
#========

#-------------
# SMSC Project
#-------------
alias smsc="cd $SXDEV64/home/alan/src/man/SMSC/trunk; ls -al"
alias da="cd $SXDEV64/home/alan/src/man/SMSC/trunk/prepaid/oam/src/debitadmin; ls -al"
alias smsc_malt="cd $MALT/home/alan/src/man/SMSC/trunk; ls -al"
alias da_malt="cd $MALT/home/alan/src/man/SMSC/trunk/prepaid/oam/src/debitadmin; ls -al"
alias motif="gnome-open motif_programmers_ref.pdf"

#-----------------------
# Edit and Source bashrc
#-----------------------
alias brc='. ~/.bashrc'
alias bashrc='subl ~/.bashrc; brc'

#---------------
# Access Profile
#---------------
alias profile='vim ~/.profile; source ~/.profile'

#----------------
# Handy Shortcuts
#----------------
alias a="alias | pygmentize -l bash | grepc "	# Search on ~/.bashrc aliases
alias b="dog ~/.bashrc|grepc" # Same as above, but with comments :D
alias h="history|grepc "	# Search command line history
alias f="find . |grepc " # Search files in current dir and subdir
alias o="gnome-open "	# Open like double-clicking
alias n="nemo"
alias ff="find / -type f -name" # From root (e.g. ff *.png)
alias f.="find . -type f -name" # From current (e.g. f. *.png)
alias dirs='ls -d */' 		# Dirs in current (e.g. dirs)
alias ..="cd .."
alias p="ps aux |grepc " # Search Running Processes
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" 		# Search Processes
alias ldr="sudo du -h / | grep '^\s*[0-9\.]\+G' 2>/dev/null"	# List all file' sizes

#========================
# Shell Color and details
#========================

# Ticking shell
alias tshell="PS1='\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] '"

# SSH and Shell level details
alias sshell="PS1='\n\[\e[1;32m\][$$:$PPID - \j:\!\[\e[1;32m\]]\[\e[0;36m\] \t \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY:-o} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n\$ '"

# Normal Shell
alias nshell="PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '"

#---------------
# Gnome-terminal
#---------------
alias gt='gnome-terminal'

#--------------------
# Extracts IP address
#--------------------
alias myip="echo `ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`"

#---------------
# Remote Servers
#---------------
function adare(){
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -s|--status) cat ~/.ivbinit | pygmentize -l bash; shift;;
      -h|--help) echo "adare [-s|--status ] [-h|--help]"; shift;;
      -*) echo "unknown option: $1" >&2; exit 1;;
    esac
  done
  ssh -t adare ". ~/.profile && 
                    PS1="\H" &&
                    . ~/.bashrc && 
                    . ~/sh/view.sh && 
                    . /net/sun4/public/env/.env.sh" #. /view/$VIEW/vobs/tools/make/set_env
}
#alias adare="     ssh -X -t adare \". ~/.profile && PS1="\H" && . ~/.bashrc && . ~/sh/view.sh && . /net/sun4/public/env/.env.sh && . /view/$VIEW/vobs/tools/make/set_env\""
alias sun2src="   ssh -X -t adare '. ~/.profile && PS1="\H" && . ~/.bashrc && . /net/sun4/public/env/.env.sh && . /view/jdh3/vobs/tools/make/set_env; expect -f ~/sh/sun2src.sh'"
alias sun2ver="   ssh -X -t adare '. ~/.profile && PS1="\H" && . ~/.bashrc && . /net/sun4/public/env/.env.sh && . /view/jdh3/vobs/tools/make/set_env; expect -f ~/sh/sun2ver.sh'"


#------------------------------
# Remote Files with Local Tools
#------------------------------
# hosts are defined in "~/.ssh/config"
alias Adare="nemo ssh://adare/home/alan"
alias Debitadmin="nemo ssh://adare/view/prepaid-8.1.0.4dev/vobs/prepaid/oam/src/debitadmin"
alias Prepaid="nemo ssh://adare/view/prepaid-8.1.0.4dev/vobs/prepaid"

alias Sxdev="nemo ssh://sxdev64/home/alan"
alias Cdn="nemo ssh://cdn/home/ivbbuild"
#alias Cdn2="nemo ssh://cdn2/home/ivbbuild"
alias Windows="nemo smb://$MANDWCPAZ7763/c$/Users/cpaz7763"
alias Csi="nemo ssh://csi/home/ivbbuild"
alias Malt="nemo ssh://malt/home/alan"
alias Controlcenter="nemo ssh://controlcenter/home/ivbbuild"

# Go to directories mounted by nemo
alias rservers="cd /run/user/1000/gvfs/; ls -lrt"

#-------------------------
# Pygmentize 'cat' command
#-------------------------
alias dog='pygmentize -g'

#--------------
# Starting work
#--------------
alias s='./s.sh'

#--------------
# Running pkgs.
#--------------
alias dacdn='s alan adare debitadmin'
alias debitparams='s alan adare debitparams'
alias pceftadmin='s alan adare pceftadmin'

#--------------
# Running rpms.
#--------------
#TODO
alias dacdn2='s alan sxdev64 debitadmin1'

#---------------------------------------------------------
# Cleaning, Making, Packing, Copying and Running - Solaris
#---------------------------------------------------------
alias builddebitadmin="ssh -X adare 'bash --noprofile < ~/sh/debitadmin.sh; hostname closing'"
alias buildparams="ssh -X adare 'bash --noprofile < ~/sh/debitparams.sh'"
alias buildpce="ssh -X adare 'bash --noprofile < ~/sh/pceftadmin.sh'"

#--------
# Xdotool
#--------
alias xdt='xdotool'
alias maxi="xdotool windowsize $(xdotool getactivewindow) 100% 100%"
alias mini="xdotool windowminimize $(xdotool getactivewindow)"
alias lside="xdotool key ctrl+super+Left"
alias rside="xdotool key ctrl+super+Right"
alias athird="xdotool windowsize $(xdotool getactivewindow) 50% 30%"

#-------------
# SMSC Project
#-------------
alias gsmsc="gksu nemo /home/cpaz/workspace/SMSC/trunk"

#==========================================================
#Beautiful FUZZY functions
#==========================================================
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe(){             #open file with default editor
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo(){             #open with `open` or $EDITOR
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fd - cd to selected directory
fd(){             #cd to selected directory
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda(){            #cd to directory (including hidden)
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# Another CTRL-T script to select a directory and paste it into line
__fzf_select_dir(){   #select a dir and past into line
        builtin typeset READLINE_LINE_NEW="$(
                command find -L . \( -path '*/\.*' -o -fstype dev -o -fstype proc \) \
                        -prune \
                        -o -type f -print \
                        -o -type d -print \
                        -o -type l -print 2>/dev/null \
                | command sed 1d \
                | command cut -b3- \
                | env fzf -m
        )"

        if
                [[ -n $READLINE_LINE_NEW ]]
        then
                builtin bind '"\er": redraw-current-line'
                builtin bind '"\e^": magic-space'
                READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${READLINE_LINE_NEW}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
                READLINE_POINT=$(( READLINE_POINT + ${#READLINE_LINE_NEW} ))
        else
                builtin bind '"\er":'
                builtin bind '"\e^":'
        fi
}

builtin bind -x '"\C-x1": __fzf_select_dir'
builtin bind '"\C-t": "\C-x1\e^\er"'

# fkill - kill process
fkill(){          #kill process
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# foreign fkill - kill remote process
ffkill(){         #kill remote process
  node=$1
  pid=$(ssh $node 'ps -ef' | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    ssh $node "kill -\${1:-9} $pid"
  fi
}


# chist - browse chrome history
chist(){         #browse chrome history
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/.config/google-chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs xdg-open
}

# cbook - browse chrome bookmarks
cbook(){          #browse chrome bookmarks
    
  a=$(jq '.roots' ~/.config/google-chrome/Default/Bookmarks |
  grep 'name\|url' | fzf --ansi --multi -q $1 | awk '{print $2}' | cut -c2-)
  echo ${a::-2} | xargs xdg-open 2>/dev/null
}

#==========================================================

# Setting prompt differently if tunneling
__setprompt() {  #change prompt for SSH tunneling
  local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
  local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
  if [ $SSH2_IP ] || [ $SSH_IP ] ; then
    local SSH_FLAG=":ssh"
  fi
  # SSH Shell
  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h$SSH_FLAG\[\033[01;34m\] \w \$\[\033[00m\] "
}
__setprompt

#netinfo - shows network information for your system
netinfo (){      #shows network information of system
  echo "--------------- Network Information ---------------"
  /sbin/ifconfig | awk /'inet addr/ {print $2}'
  /sbin/ifconfig | awk /'Bcast/ {print $3}'
  /sbin/ifconfig | awk /'inet addr/ {print $4}'
  /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
  myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
  echo "${myip}"
  echo "---------------------------------------------------"
}

# Up in directory tree : usage: up 4
up(){            #up in directory tree
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
  do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# extract() - This combines a lot of utilities to allow you to decompress just about any compressed file format
extract(){        #extract (decompress) any file format
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ] ; then
       NAME=${1%.*}
       mkdir $NAME && cd $NAME
      case $1 in
        *.tar.bz2)   tar xvjf ../$1    ;;
        *.tar.gz)    tar xvzf ../$1    ;;
        *.tar.xz)    tar xvJf ../$1    ;;
        *.lzma)      unlzma ../$1      ;;
        *.bz2)       bunzip2 ../$1     ;;
        *.rar)       unrar x -ad ../$1 ;;
        *.gz)        gunzip ../$1      ;;
        *.tar)       tar xvf ../$1     ;;
        *.tbz2)      tar xvjf ../$1    ;;
        *.tgz)       tar xvzf ../$1    ;;
        *.zip)       unzip ../$1       ;;
        *.Z)         uncompress ../$1  ;;
        *.7z)        7z x ../$1        ;;
        *.xz)        unxz ../$1        ;;
        *.exe)       cabextract ../$1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

# grepc() - Searches for a pattern
grepc(){         #searches for a pattern
  pattern="$1"			# Assign pattern
  grep -n --color "$pattern" 	# Grep in color
}

# Search Engines
function encode() { echo -n $@ | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'; }
function google() { firefox http://www.google.com/search?hl=en#q="`encode $@`" ;}
function yahoo() { firefox http://search.yahoo.com/search?p="`encode $@`" ;}
function bing() { firefox http://www.bing.com/search?q="`encode $@`" ;}
function amazon() { firefox http://www.amazon.com/s/ref=nb_ss?field-keywords="`encode $@`" ;}
function wiki() { firefox http://en.wikipedia.org/w/index.php?search="`encode $@`" ;}
function test() { echo  "`encode $@`";}
# SSH bookmark creator
sbm(){           #SSH bookmark creator
  if [ $# -lt 2 ]; then
    echo " SSH bookmark creator
   Usage: sbm <short> [<user>@]<hostname>
    ex: sbm  foo foobar@123.123.123.123" >&2
    return 1
  fi

  short=$1
  arg=$2

  if $(echo "$arg" | grep '@' >/dev/null); then
    user=$(echo "$arg"|sed -e 's/@.*$//')
  fi

  host=$(echo "$arg"|sed -e 's/^.*@//')

  if $(grep -i "host $short" "$HOME/.ssh/config" > /dev/null); then
    echo "Alias '$short' already exists" >&2
    return 1
  fi

  if [ -z "$host" ]; then
    echo "No hostname found" >&2
    return 1
  fi

  echo >> "$HOME/.ssh/config"
  echo "Host $short" >> "$HOME/.ssh/config"
  echo "  HostName $host" >> "$HOME/.ssh/config"
  [ ! -z "$user" ] && echo "  User $user" >> "$HOME/.ssh/config"
  echo "  GSSAPIAuthentication no" >> "$HOME/.ssh/config"
  echo "  ForwardX11 yes" >> "$HOME/.ssh/config"
  echo "  ForwardX11Trusted yes" >> "$HOME/.ssh/config"
  add_alias $short ssh $short
  dog "$HOME/.ssh/config"
  ssh-copy-id -i ~/.ssh/id_rsa.pub $short
}

# Echo selected host
hosts(){         #echo selected host info
  hostname=$1
  if [ $# -eq 0 ]; then 
    echo "Usage: hosts <hostname>" 
  else
    grep -B 1 -A 7 $hostname ~/.ssh/config 
  fi
}

# Comparing files between adare and sxdev64
compare(){        #compare files between adare and sxdev64
  file=$1 	# region_groups.c
  view=$2	  # new
  folder=$3	# debitadmin
  comp=$4	  # not implemented yet


  if [ "$#" -lt 3 ]; then
    echo "Usage: compare <filename> <new|old|lat|search> <debitadmin|debitparams>"
  elif [ "$#" -gt 4 ]; then
    echo "Usage: compare <filename> <new|old|lat> <debitadmin|debitparams>"
  else
    if [ "$view" == "new" ]; then
      d_adare=/view/prepaid-linux-dev/vobs/prepaid/oam/src/$folder #debitadmin
    elif [ "$view" == "old" ]; then
      d_adare=/view/prepaid-7.0.0.1.dev/vobs/prepaid/oam/src/$folder #debitadmin
    elif [ "$view" == "lat" ]; then
      d_adare=/view/prepaid-8.1.0.4dev/vobs/prepaid/oam/src/$folder #debitadmin
    elif [ "$view" == "search" ]; then
      expivb VIEW; echo $VIEW
      d_adare=/view/$VIEW/vobs/prepaid/oam/src/$folder
    else
      echo "new or old?"
    fi

    d_sxdev64=\~/src/man/SMSC/trunk/prepaid/oam/src/$folder #debitadmin
    f_adare=$(ssh alan@adare cat $d_adare/$file)
    f_sxdev64=$(ssh sxdev64 cat $d_sxdev64/$file)

    sdiff -s <(echo "$f_adare") <(echo "$f_sxdev64") | colordiff
  echo " > add to adare
 < add to sxdev64"
   fi
}

expivb(){         #export ivb components
  search=$1
  if [ $# -eq 1 ]; then
    export $(cat ~/.ivb_history | grep $search | fzf | cat )
  else
    export $(cat ~/.ivb_history | fzf | cat )
  fi
}
  
getdir(){        #get directory
  dir=$(cat ~/.ivb_dirs | fzf | cat )
  echo $dir
}

# Extracts functions from a C/C++ file
extractfunctions(){     #extracts functions from a C/C++ file
  filename=$1
  filepath=/run/user/1000/gvfs/sftp:host=adare/view/prepaid-8.1.0.4dev/vobs/prepaid/oam/src/debitadmin/$filename
  o_file=$(pwd)/output.txt
  f_dbxrc=/run/user/1000/gvfs/sftp:host=cdn/home/ivbbuild/.dbxrc

  # Get all functions from file and store in temporary file
  grep -Po '(?<=void |void| int | int).*(?= \(|\()' $filepath >> $o_file
  sed -i 's/^/trace in/g' $o_file

  #Append to .dbxrc
  sed -i "/strace[(][)]/ r $o_file" $f_dbxrc
  sed -i '/strace\(\)/a '"$filename"'' $f_dbxrc
  sed -e '/'"$filename"'/ s/^#*/#/' -i $f_dbxrc

  cat output.txt
  # Remove temporary file
  rm output.txt
}
alias ef='extractfunctions '
# end of extractfunctions()

#if [ "$USER" = "cpaz" ]; then
   #echo "Welcome home, Alan!" 1>&2
#fi

#TODO Function to add functions to bashrc file

# TODO Room to improve - add_alias()
# Add new aliases to this .bashrc file
add_alias(){      #add new aliases to .bashrc
#TODO Create option to add comment
  n_alias=${1}
  shift
  n_command="$@"         # ${@:1:$(($#-1)) }
                       # n=$#
                       # n_comment=${!n}
  replacing=$( alias $n_alias 2>/dev/null|wc -l )

  if [[ "$replacing" = "1" ]];
  then
      b $n_alias # cat|grep .bashrc in color
      read -p "Do you wish to overwrite this(these) alias(es)? [y/n]" yn
	case $yn in
	  [Yy]* ) sed -i '/alias '"$n_alias"'/d' $HOME/.bashrc;
      		  sed -i ':a;$!{N;ba};s,\(auto-generated code\),\1\nalias '"$n_alias"'="'"$n_command"'",3' $HOME/.bashrc;
      		  source ~/.bashrc;
      		  echo "alias $n_alias modified in ~/.bashrc";;
	  [Nn]* ) echo "Operation canceled";;
	  * ) echo "Please answer yes or no.";;
	esac
  else
    sed -i ':a;$!{N;ba};s,\(auto-generated code\),\1\nalias '"$n_alias"'="'"$n_command"'",3' $HOME/.bashrc
    source ~/.bashrc
    echo "alias $n_alias added to ~/.bashrc"
  fi
}
alias aa='add_alias'
# end of add_alias()

# KEEP ME - example on how to include options in functions
test_getopt(){   #example of function option inclusion
  echo "begin test"
  while getopts ":a" Option
    do
      case $Option in
        a ) echo "Inside option a" ;;
        * ) ;;
      esac
    done
  echo "end test"
}

# Returns function from ~/.bashrc
getfunc(){       #get function from .bashrc
  function_name=$1

  sed -n -e '/'"$function_name"'(){/,/^}/ p' ~/.bashrc | pygmentize -l bash
}

# Lists functions inside ~/.bashrc
listfunc(){      #list functions inside bashrc
  function_name=$1

  grep -v '^ ' ~/.bashrc | sed -n -e '/^.*'"$function_name"'(){/ p' -e '/^.*'"$function_name"'() {/ p' | sort #| pygmentize -l bash
}

mounted(){       #lists home directory of mounted nodes
  host=$1
  user=$2
  if [[ "$host" = "cpaz" ]];
  then
    host=$MANDWCPAZ7763
    cd $XDG_RUNTIME_DIR/gvfs/smb-share:server=$host,share=c$/Users/cpaz7763/Documents/
    tree -d
  else
    cd $XDG_RUNTIME_DIR/gvfs/sftp:host=$host/home
    ls -lrt
    if [ $# -eq 2 ];
    then
      tree -d ./home/$user
    fi

  fi

}

remove_alias(){  #remove alias from .bashrc
  n_alias=${1}
  shift
  n_command="$@"         # ${@:1:$(($#-1)) }
                       # n=$#
                       # n_comment=${!n}
  replacing=$( alias $n_alias 2>/dev/null|wc -l )

  if [[ "$replacing" = "1" ]];
  then
      b $n_alias # cat|grep .bashrc in color
      read -p "Do you wish to remove this(these) alias(es)? [y/n]" yn
	case $yn in
	  [Yy]* ) sed -i '/alias '"$n_alias"'/d' $HOME/.bashrc;
      		  source ~/.bashrc;
      		  echo "alias $n_alias removed from ~/.bashrc";;
	  [Nn]* ) echo "Operation canceled";;
	  * ) echo "Please answer yes or no.";;
	esac
  fi
}
alias ra='remove_alias'
# end of remove_alias()

check_in(){       #directly check-in from adare
file=$1
  ssh -t adare "cd /view/prepaid-8.1.0.4dev/vobs/prepaid/oam/src/debitadmin;\
                ct lsco;\
                ct ci $file;\
                ct lsco"
}
alias ci="check_in"
# end of check_in()

check_out(){      #directly check-out from adare
file=$1
  if [[ $file ]]; then
    ssh -t adare "cd /view/prepaid-8.1.0.4dev/vobs/prepaid/oam/src/debitadmin;\
                  ct pwd;       \
                  ct lsco;      \
                  ct co $file;  \
                  ct lsco"
  fi
}
alias co="check_out"
# end of check_out()

uncheckout(){
  file=$1
  if [[ $file ]]; then
    ssh -t adare "cd /view/prepaid-8.1.0.4dev/vobs/prepaid/oam/src/debitadmin;\
    			  ct pwd;		\
    			  ct lsco;		\
    			  ct unco $file;\
    			  ct lsco"
  fi
}
alias unco="uncheckout"
# end of check_out()

pkginfo(){       #extracts package info from given node
  host=$NODE
  NODE=$1
  IV=$2
  DEV=dev
  re='^[0-9]+$'

if [ $# -eq 0 ]; then
  echo "Usage: pkginfo <node> <pkg> [rel]"  
  NODE=$host; export NODE
  echo "Host:      $host"
  echo "Product:   $PRODUCT"
  echo "Component: $COMPONENT"
else
  #Is it setting the release view?
  if [ "$3" == "rel" ]; then
    DEV=rel
  fi  
  # If you only know IP address, search for existing Hosts
  if ! [[ $NODE =~ $re ]] ; then
    echo   
  else
    # Filter down even more, you might have two three options
    NODE=$(config $NODE | grep "Host " | awk '{ print $2 }' )
  fi
  name=$( ssh $NODE 'uname')   
  
  # If linux, use rpm
  if [ "$name" == "Linux" ];then
    IV=$( ssh $NODE 'rpm -qa | grep IV_' | fzf -1 -0 -q $IV )
    if [ "$IV" != "" ]; then
      echo $IV
      info=$( ssh $NODE "rpm -qi $IV")
      PRODUCT=$(echo $IV | cut -d "_" -f2); export $PRODUCT
      COMPONENT=$(echo $IV | cut -d "_" -f3 | cut -d "-" -f1); export $COMPONENT
      export $NODE
      echo "$info"
    else
      echo "Package not found."
  fi
  else # if Solaris, use pkginfo.    
    # Get a list of packages and fuzzy find yours
    IV=$(ssh $NODE 'pkginfo' | grep IV | awk '{print $2}' | fzf -1 -0 -q $IV | awk '{print}')
  
    # Get the package info
    if [ "$IV" != "" ]; then
      FULL=$(ssh $NODE "pkginfo -l $IV")
      echo "$FULL" 

      # Distribute data for later usage
      TMP=$(echo "$FULL" | grep View | awk '{ printf("%s\n%s\n", $3, $13) }')
      VERSION=$(echo "$TMP" | tail -n 1 | cut -c7-)
      ADARE_VIEW=$(echo "$(echo "$TMP" | head -n 1 | rev | cut -c4- | rev)$DEV")
      PRODUCT=$(echo "$VERSION" | cut -d "_" -f1)
      COMPONENT=$(echo "$VERSION" | cut -d "_" -f2)
      LABEL=$(echo "$VERSION" | cut -d "_" -f3 | cut -d "-" -f1)
      sed -i "\
        s/NODE=.*/NODE=$NODE/g;\
        s/PKGINST=.*/PKGINST=$IV/g;\
        s/VERSION=.*/VERSION=$VERSION/g;\
        s/VIEW=.*/VIEW=$ADARE_VIEW/g;\
        s/PRODUCT=.*/PRODUCT=$PRODUCT/g;\
        s/COMPONENT=.*/COMPONENT=$COMPONENT/g;\
        s/LABEL=.*/LABEL=$LABEL/g" ~/.ivbinit
      cat ~/.ivbinit | ssh adare "cat > /home/alan/.ivbinit"
      cat ~/.ivbinit >> ~/.ivb_history
      echo "$(awk '!a[$0]++' ~/.ivb_history)" > ~/.ivb_history
    else
      echo "Package not found."
    fi
  fi
  export VERSION ADARE_VIEW PRODUCT COMPONENT LABEL NODE
fi
}
alias pkg="pkginfo"
#end of pkginfo()

getview(){       #get view from given package and node
  host=$1
  package=$2

  if [ $# -lt 2 ]; then
    echo "Usage: getview <host> <part-of-package>"
  else
    VAR=$(pkginfo $host $package | grep View | awk '{print $3}')
    echo $VAR
  fi
}

catfile(){        #cat file, even if remote
  node=$1
  
  if [ "$node" != "" ]; then
    file=$(cat ~/.ivb_dirs ~/.sxdev64_dirs ~/.cdn_dirs | fzf | cat)
    if [ "$file" != "" ]; then
      ssh $1 "cat $file" > ~/.temporary; no_problem=$?
      [ $no_problem ] && subl ~/.temporary ||  echo "There is a problem"
    else
      echo "File is empty"
    fi

  else 
    echo "Please, provide <host>"
  fi
}

# Open file in remote host with VI
goto(){          #open file in remote host with VI
  # Inpurts and vars
  node=$1
  local=$2
  var=""
  display="DISPLAY=148.181.22.149:0.0"
  
  # check empty node 
  [ "$node" != "" ] && var=$(ssh $node "locate 2>/dev/null; echo \$?")
  [ "$var" != "127" ] && file=$(ssh $node 'locate /' | fzf) || file=$(cat ~/.ivb_dirs ~/.sxdev64_dirs ~/.cdn_dirs | fzf | cat)
  
  if [ "$node" != "" ] && [ $file != "" ]; then
    ssh $node -X -t "export $display dir=$file; [[ -d \"$file\" ]] && /bin/bash; [[ -f $file ]] && vi $file"
  fi
  if [ "$node" != "" ] && [ $file != "" ] && [ "$local" == "get" ]; then
    ssh $node "cat $file" | fzf
  fi
}

ib(){            #install beta with exported NODE, PRODUCT, COMPONENT
  if [ "$1" == "rel" ]; then
    user=release
    node=$2
    prod=$3
    comp=$4
  else
    user=alan
    node=$1
    prod=$2
    comp=$3
  fi

  # Passing parameters manually
  if [ $node ] && [ $prod ] && [ $comp ]; then
    if [ "$(echo $(ssh $node 'uname'))" == "Linux" ]; then
      echo "Installing $prod/$comp on $node"
      [ $# -gt 4 ] && echo "Usage: ib <host> <product> <component>" ||
      ssh $node -t "su - root -c 'installbeta $user $prod/$comp'"
    else
      echo "Host is not Linux, operation cancelled."
    fi
  # Getting parameters from 'pkginfo <host> <component> export'
  elif [ $NODE ] && [ $PRODUCT ] && [ $COMPONENT ];then
    if [ "$(echo $(ssh $NODE 'uname'))" == "Linux" ]; then
      read -p "Installing $PRODUCT/$COMPONENT on $NODE, are you sure? [y/n]" yn
        case $yn in
          [Yy]* ) ssh $NODE -t "su - root -c 'installbeta $user $PRODUCT/$COMPONENT'";
                  echo "Installation complete.";;
          [Nn]* ) echo "Operation canceled";;
          * ) echo "Please answer yes or no.";;
        esac    
    else
      echo "Host NODE=$NODE is not Linux, operation cancelled"
    fi
  # No parameters passed
  else
    echo "Please, either: pass parameters host, product and component"
    echo "or run 'pkg <host> <component>' first to set environment."
  fi
}

release(){
  if [[ $PRODUCT ]] && [[ $COMPONENT ]]; then
    ssh release@sxdev64 -t "
      export PRODUCT=$PRODUCT;
      export COMPONENT=$COMPONENT;
      source <(echo \"\$(cat /home/release/.bashrc | grep -v \"return\" )\");
      shopt -s expand_aliases

      cd ~/src/man/SMSC/trunk/$PRODUCT/$COMPONENT;
      svn update;
      cd ~/src/man/SMSC/trunk/$PRODUCT/$COMPONENT;
      #upver \$((\$(cat .version | head -1) + 1))
      make clean
      rm -rf build
      make
      make release
      releaserepo
    "
    #ib
  else 
    echo "Usage: run pkginfo first and then release"
  fi
}
alias rel="release" 

ada(){            #access Adare with view varying depths
  lvl=$1
  if [ ! $lvl ]; then
    echo "Usage: ada <level (v|1)|(p|2)|(c|3)>" 
  else
    case $lvl in
      v|1) view=$(ssh adare 'ls /view' | fzf);;
      p|2) view=$(ssh adare 'ls /view' | fzf);
         product=$(ssh adare "ls /view/$view/vobs" | fzf);;
      c|3) view=$(ssh adare 'ls /view' | fzf);
         product=$(ssh adare "ls /view/$view/vobs" | fzf);
         component=$(ssh adare "ls /view/$view/vobs/$product" | fzf);;
      *) echo "Wrong level."      
    esac  
  
    export VIEW=$view PRODUCT=$product COMPONENT=$component
    
    sed -i "\
      s/VIEW=.*/VIEW=$VIEW/g;\
      s/PRODUCT=.*/PRODUCT=$PRODUCT/g;\
      s/COMPONENT=.*/COMPONENT=$COMPONENT/g" ~/.ivbinit
    cat ~/.ivbinit | ssh adare "cat > /home/alan/.ivbinit"
    cat ~/.ivbinit >> ~/.ivb_history
    echo "$(awk '!a[$0]++' ~/.ivb_history)" > ~/.ivb_history
    echo /view/$view/vobs/$product/$component/$stage
    adare
  fi
}

# db cmd "select"
dbc(){            #db cmd "select" into given node
  [ "$3" != "" ] && owner="$3." || owner=""
  [ "$1" != "" ] && host=$(echo "$(config $1 | grep "Host " | awk '{print $2}' | fzf -1) ") || host=${1-$(cat ~/.ssh/config | grep "Host " | awk '{print $2}' | fzf ) } #'
  rows=${2-10}

  if [ "$host" != "" ]; then
    table=$(echo $(ssh $host ". ~/.profile; db cmd \"select ob.name,st.rowcnt from sysobjects ob, systabstats st where ob.type='U' and st.id=ob.id order by ob.name\"" | fzf -m --tac | awk '{print $1}')) 2>/dev/null
    columns=$(echo $(ssh $host ". ~/.profile; db cmd \"set rowcount 1 select * from $owner$table\"" 2>/dev/null | head -n 1  )) 2>/dev/null
    columns=$(echo "$(for word in $columns; do echo $word; done)" | fzf -m)
    if [[ "$columns" == "" ]]; then
      selected="*"
    else
    selected=""
    count=0
        for word in $columns; do
         count=$(( $count + 1 ))
         if [ $count -eq 1 ]; then
           selected="$word"
         else
           selected="$selected, $word"
         fi
      done
    fi 
    echo "QUERY: select $selected from $table"
    echo 
    ssh $host ". ~/.profile; db cmd \"set rowcount $rows select $selected from $owner$table\"" 2>/dev/null
  else
    echo "Usage: dbc <host> [rowcount] [owner]"
  fi
 }

# Same as dbc but uses my file (TODO - standardise file for better interaction)
dbcf(){           #same as dbc ut uses a file
  query=$(cat ~/Dropbox/Work/Cheatsheets/_databases/debitadmin_tables.sql | fzf -m --tac)
  query=$(echo "${query//-}")
  [ "$1" != "all" ] && query=$(echo "${query//\*}")
  query=$(echo "${query//\/}")
  query=$(echo "$(echo "$query" | sed 's/[A-Z]//g')")
  echo $query
  ssh csi "db cmd \"$query\""
}

oracle(){        #any command into oracle db, pass node and query
	node=$1
	query=$2

	/usr/bin/expect<<EOF
	 	spawn ssh $node -t "su root -c \". /opt/ivb/config/set_env;\
			 	. /opt/ivb/config/set_oracle;\
			 	. /home/oracle/.profile;\
			 	echo '$query;' | sqlplus cstmr/cstmr \"
			 	"
		expect "Password: "
		send "four4four\n"
		expect eof
EOF
}

ore(){           #select * from chosen table in oracle
	tables="$(oracle novcns "select owner, table_name from dba_tables" | grep CSTMR | sort | awk '{print $2}')"
    
    table=$(echo "$tables" | fzf --tac ) 
    oracle novcns "select * from (select * from $table where ROWNUM <= 5) "
    #columns=$(oracle novcns "select column_name from user_tab_columns where table_name = '\\\''$table'\\\''"  | fzf)
}

# ttynumber - sets ttynumber based on current terminals
ttynumber(){     #sets ttynumber based on current terminals
  query=$@
  tty_n=$(w | fzf -1 -q $query| awk '{print $2}' | cut -d '/' -f2)
  [ $tty_n ] && export TTYNUMBER=$tty_n || TTYNUMBER=$(tty | cut -d '/' -f4)
  echo "TTYNUMBER=$TTYNUMBER"
}
alias ttn=ttynumber 

# ttyecho utility - choose a terminal and run a command there.
to(){            #choose a terminal with "ttn" and run a command there
  [ $TTYNUMBER ] && ttyecho -n /dev/pts/$TTYNUMBER $@
}

down(){           #search down the directory tree with depth 
  [ ! $1 ] && echo "Usage: down <directory> [depth]" && return
  directory="$1"
  depth=$2
  cd $(find `pwd` -maxdepth ${depth:-1} -type d -exec ls -ld "{}" \; 2> /dev/null| fzf -1 -q $directory | awk '{print $9}')
}
alias d=down

# expose - print current command and its results on /dev/pts/TTYNUMBER terminal
expose(){         #print current command on different terminal
	comm="$@"	
	results=$($comm)	
	echo "$(echo "$comm"; echo ; echo "$results")" > /dev/pts/$TTYNUMBER
	echo "$results"
}
alias e="expose \"$@\""

mirror(){        #executes same command on two terminals
  if [ $TTYNUMBER ] ; then
    echo "command: $@"
    to $@
    $@
  fi
}
alias m="mirror \"$@\""

# tab - faster ALT+TAB with word input
tab(){           #faster ALT+TAB with word input
  query="$@"
  wmctrl -i -a "$(wmctrl -lx | fzf -1 -q $query| awk '{print $1}')"
}

svncode(){       #print svn symbol meaning
  symbol=$1
  [ $symbol ] &&  svn help status | grep \'$(echo $symbol)\' || \
  echo "usage: svncode <symbol>"
}

jir(){           #acces JIRA on Project or Project-IssueNumber
  project="$( echo -e 'AD\nCMEX\nCSI\nDPX\nNIVR\nPLAT\nPREP\nRSM\nSDL\nRASP\nSMSC\nTOOL\nUSSD' | fzf)"
  number=$1
  [ $1 ] && issue="$project-$number" || issue="$project"
  [ $project ] && firefox https://jira1.intervoice.int:8443/browse/$issue 2>/dev/null & 
}

ocs(){           #access Online Charging System on XXX.XXX address
  address=$1
  google-chrome http://148.181.$address:8000/servlet/com.intervoicebrite.gnb.CSI.ausermgr.servlet.RemoteLogin
}

closeterminals(){ #close 'sendsms' terminals
  #ttyecho -n /dev/pts/$second sed -i \"/$subscriber/d\" ./smsorig
  where=$(ssh gambiasmsc 'w' | grep mintvm | grep tail | awk '{print $2}')
  [ $where ] && where=$(ssh gambiasmsc 'ps all' | grep $where | grep tail | awk '{print $3}')
  [ $where ] && ssh gambiasmsc -t "su - root -c 'kill -15 $where'" >/dev/null 
 
  for var in $terminals
    do
      ttyecho -n /dev/pts/$var kill -9 \$$
      sleep .01
      ttyecho -n /dev/pts/$var kill -9 \$$
    done
  unset terminals
}

function sendsms
{
  # sendsms auto completion function is located at /etc/bash_completion.d/sendsms
  params="$@"
  #echo "/home/cpaz/Scripts/sendsms.sh $params";
  /home/cpaz/Scripts/sendsms.sh $params
}

share(){         #search and open intervoice.int/data
  o "`cat ~/.intervoice_dirs | fzf`"
}

db(){             #execute db command locally
  node=$1
  cmd=$2
  shift 2
  argument=$@
  search=''
  subscriber="db cmd 'select subscriber_id from db_subscriber_tbl'"
  cos="db cmd 'select cos from db_cos_tbl'"
  interfaces="cat /usr/sybase/interfaces | grep -v \"^$\|master\|query\""
  ratetable="db cmd 'select table_name from db_ratetable_tbl'"
  sp="db cmd \"select name from sysobjects where type in ('P')\""

  standard(){
    if [[ $argument ]]; then
      ssh $node "db $cmd $argument"
    else
      ssh $node "db $cmd $(ssh $node "$search" | fzf )"
    fi
   }
  
  main(){
    if [[ ! $node ]]; then
      ssh cdn2 'db' | grep "CP\|CDF" | cut -d':' -f2 | fzf;
      echo "Usage: db <node> <command> <argument>";
    else
      # If there's no command, find one
      if [[ ! $cmd ]]; then
        cmd=`ssh cdn2 'db' | grep "CP\|CDF" | cut -d':' -f2 | awk '{print $1}' | fzf -1`     
      # If command was passed, check if exists
      elif [[ $cmd ]]; then
        list="callrec
              callrecsml
              cdr
              callcount
              callhour
              cps
              cps2
              callavg
              cpsmon
              callchg
              callchg_mt
              calls
              tr
              ts_all
              ts_in
              ts_out
              ts_high
              ts_types
              cpd
              cph
              calltypes
              cpcalltypes
              cip
              cipd
              locked
              unlock_node
              rating
              profile
              dprofile
              subrate
              rt
              rp
              rs
              rg
              hol
              gprsrp
              gprsrt
              porp
              app
              dapp
              tariff
              loyalty
              camp
              subcamp
              clearcamp
              addcamp
              tok
              subtok
              subtokr
              cleartok
              deltok
              addtok
              addtokdate
              addtok2
              addtokr
              setdtok
              tokbundle
              bup
              subbup
              counter
              subcounter
              delcounter
              tclscripts
              tclprofile
              subrec
              subcos
              subs
              setcos
              subbal
              res
              rescheck
              resclear
              lock_sub
              unlock_sub
              normal_sub
              close_sub
              expire_sub
              cutoff_sub
              setbal
              freetime
              freemoney
              freedata
              subcred
              setcred4
              setcred
              revive
              cos
              subff4
              subff
              addfriend
              ff4
              ff
              hz
              subhz
              cellarea
              svc
              addsvc
              delsvc
              ccr
              fcccr
              smsq
              obj
              addobj
              cosobj
              setcosobj
              subobj
              setsubobj
              scripts
              scriptp
              slop
              listslop
              getslop
              setslop
              setslopall
              smstok
              smstrf
              smppstore
              smppstore
              smsdlvc
              smsdlv
              smsdlvstat
              smsdbg
              smsrt
              smsrt
              smsprofile
              vgrp
              vset
              usevchr4
              usevchr
              getvchrset
              getvchr
              fcp
              subfc
              notif
              tmpltypes
              tmpl
              deltmpl
              addtmpl
              subtmpl
              eVoucher
              subdealer
              log
              cur
              al
              alcard
              gp
              gpset
              lines
              block
              unblock
              report_lines
              trusted
              log_check
              log_dump
              log_oldest
              log_blocked
              monsql
              backup_db
              restore_db
              helpdb
              checkdb
              device
              usages
              pr_app
              pr_obj
              sysmon
              tablesize
              used
              usedseg
              who
              usercount
              ipaddr
              lock
              lock
              sqltext
              spline
              pss
              cpu
              running
              showplan
              long
              monitor
              rephealth
              repstatus
              repwho
              repwhoisup
              repwhoisdown
              repspace
              repagent
              cmd
              sel
              count
              cols
              input
              skill
              getdate
              help
              desc
              grants
              usergrants
              trig
              depends
              optstats
              bcp_out
              bcp_in
              dumpdb
              loaddb
              dumpmap
              dumpraw
              dumpraid
              dumpufs
              sp_out
              sp_in
              catsp
              checksp
              baksp
              dumptables
              dumpprocs
              dumptables
              uptime
              gettable
              comparetable
              comparealltables
              "
        exists=0
        for var in $list
        do
          if [[ "$cmd" == "$var" ]]; then
            exists=1
          fi
        done
        if [[ $exists -eq 0 ]]; then
          cmd=`ssh cdn2 'db' | grep "CP\|CDF" | cut -d':' -f2 | awk '{print $1}' | grep $cmd | fzf -1`
        fi 
      fi
      case $cmd in
        slop)       search=$cos
                    standard
                    ;;
        subrate|rating|profile|dprofile|subrec|getvchrset|subcos|setcos|subbal|res|lock_sub|unlock_sub|normal_sub|close_sub|expire_sub|cutoff_sub|setbal|freetime|freemoney|freedata|setcred4|setcred|revive|subff4|subff|subhz|svc|addsvc|delsvc|usevchr4|usevchr|subfc|subtmpl)
                    search=$subscriber
                    standard
                    ;;
        locked)     search=$interfaces
                    standard
                    ;;
        getvchr)    search=$subscriber
                    sub="$(ssh $node "$search" | fzf)"
                    vchrset="$(ssh $node "db getvchrset $sub" | grep -v - | grep -v set_num  | awk '{print $2}' | fzf )"
                    echo "$sub $vchrset"
                    ssh $node "db $cmd $sub $vchrset"
                    ;;
        rt)         search=$ratetable
                    standard
                    ;;
        grants)     search=$sp
                    standard
                    ;;
        *)          ssh $node "db $cmd $argument";;
      esac
    fi
   }
  
  main
  #echo "$node $cmd $@"
}

outproc(){       #output <procedure> from <node> and save it to pwd
  node=$1
  proc=$2
  
  if [[ ! $proc ]]; then
    proc="$(cdn2 "db cmd \"select name from sysobjects where type in ('TR','P','V')\"" | grep -v '^$' | cut -d' ' -f2 | fzf)"
  fi
  #echo "Node: $node \nProcedure: '$proc'"
  if [[ $node ]]; then
    if [[ $proc ]]; then
      db $node sp_out $proc;
      ssh $node "cat $proc.proc" > ~/$proc.sql;
      ssh $node "rm  $proc.proc"
      subl ~/$proc.sql
    fi
  fi
}
alias op="outproc"

montar(){        #mount <node> locally
  nodes=$@
  if [[ $nodes ]]; then
    for node in $nodes; do
      sshfs $node:/ /mnt/$node
      ls /mnt/$node
    done 
  fi
}

log(){           #output /var/ivb/logs/<logfile> from <node>  
  node=$1

  if [[ $node ]]; then
    file="$(ssh $node "ls /var/ivb/logs" | fzf -1)"
    ssh $node "cat /var/ivb/logs/$file" > /tmp/$file
    if [[ "`cat /tmp/$file`" != "" ]]; then
      subl /tmp/$file
    fi
  else
    echo "Usage: log <node>"  
  fi
}

bhca() {         #busy hour call attempt type
  case $1 in
    voice)types='108,\|115,\|118,\|119,\|121,\|124,\|125,\|127,\|129,\|133,';;
    thr)  types='164,';;
    ivr)  types='^[\s]1,\|105,\|106,\|107,\|108,\|110,\|113,';;
    gprs) types='139,\|159,';;
    diam) types='144,\|145,\|150,\|151,\|146,\|147,\|148,\|152,\|153,\|154,\|155,';;
    ssr)  types='rechargetype';;
    ussd) types='ussd_smpp\|ussd_balance\|ussd_recharge\|ussd_ebalance\|ussd_ect\|ussd_ect_dealer\|ussd_voucher\|ussd_balance2';;
    sms)  types='254,\|107,';;
    *) echo "No such type available."      
  esac 
  customer=$(ls  ../../../../store/data/ | fzf -1 -q ${2:-netone })
  dt=$(ls /mnt/kpi/store/data/netone/ | fzf -1 -q ${3:-20160307})
  echo $1"types"
  for i in {$(seq -w -1 24)}; 
  do 
    cat ../../../../store/data/$customer/$dt/traffic.dat | \
    grep "^.\{11\}$i" |     \
    cut -f3-4 -d ',' |      \
    grep "$types" |     \
    case $1 in
      ssr|ussd|sms )          cut -d ',' -f2 |        \
                          awk '{s+=$1} END {print s}' ;;
      ivr|gprs|\
      diam|thr|voice ) awk '{s+=$2} END {print s}';;
    esac
  done
}

example_matrix(){ #example of matrix <rows> <columns> in bash
  declare -A matrix
  num_rows=$1
  num_columns=$2
  count=1
  for ((i=1;i<=num_rows;i++)) do
      for ((j=1;j<=num_columns;j++)) do
          matrix[$i,$j]=$count
          count=`expr $count + 1`
      done
  done
  echo ${matrix[4,45]}
  f1="%$((${#num_rows}+4))s"
  f2=" %9s"

  printf "$f1" ''
  for ((i=1;i<=num_rows;i++)) do
      printf "$f2" $i
  done
  echo

  for ((j=1;j<=num_columns;j++)) do
      printf "$f1" $j
      for ((i=1;i<=num_rows;i++)) do
          printf "$f2" ${matrix[$i,$j]}
      done
      echo
  done
}

# auto-generated code
alias bishop="ssh bishop"
alias cf="catfile"
alias mxnfs="ssh mxnfs"
alias ugvcenter="o https://148.181.104.164/vsphere-client/?csp#extensionId%3Dvsphere.core.controlcenter.domainView"
alias ugesxi="ssh ugesxi"
alias ugsdp="ssh ugsdp"
alias ugcsi="ssh ugcsi"
alias ugcdn="ssh ugcdn"
alias desinit="sudo umount cdn2:/    \
                           repos:/   \
                           sxdev64:/ \
                           //intervoice.int/data \
                           adare:/view/prepaid-8.1.0.4dev/{home/alan,vobs/prepaid/{basedb,oam}} "
alias xdefaults="xrdb ~/.Xresources_NICE_LOOKING; xterm"
alias xivb="     xrdb ~/.Xresources_IVB_READY; xterm"
alias intervoice="sudo mount -t cifs //intervoice.int/data /mnt/share/ -o user=cpaz7763,domain=emea.convergys.com"
alias sxcp02="ssh -X sxcp02"
alias ksar="sh /home/cpaz/Downloads/kSar/kSar-5.0.6/run.sh"
alias mcmurdo="ssh -X mcmurdo"
alias cdn153="ssh -X cdn153"
alias sdp2="ssh sdp2"
alias sdp4="ssh sdp4"
alias sdp3="ssh sdp3"
alias sdp1="ssh -X sdp1"
alias kpi="ssh -X kpi"
alias cdn2="ssh -X cdn2"
alias sms="sendsms"
alias smstypes="o '/mnt/share/CustOps/Man/projects/SMS-SC/Fds/SMS Types.xls'"
alias smsstatus="o http://mcmurdo.intervoice.int/twiki/bin/view/Products/SMSC-SMSMessageStatus"
alias ct="closeterminals 2> /dev/null"
alias passwords="subl /home/cpaz/Dropbox/Work/pwd.txt"
alias employeeID="echo 100857763"
alias gambiasmsc="ssh gambiasmsc"
alias platform="cd /mnt/sxdev64/home/alan/src/man/SMSC/trunk/platform; ls -al"
alias ussd="cd /mnt/sxdev64/home/alan/src/man/SMSC/trunk/ussd; ls -al"
alias prepaid="cd /mnt/sxdev64/home/alan/src/man/SMSC/trunk/prepaid; ls -al"
alias gmcdn="ssh gmcdn"
alias svn="echo 'SVN is blocked to avoid upgrade issues. To unlock, remove alias svn on ~/.bashrc'"
alias gmcsi="ssh -X gmcsi"
alias sxcc03="ssh -X sxcc03"
alias cc133="ssh -X cc133"
alias qms="firefox /mnt/share/Quality/man/QMS/Home/home.htm"
alias quality="cd /mnt/share/Quality/man"
alias netone="cd /mnt/share/CustOps/Man/projects 2015/Netone  Revenue Generating Initiatives P3232-01/Project Initiation/Scope of Work"
alias scope="o '/mnt/share/CustOps/Man/projects 2015/Netone  Revenue Generating Initiatives P3232-01/Project Initiation/Scope of Work/P323201 SOW for Revenue Generating Initiative Issue 1.pdf'"
alias workday="firefox https://www.myworkday.com/convergys/d/home.htmld"
alias nocdn="ssh -X nocdn"
alias novcns="ssh -X novcns"
alias lf="listfunc"
alias repos="ssh -X repos"
alias undu="awk '!a[$0]++'"
alias of="o \$(fzf)"
#alias config="cat ~/.ssh/config | grep -B 4 -A 5"
alias configs="cat ~/.ssh/config | grep \"Host \""
alias notes="subl /home/cpaz/Dropbox/Work/NOTES.sh"
alias 3136-033="cd /mnt/share/CustOps/Man/projects\ 2013/Africell\ DRC\ IN\ P3136-01/Technical\ Documentation/RSC/RSC3136-033-SMSC-Reject\ Pre-Active\ Subscribers"
alias projects="cd /mnt/share/CustOps/Man/projects"
alias data="cd /mnt/share/"
alias cheatsheets="cd ~/Dropbox/Work/Cheatsheets/"
alias gamcdn="ssh gamcdn"
alias gamvpn="ssh gamvpn"
alias aslvpn="ssh aslvpn"
alias aslcdn="ssh aslcdn"
alias drcvpn="ssh drcvpn"
alias drccdn="ssh drccdn"
alias ccp250="firefox https://148.181.103.250:8443/ccportal/portal?sessiontimeout=true"
alias gmsc253="smsc253 -X -t 'cd gmsc;su;/bin/bash'"
alias ccs250="ssh cc250"
alias smsc253="ssh smsc253"
alias sxcp01="ssh sxcp01"
#alias jira="firefox https://jira1.intervoice.int:8443/secure/Dashboard.jspa"
alias oid="cat ~/Dropbox/Work/sxcp01:_opt_ivb.txt | pygmentize -g | grep -B 10 -A 10 $1"
alias om="lftp -u omn44_build,$VSDCDF2_PWD -e 'cd jhopper;bin;put rodar.sh;quit' $VSDCDF2;omnitel"
alias gmsc="sxcp01 -X -t 'cd gmsc;su;/bin/bash'"
alias omnitel="expect -f ~/Scripts/omn44.sh"
alias omn44="expect -f ~/vsdcdf2.sh"
alias badare="subl /mnt/adare/view/prepaid-8.1.0.4dev/home/alan/.bashrc"
alias reportsserver83="ssh reportsserver83"
alias cdn48="ssh cdn48"
alias Asl="nemo ssh://asl"
alias rs207="reportsserver207"
alias reportsserver207="ssh reportsserver207"
alias rs84="reportsserver84"
alias reportsserver84="ssh reportsserver84"
alias cc="controlcenter"
alias controlcenter="ssh controlcenter"
alias asl="ssh asl"
alias hm="home; clear; ls -a"
alias SMSC="cd /run/user/1000/gvfs/sftp:host=sxdev64/home/alan/src/man/SMSC/trunk"
alias lsco="ssh -t adare '\
              cd /view/prepaid-8.1.0.4dev/vobs/prepaid/oam/src/debitadmin;\
              ct lsco' \
            | grep alan | cut -d'\"' -f2"
alias gotd="gnome-open /home/cpaz/PDF/db_region_tbl__details.html"
alias details="atom /home/cpaz/PDF/db_region_tbl__details.html"
alias mo="mounted"
alias mtd="mounted"
alias gvfs="cd /run/user/1000/gvfs"
#alias alancosta="atom /home/cpaz/Documents/website/alancosta.me.pn/index.html"
alias c="clear"
alias cls="clear"
alias gf="getfunc"
alias Cdn2root="nemo ssh://cdn2root/home/ivbbuild"
alias home='cd /home/cpaz'
alias documents='cd /home/cpaz/Documents'
alias workspace='cd /home/cpaz/workspace'
alias desktop='cd /home/cpaz/Desktop'
alias scripts='cd /home/cpaz/Scripts'
alias -- -='cd -'
alias cdn2root='ssh cdn2root'
alias valdaxml="cdn2 'rm /home/ivbbuild/alan/valgrind-debitadmin.xml; valgrind \
--track-origins=yes \
--leak-check=yes \
--read-var-info=yes \
--xml=yes \
--xml-file=/home/ivbbuild/alan/valgrind-debitadmin.xml \
--tool=memcheck debitadmin \
'; valk"
alias valdaout="cdn2 'valgrind --vgdb=yes --log-file=/home/ivbbuild/alan/valgrind-debitadmin.out --track-origins=yes --leak-check=yes --tool=memcheck debitadmin'"
alias valk="cdn2 'cd /home/ivbbuild/alan/valkyrie-2.0.0/bin/ && ./valkyrie --view-log=/home/ivbbuild/alan/valgrind-debitadmin.xml'"
alias downloads='cd /home/cpaz/Downloads'
alias cdn="ssh cdn"

alias sxdev64="ssh sxdev64"
alias csi="ssh csi"
alias malt="ssh malt"
alias sxcp01="ssh sxcp01"
#alias valkache="cdn2 'valgrind --tool=callgrind debitadmin; kcachegrind $(ls -rt callgrind.out.*| tail -n 1); rm $(ls -rt callgrind.out.* | tail -n 1)'"

#===============================================================
# N_W_R
#===============================================================
#<nwr>
alias lnv="lyn verify"
alias lyn="learnyounode"
alias apt-get="sudo apt-get"
#</nwr>

add_nwr(){        #add 'auxiliary aliases'
  n_alias=${1}
  shift
  n_command="$@"       # ${@:1:$(($#-1)) }
                       # n=$#
                       # n_comment=${!n}
  replacing=$( alias $n_alias 2>/dev/null|wc -l )

  if [[ "$replacing" = "1" ]];
  then
      b $n_alias # cat|grep .bashrc in color
      read -p "Do you wish to overwrite this(these) alias(es)? [y/n]" yn
	case $yn in
	  [Yy]* ) sed -i '/alias '"$n_alias"'/d' $HOME/.bashrc;
      		  sed -i ':a;$!{N;ba};s,\(nwr>\),\1\nalias '"$n_alias"'="'"$n_command"'",1' $HOME/.bashrc;
      		  source ~/.bashrc;
      		  echo "alias $n_alias modified in ~/.bashrc";;
	  [Nn]* ) echo "Operation canceled";;
	  * ) echo "Please answer yes or no.";;
	esac
  else
    sed -i ':a;$!{N;ba};s,\(nwr>\),\1\nalias '"$n_alias"'="'"$n_command"'",1' $HOME/.bashrc
    source ~/.bashrc
    echo "alias $n_alias added to ~/.bashrc"
  fi
}
alias an='add_nwr'
# end of add_nwr()

lns(){           #learnyounode solution
  exercise=$(lyn current | tr ' ' '_' | tr -d '!' | tr -d '/' | awk '{print tolower($0)}')
  dog /usr/local/lib/node_modules/learnyounode/exercises/$exercise/solution/solution.js
}
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
