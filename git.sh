#!/bin/sh
#: '
# author: huongnhdh@gmail.com
#'
# set -xeuo pipefail
# IFS=$'\n\t'

for i in "$@"
do
case $i in
    -e=*|--email=*)
    EMAIL=${i#*=}
    ;;
    -u=*|--user_name=*)
    USER_NAME="${i#*=}"
    ;;
    *)
            # unknown option
    ;;
esac
done
#if [ ! -n $USER_NAME ]
#then 
#  $USER_NAME="huongnhd" 
#fi
# set default value
${USER_NAME:='huongnhd'}
${EMAIL:='huongnhdh@gmail.com'}
echo "USER_NAME = ${USER_NAME}"
echo "EMAIL = ${EMAIL}"

# generate key
ssh-keygen -t rsa -C ${USER_NAME}

# copy to clipboard
xclip -sel c < ${HOME}/.ssh/id_rsa.pub
cat ${HOME}/.ssh/id_rsa.pub | xclip -i 

# git config user.name ${USER_NAME}
git config --global user.name ${USER_NAME}
git config --global user.email ${EMAIL}
git config --global color.ui true

# set up git alias
curl -o ${HOME}/.gitalias.txt https://raw.githubusercontent.com/GitAlias/gitalias/master/gitalias.txt
git config --global include.path ${HOME}/.gitalias.txt
