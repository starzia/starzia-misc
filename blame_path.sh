#!/bin/bash
# Lists the number of lines of code attributed to each author for a given path.
# This is useful for answering the question "who should I ask about this code?".
#
# Usage is:
#  > blame_path.sh [path]
# If path is omitted then the current folder is used

# Mac's don't have a /dev/null
DEV_NULL=/tmp/dev_null

# use the current path if omitted
path="$1"
if [ "$path" == "" ]; then
   path="."
fi

# cd into the path because git commands don't work outside of the repo
if [ -d "$path" ]; then
   parent="$path"
   path="."
else
   parent=$(dirname "$path")
   path=$(basename "$path")
fi
pushd "$parent" > $DEV_NULL

accumulator=/tmp/blame.sh.$$.tmp
# create a file naming the author of each line of code in the folder
git ls-tree -r --name-only master $path | while read file; do
    git blame --line-porcelain "${file}" |grep "author "|cut -c 8-
done > $accumulator

# count occurences of each name
sort $accumulator | awk '
{if ($0==prev_name){
  count++;
}else{
  printf("%d %s\n", count, prev_name); 
  prev_name=$0;
  count=1;
}}' | sort -n

# cleanup
popd > $DEV_NULL
rm $accumulator $DEV_NULL
