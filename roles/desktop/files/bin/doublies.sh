#!/bin/bash
#

echo 'find . -type f -exec md5sum {} \; -exec ls -sh {} \; > doublies.txt'
echo 'vim doublies.txt'
echo ':%s/^\([0-9a-z]\{32}\)  \(.\/.*\)$\n\(.*\)\2/\1\t\3\t\2/'
echo 'sort doublies.txt |uniq -Dw 32| sort -hk2 > doublies.sorted '

