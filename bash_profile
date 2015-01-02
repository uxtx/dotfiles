#
# OSX aliases
#

alias gitx="open -a GitX"

# # anything local?
if [ -e $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

# vim cmd line
set -o vi

# git related shellery
 export GIT_PS1_SHOWDIRTYSTATE=1
 source /usr/local/git/contrib/completion/git-completion.bash


prompt_command() {
    local BLACK="\[\033[0;30m\]"
    local RED="\[\033[0;31m\]"
    local GREEN="\[\033[0;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local BLUE="\[\033[0;34m\]"
    local MAGENTA="\[\033[0;35m\]"
    local CYAN="\[\033[0;36m\]"
    local WHITE="\[\033[0;37m\]"
    local BBLACK="\[\033[1;30m\]"
    local BGREEN="\[\033[1;32m\]"
    local BMAGENTA="\[\033[1;35m\]"
    local BCYAN="\[\033[1;36m\]"
    local BWHITE="\[\033[1;37m\]"
    local DARKGRAY="\[\033[01;34m\]"
    local BOLDGRAY="\[\033[01;31m\]"
    local DEFAULT="\[\033[0;39m\]"

    if [ $(type -t __git_ps1) ]; then
        local BRANCH="$( __git_ps1 "(%s)" )"
    fi

    if [ $UID == 0 ];then
        local PROMPT_ROOT="${RED}\h${DEFAULT}"
        local PROMPT_C="#"
    else
        local PROMPT_ROOT="\h"
        local PROMPT_C="\$" # but shouldn't this replace if root? yes.. sigh.
        # but there were certain instances where this character wasn't getting
        # replaced properly
    fi

    export PS1='${PROMPT_ROOT}:${DARKGRAY}\W${BOLDGRAY}$(type -t __git_ps1>/dev/null && __git_ps1 "(%s)")${DEFAULT}\$ ' # user
}
# PROMPT_COMMAND=prompt_command

# set up the prompt for the right context
# changes hostname to red if root
export PS1='$( if [ $UID != 0 ]; then echo -n "\[\033[01;32m\]" ; else echo -n "\[\033[0;31m\]"; fi )\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[01;31m\]$(typeset -f __git_ps1>/dev/null && __git_ps1 "(%s)")\[\033[00m\]\$ ' # user


alias sr="sudo bash --login "
alias hilite='egrep -e"" --color=auto -e'
alias r='rsync -a --progress --partial'



# Setup some colors to use later in interactive shell or scripts
export COLOR_NONE='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export CLICOLOR=1

export GREP_COLOR=$COLOR_RED

alias colorslist="set | egrep 'COLOR_\w*'" # Lists all colors
alias l="ls -lrtF"
alias ll="ls -lF"

# pip command line completion is nice too
# which pip >/dev/null 2>&1 && eval "`pip completion --bash`"
# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

export PATH=/usr/local/bin:$PATH

export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
source `which virtualenvwrapper.sh`

# virtualenv things
source /usr/local/bin/virtualenvwrapper.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin
