pathmunge () {
      if ! echo "$PATH" | grep -Eq "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH="$PATH:$1"
           else
              PATH="$1:$PATH"
           fi
    fi
}
pathmunge ~/bin

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-*color|screen-*color) color_prompt=yes;;
esac

if [ -f ~/.bash-git-prompt ]; then
    . ~/.bash-git-prompt
else
  PS1='[\t] (\h) \W\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen.xterm*|screen.rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/\~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash-aliases ]; then
    . ~/.bash-aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# History
export HISTCONTROL=erasedups:ignorespace
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=1000000
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a"
shopt -s cmdhist
shopt -s histappend

if [ -f ~/.bash-google ]; then
    . ~/.bash-google
fi

# Key bindings
if [ -f ~/.bash-bindings ]; then
  bind -f ~/.bash-bindings
fi

# Repo
if [ -f ~/.bash-completion-git-repo ]; then
    . ~/.bash-completion-git-repo
fi

# https://askubuntu.com/questions/70750/how-to-get-bash-to-stop-escaping-during-tab-completion
shopt -s direxpand

export VISUAL=$EDITOR
