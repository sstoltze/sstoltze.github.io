scp -pCr jul/ sstoltze@ssh1.imf.au.dk:~/public_html/
ssh sstoltze@ssh1.imf.au.dk "cd public_html; cp -r jul/julebilleder .; chmod -R -v 704 *.html *.png jul julebilleder; chmod a+x ./jul/julekalender.sh; sh ./jul/julekalender.sh; chmod o+x jul julebilleder jul/julebilleder;"

