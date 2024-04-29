#!/bin/zsh

if [[ $# -ne 1 ]]; then
  >&2 echo "usage: $0 FILENAME"
  exit 1
fi

file=$1
type=$(file --dereference --mime -- $file)

if [[ $type =~ inode/directory ]]; then
  eza --icons=always --colour=always --total-size -alTL=1 --no-permissions --no-user -- $file
else
  bat --paging=never --color=always -- $file
fi

exit
