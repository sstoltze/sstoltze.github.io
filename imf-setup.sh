#!/bin/bash
# Check if user has supplied a username and if user is the owner of /home/username
if [ -n "$1" ] && [ -O "/home/$1" ]; then
    echo "User: $1"
    cd /home/

    echo "Setting permissions for '/home/$1/'"
    chmod o+x $1

    cd $1

    echo "Making directory 'public_html'"
    mkdir -p public_html;

    echo "Setting permissions for '/home/$1/public_html'"
    chmod o+x public_html;

    cd public_html

    echo "Creating 'index.html'"
    touch index.html

    echo "Creating '.htaccess'"
    if [ ! -f .htaccess ]; then
	echo "AddCharset utf-8 .html" > .htaccess
	chmod o+r .htaccess
    fi

    echo "Setting permissions for 'index.html'"
    chmod o+r index.html;

    echo 'Done'
else
    echo "You are not the owner of '/home/$1'"
fi
