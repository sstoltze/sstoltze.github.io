scp -pC *.html sstoltze@ssh1.imf.au.dk:~/public_html/
find ./olopgaver/ ./uni/ -name "*.pdf" -exec scp -pC '{}' sstoltze@ssh1.imf.au.dk:~/public_html/ ';'
scp -pC *.pdf  sstoltze@ssh1.imf.au.dk:~/public_html/
scp -pC *.css  sstoltze@ssh1.imf.au.dk:~/public_html/
scp -pC *.png  sstoltze@ssh1.imf.au.dk:~/public_html/
scp -pC *.ico  sstoltze@ssh1.imf.au.dk:~/public_html/
scp -pC .htaccess sstoltze@ssh1.imf.au.dk:~/public_html/
scp -pC imf-setup.sh sstoltze@ssh1.imf.au.dk:~/public_html/
scp -pC make-print-status.sh sstoltze@ssh1.imf.au.dk:~/public_html/
ssh sstoltze@ssh1.imf.au.dk "cd public_html; chmod -R -v 704 *.html *.pdf *.css imf-setup.sh .htaccess *.jpg *.png *.ico indien; chmod a+x make-print-status.sh; sh make-print-status.sh; sh ./jul/julekalender.sh; chmod o+x indien; cd indien; chmod o+x *;"

