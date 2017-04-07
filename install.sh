# this file refenced https://github.com/dinhnv/dev-os/blob/master/linux.sh
# Needing sudo permisstion for run a some command install application

set -e 

sudo -v

# first we need update and upgrade
# create  a tmp folder

cd ~
mkdir -p $HOME/.tmp
CURRENT_FOLDER = $(pwd)

update_system(){
  sudo apt-get -y update
  sudo apt-get -y upgrade
}

install_vpn_client(){
  # install ovpn
  # http://askubuntu.com/questions/760664/ubuntu-16-04-openvpn
  sudo apt-get -y install network-manager-openvpn\
                          network-manager-openvpn-gnome\
                          network-manager-pptp\
                          network-manager-vpnc
}

# Generating Your SSH Public Key
gernarate_ssh_key_git(){
  ssh-keygen -t rsa -C "ngohoaidiemhuong.1994@gmail.com"
  ssh-keygen -t rsa -C "huongnhd@evolableasia.vn"
}

install_util(){
  # install git, curl, unikey
  sudo apt-get -y install git
  sudo apt-get -y install curl
  sudo apt-get -y install ibus-unikey
  
}

install_theme (){
  # install theme_numix 
  # reference https://itsfoss.com/install-numix-ubuntu/
  sudo add-apt-repository ppa:numix/ppa
  sudo apt-get -y update
  sudo apt-get -y install numix-gtk-theme numix-icon-theme-circle
  sudo apt-get -y install numix-wallpaper-*
  sudo apt-get -y install unity-tweak-tool
}
# install_jdk_oracle
install_jdk8_oracle(){
  sudo apt-get -y update;
  sudo add-apt-repository ppa:webupd8team/java;
  sudo apt-get -y update;
  sudo apt -y update;
  sudo apt -y install oracle-java8-installer;
  sudo apt install -y oracle-java8-set-default
  
}
install_application_chorme(){
    # install chorme,skype, pycharm, DBeaver, subl, wps office  
    cd ~/.tmp
    # https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    # chorme 
    curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
}
install_skype(){
    # skype
    cd ~/.tmp
e    curl -O https://repo.skype.com/latest/skypeforlinux-64.deb
    sudo dpkg -i  skypeforlinux-64.deb
}
  install_pycharm(){
  # pycharm 
    cd ~/.tmp
    curl -O https://download-cf.jetbrains.com/python/pycharm-professional-2017.1.tar.gz
    tar -xzvf pycharm-professional-2017.1.tar.gz
    cd pycharm-professional-2017.1/bin
    ./install
}
install_dbeaver(){
    cd ~/.tmp
    # http://dbeaver.jkiss.org/files/4.0.4/dbeaver-ce_4.0.4_amd64.deb
    curl -O http://dbeaver.jkiss.org/files/4.0.4/dbeaver-ce_4.0.4_amd64.deb
    sudo dpkg -i dbeaver-ce_4.0.4_amd64.deb
}
install subl(){
  # sublime
    cd ~/.tmp
    sudo add-apt-repository ppa:webupd8team/sublime-text-3;
    sudo apt-get install sublime-text-installer;
}
install_wps(){
  cd ~/.tmp
  # wps office
  ## remove libre office 
  sudo apt-get -y  purge libreoffice*
  sudo apt-get autoclean
  sudo apt-get autoremove
  ## install wps
  cd ~/.tmp
  curl -O http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_amd64.deb 
  sudo dkpg -i wps-office_10.1.0.5672~a21_amd64.deb
}
install_vim(){
   #nstall vim
   cd ~/.tmp;
   git clone https://github.com/vim/vim.git;
   cd vim/src;
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
   make;
   sudo make install;
   #install extention vim     
   #=========================
   #reference at: https://github.com/egalpin/apt-vim
   #curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
   #app-vim init;
   # create file vim rc
   #=========================
   # install awesome vim for use it
   git clone https://github.com/amix/vimrc.git ~/.vim_runtime
   sh ~/.vim_runtime/install_awesome_vimrc.sh
}
__main__(){
  update_system
  install_util
  install_theme
  install_vpn_client
  gernarate_ssh_key_git
}
__main__()



