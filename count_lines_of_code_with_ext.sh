#!/bin/bash
find . | grep -e "\.$1\$" | while read line
do
  cat "$line"
done | wc -l
