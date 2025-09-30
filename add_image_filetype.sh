#! /bin/zsh

for f in images/*; do
  if [[ $f != *.png ]]; then
    mv "$f" "${f}.png"
  fi
done
