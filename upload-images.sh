#!/usr/bin/fish

scp *.jpg sstoltze@ssh1.imf.au.dk:~/public_html/
scp -r indien sstoltze@ssh1.imf.au.dk:~/public_html/
ssh sstoltze@ssh1.imf.au.dk "cd public_html; chmod o+r *.jpg; chmod -R o+r indien; chmod o+x indien; cd indien; chmod o+x *;"
cd ../photos
for d in "Budapest"
    zip -r $d $d
    scp $d.zip sstoltze@ssh1.imf.au.dk:~/public_html/
    ssh sstoltze@ssh1.imf.au.dk "cd public_html; chmod -v 704 $d.zip"
    rm $d.zip
end
