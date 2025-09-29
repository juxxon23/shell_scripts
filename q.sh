#! /bin/zsh

function processArgs() {
  Q1=
  for arg in $@
  do
    Q1+="${arg}, "
  done
  Q2="(${Q1%,*})" # Remove last comma
  echo ${Q2}

}

function test() {
 processArgs $@ 
}

test "$@"
