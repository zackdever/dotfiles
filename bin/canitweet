#!/bin/bash

function fail() {
  echo $1
  echo "example usage:"
  echo
  echo -e "\t$ ${0##*/} \"hello, world\""
  echo -e "\t$ ${0##*/} # uses the clipboard if possible"
  echo
  exit 1
}

if [ $# -eq 0 ]; then
  if [ `command -v pbpaste` >/dev/null 2>&1 ]; then
    TWEET=`pbpaste`
  elif [ `command -v xsel` >/dev/null 2>&1 ]; then
    TWEET=`xsel`
  elif [ `command -v xclip` >/dev/null 2>&1 ]; then
    TWEET=`xclip`
  fi

  if [ -z "$TWEET" ]; then
    fail "No argument passed and I don't know how to check your clipboard."
  else
    echo -e "No argument supplied, using clipboard:\n"
    echo -e "\t$TWEET"
    echo
  fi
elif [ $# -gt 1 ]; then
  fail "whoa, that's too many arguments."
else
  TWEET=$1
fi

if [ -z "$TWEET" ]; then
  fail "argh... either an empty argument or nothing in the clipboard to check!"
fi

COUNT=${#TWEET}
DIFF=$((140 - $COUNT))

if [ $COUNT -le "140" ]; then
  echo "Tweet away! ($DIFF characters remaining)"
else
  echo "Shucks, that's $(($DIFF * -1)) characters too long."
fi
