#!/bin/bash
:'COMMENT'
@author: huongnhdh@gmail.com
'
set -euo pipefail
IFS=$'\n\t'

for i in "$@"
do
case $i in
    -e=*|--email=*)
    EMAIL="${i#*=}"
    ;;
    -u=*|--user_name=*)
    USER_NAME="${i#*=}"
    ;;
    *)
            # unknown option
    ;;
esac
done
${USER_NAME:='huongnhd'}
${EMAIL:='huongnhdh@gmail.com'}
echo USER_NAME = ${USER_NAME}
echo EMAIL = ${EMAIL}

# generate key
ssh-keygen -t rsa -C ${USER_NAME}

# copy to clipboard
xclip -sel c < .ssh/id_rsa.pub
cat .ssh/id_rsa.pub | xclip -i 

# git config user.name ${USER_NAME}
git config --global user.name ${USER_NAME}
git config --global user.email ${EMAIL}
git config --global color.ui false
