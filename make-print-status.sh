#!/bin/bash
printers=(A3 A4 B3)
nr=${#printers[*]}
status=()
for (( i=0;i<$nr;i++ )); do
    if lpstat -p ${printers[i]} | grep -q enabled ; then
        status[i]='oppe'
    else
        status[i]='nede'
    fi
done
cd /home/sstoltze/public_html/

echo '<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8" />
  <meta name="author" content="Sarah Stoltze" />
    <style>
        h3     { text-align: center; font-size: 18pt; line-height: 1.5em; }
        h2     { text-align: center; font-size: 24pt; line-height: 2.5em; }
        h1     { text-align: center; font-size: 36pt; line-height: 4em; }
        footer { position: absolute; bottom: 1em; font-size: 9pt; }
    </style>
    <title>A2</title>
  </head>
  <body>
  <br /><h2>Er A2-printeren oppe?</h2>
  <h1>' > a2.html
if lpstat -p A2 | grep -q enabled ; then
    echo 'Ja!' >> a2.html
else
    echo '<a href="mailto:daleif@math.au.dk?Subject=A2">Nej!</a>' >> a2.html
fi
echo '</h1>' >> a2.html
echo '<br /><h3>Derudover:<br />' >> a2.html
for (( i=0;i<$nr;i++ )); do
    echo "${printers[i]} er ${status[i]}." >> a2.html
done
echo '</h3>' >> a2.html
echo '<footer>Sidst opdateret ' >> a2.html
date +"%Y-%m-%d kl. %R." >> a2.html
echo '</footer></body></html>' >> a2.html
chmod o+x a2.html
