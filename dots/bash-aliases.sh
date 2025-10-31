alias   a=alias
alias   "f=typeset -f"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history 1|sed '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

md() {
  mkdir -p "$1"
   cd "$1";
}

-() { less -i "$@"; }

alias   '+=more'
alias   pd=pushd
alias   pp=popd
alias   rmf='rm -f'
alias   o=xdg-open

#chmod
#
alias   'cx=chmod +x'
alias   'cw=chmod +w'

# grep
#
alias   'g=egrep -i'

# misc
#
psg() {
  ps ax -Fww | egrep $1 | egrep -v grep;
}

psgm() {
  ps x -Fww | egrep $1 | egrep -v grep;
}

hex2dec() {
  echo "ibase=16; `echo $1 | tr "[a-z]" "[A-Z]"`"| bc
}

alias   '.=source'
alias   'jad=jad -s java -space -b -ff -nonlb -o -t2'
alias   'ij=(/usr/lib/intellij-idea-7.0/bin/idea.sh >& /dev/null &)'
alias   'ij9=(/usr/lib/intellij-idea-9/bin/idea.sh >& /dev/null &)'
alias   'ij10=(/usr/lib/intellij-idea-10/bin/idea.sh >& /dev/null &)'
#alias   'syn=/usr/bin/synergys --name kabina --config /etc/synergy.conf'

# Java
alias 'debug-suspend=export DEFAULT_JVM_DEBUG_SUSPEND=y'
alias 'debug-unsuspend=export DEFAULT_JVM_DEBUG_SUSPEND=n'

# ssh
alias 'ssh=ssh -X'

_which() {
  _whichAll=
  if [ "$1" = "-a" ]; then
     _whichAll=-a
    shift
  fi

  alias $1 2> /dev/null
  if [ "${_whichAll}" = "" -a $? -eq 0 ]; then
    return
  fi

  typeset -f $1
  if [  "${_whichAll}" = "" -a $? -eq 0 ]; then
    return
  fi

  which ${_whichAll} $1
}

# which
#
alias   wh=_which
alias   "where=_which -a"
alias   wr=where

# Tidy
#
a 'tidy=tidy -i'

# Reformat stuff
a xml='xmlstarlet fo'
a zx='zcat | xml'
a json='python -mjson.tool'
a j=json
a zjson='zcat | json'
a zj=zjson
a nl="sed -e 's/\\\\n/\n/g' -e 's/\\\\t/\t/g'"

# History
a h=history

# Android
sc() {
  adb shell screencap /sdcard/sc-$$.png
  adb pull /sdcard/sc-$$.png $1
  adb shell rm /sdcard/sc-$$.png
}

alias "systrace=~/android-sdk/platform-tools/systrace/systrace.py"
alias "br=adb bugreport > $1"

version-info() {
  if [ $# -eq 1 ]; then
    adb shell dumpsys package | grep -A 10 "^  Package \[.*$1" | egrep '(^  Package)|(version)'
  else
    grep -A 10 "^  Package \[.*$1" $2 | egrep '(^  Package)|(version)'
  fi
}

#DOS/Unix
dos2unix() {
   tr -d '\r' < "$1" > t;   mv -f t "$1";
}
unix2dos() {
   sed -i 's/$/\r/' "$1";
}

g4d() {
  cd /google/src/cloud/aalbert/$1/google3
}


alias prodaccess="ssh -t work prodaccess"

rebase() {
  hg rebase -s $1 -d $2 && hg xl
}

repo-start() {
  repo start aalbert-$1
}
