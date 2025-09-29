#! /bin/zsh

for f in images/*; do
  if [[ $f != *.jpg ]]; then
    mv "$f" "${f}.jpg"
  fi
done
