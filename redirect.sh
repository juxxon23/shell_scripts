#! /bin/bash

# simple input redirection '<'.
echo "Simple redirect"
echo "test text" > file_name
wc < file_name
rm file_name
# Expected: [lines: 1, words: 2, characters: 10]

# here-document struct '<<' read input from the current source.
# EOF is just a tag that tells the shell where starts and ends 
# a multiline string.
echo "Here-document redirect"
wc << EOF
hola que tal
muy bien
EOF
# Expected: [lines: 2, words: 5, characters: 22 (with spaces)]

# here-string struct '<<<' read pre-made string of text as input.
echo "Here-string redirect"
bc <<< 5*4
echo '5*4' | bc
# Expected: [20]

# process substitution '<()' feeds the output of a process into the stdin of
# another process.
# it's used when piping cannot be used
echo "Process substitution redirect"
echo "First example"
wc < <(echo bar;echo foo)
# Expected: [lines: 2, words: 2, characters: 8]
echo "Second example"
echo 'foo' | read; echo ${REPLY}
# will not return foo, because read is started in a sub-shell — piping starts a sub-shell.
read < <(echo 'foo'); echo ${REPLY}
# correctly returns foo, because there is no sub-shell.


# https://askubuntu.com/questions/678915/whats-the-difference-between-and-in-bash
# https://www.golinuxcloud.com/linux-file-descriptors/
