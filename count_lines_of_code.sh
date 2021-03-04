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
-e '\.js$' \
-e '\.jsp$' \
-e '\.sql$' \
-e '\.py$' \
|while read line
do
  cat "$line"
done | wc -l
