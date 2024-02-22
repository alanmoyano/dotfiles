#!/bin/zsh

if [[ $# -ne 1 ]]; then
  >&2 echo "usage: $0 FILENAME"
  exit 1
fi

file=$1
type=$(file --dereference --mime -- $file)

if [[ $type =~ inode/directory ]]; then
  eza --icons --total-size -l --tree -L=1 --colour=always -- $file
else
  bat --paging=never --color=always -- $file
fi

exit