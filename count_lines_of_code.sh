#!/bin/bash
find .|grep \
-e '\.java$' \
-e '\.cp*$' \
-e '\.m$' \
-e '\.mm$' \
-e '\.hp*$' \
-e '\.c$' \
-e '\.h$' \
-e '\.cs$' \
-e '\.xib$' \
-e '\.xa*ml$' \
-e '\.css$' \
-e '\.html$' \
-e '\.jsp$' \
-e '\.sql$' \
|while read line
do
  cat "$line"
done | wc -l
