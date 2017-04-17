#!/bin/bash
set -e
sudo -v

# install vim
echo "Install vim "
 #nstall vim
 cd ~/.tmp
 git clone https://github.com/vim/vim.git
 cd vim/src
 ./configure --with-features=huge \
          --enable-multibyte \
          --enable-rubyinterp=yes \
          --enable-pythoninterp=yes \
          --with-python-config-dir=/usr/lib/python2.7/config \
          --enable-python3interp=yes \
          --with-python3-config-dir=/usr/lib/python3.5/config \
          --enable-perlinterp=yes \
          --enable-luainterp=yes \
          --enable-gui=gtk2 --enable-cscope --prefix=/usr
 make
 sudo make install
 #install extention vim     
 #=========================
 # install awesome vim for use it
 git clone https://github.com/amix/vimrc.git ~/.vim_runtime
 sh ~/.vim_runtime/install_awesome_vimrc.sh




