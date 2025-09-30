#! /bin/zsh

dir_root="videos"
dir_hori="${dir_root}/horizontal"
dir_vert="${dir_root}/vertical"

function create_dirs() {
  if [ ! -d "$dir_root" ]; then 
    mkdir $dir_root
    mkdir $dir_hori
    mkdir $dir_vert
  fi
}

for f in *.mp4; do
  create_dirs
  if echo "$f" | grep -q '_v'; then
    mv "$f" "${dir_vert}/${f}"
  else
    mv "$f" "${dir_hori}/${f}"
  fi
done

