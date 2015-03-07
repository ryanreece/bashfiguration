# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#-------------------
#  Custom Aliases
#-------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'

alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'

#alias ll="ls -l --group-directories-first"
alias ls='ls -hF'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'

export PS1="[\u@\h \w]\\$ "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


#------------------
# Custom Functions
#------------------
function serverinfo()
{
    echo -e "\nServer information:" ; uname -a
    echo -e "\nUsers logged on:" ; w -h
    echo -e "\nCurrent date :" ; date
    echo -e "\nMachine status :" ; uptime
    echo -e "\nMemory status :" ; free
    echo -e "\nFilesystem status :"; df -h
}

function ll()
{
	ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| \ egrep -v "^d|total ";
}

function gitstats()
{
	git log --author=$1 --shortstat $2 --since=$3 | \
		awk '/^ [0-9]/ { f += $1; i += $4; d += $6 } \
		END { printf(" %d files changed\n %d insertions(+)\n %d deletions(-)\n", f, i, d) }'
}

PATH=$PATH:$HOME/bin:$HOME/.rvm/bin

