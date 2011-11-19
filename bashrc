# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PATH=/home/vijay/projects/github/scripts:/opt/ruby-enterprise-1.8.7-2010.02/bin:$PATH
export GEMPATH=$GEMPATH:/opt/ruby-enterprise-1.8.7-2010.02/bin

alias gph="git push"
alias gpl="git pull"
alias capd="cap deploy"
alias gdf="git diff"
alias gdfc="git diff --color-words"
alias gss="git status"
alias rdm="rake db:migrate"
alias open='gnome-open'
alias tv='cd /home/vijay/projects/twitvance'
alias rg='cd /home/vijay/projects/github/lifo-docrails/railties/guides/source'
alias rs='cd /home/vijay/projects/github/rails-rails'
alias rd='cd /home/vijay/projects/github/lifo-docrails'
alias rgg='rake generate_guides'
alias 'ps?'='ps aux | grep'
alias 'makemp3'='mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile'
alias sudo='sudo env PATH=$PATH'
alias sai='sudo apt-get install'
alias sc='cd /home/vijay/projects/github/scripts'
alias rr='rake routes'
alias rjw='rake jobs:work'
alias ack='ack-grep'
alias crd='cap review deploy'
alias cpd='cap production deploy'
alias cpdp='cap production deploy:pending'
alias cpdm='cap production deploy:migrations'
alias prodn='git co production && git merge master'
alias live='prodn && gph && crd && cpd'
alias gsmu='git submodule sync && git submodule update'
alias gsu='git submodule update'
alias bi='bundle install'
alias arec='cd activerecord'
alias asup='cd activesupport'
alias ares='cd activeresource'
alias mdocrails='rs && ruby /home/vijay/projects/github/scripts/merge_docrails.rb'
alias gprm='git pull rails master'
alias png='ping google.com'
alias rubyt='ruby -Ilib -Itest'
export EDITOR=vim
source $HOME/.git-completion.sh

function rss {
  if [ -e "./script/server" ]; then
    ./script/server $@
  else
    rails server $@
  fi
}
function rsc {
  if [ -e "./script/console" ]; then
    ./script/console $@
  else
    rails console $@
  fi
}

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="${debian_chroot:+($debian_chroot)}[\w\$(parse_git_branch)]$ "
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh
