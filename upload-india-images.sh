#!/usr/bin/fish

scp -pCr ./indien/ sstoltze@ssh1.imf.au.dk:~/public_html/
ssh sstoltze@ssh1.imf.au.dk "cd public_html; chmod o+r *.jpg; chmod -R o+r indien; chmod o+x indien; cd indien; chmod o+x *;"

