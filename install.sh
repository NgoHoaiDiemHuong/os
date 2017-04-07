# this file refenced https://github.com/dinhnv/dev-os/blob/master/linux.sh
# Needing sudo permisstion for run a some command install application

set -e 

sudo -v

# first we need update and upgrade
# create  a tmp folder

cd ~
mkdir -p $HOME/.tmp
mkdir -p $HOME/.opt
export CURRENT_FOLDER=$(pwd)

_update_system(){
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
  echo "# installing git, curl, unikey ..... "
  sudo apt-get -y install git
  sudo apt-get -y install curl
  sudo apt-get -y install ibus-unikey
  
}

install_theme (){
  # install theme_numix 
  # reference https://itsfoss.com/install-numix-ubuntu/
  echo "installing theme numix"
  sudo add-apt-repository ppa:numix/ppa
  sudo apt-get -y update
  sudo apt-get -y install numix-gtk-theme numix-icon-theme-circle
  sudo apt-get -y install numix-wallpaper-*
  sudo apt-get -y install unity-tweak-tool
}
# install_jdk_oracle
_jdk8_oracle(){
  echo "install jdk oracle"
  sudo apt-get -y update;
  sudo add-apt-repository ppa:webupd8team/java;
  sudo apt-get -y update;
  sudo apt -y update;
  sudo apt -y install oracle-java8-installer;
  sudo apt install -y oracle-java8-set-default
  
}
_chorme(){
    echo "install chorme"
    # install chorme,skype, pycharm, DBeaver, subl, wps office  
    cd ~/.tmp
    # https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    # chorme 
    curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
}
_skype(){
    echo "install skype"
    # skype
    cd ~/.tmp
    curl -O https://repo.skype.com/latest/skypeforlinux-64.deb
    sudo dpkg -i  skypeforlinux-64.deb
}
_pycharm(){
  echo "install pycharm"
  # pycharm 
    cd ~/.tmp
    curl -O https://download-cf.jetbrains.com/python/pycharm-professional-2017.1.tar.gz
    tar -xzvf pycharm-professional-2017.1.tar.gz
    cd pycharm-professional-2017.1/bin
    ./install
}
_dbeaver(){
    echo "InstallDBEVER"
    cd ~/.tmp
    # http://dbeaver.jkiss.org/files/4.0.4/dbeaver-ce_4.0.4_amd64.deb
    curl -O http://dbeaver.jkiss.org/files/4.0.4/dbeaver-ce_4.0.4_amd64.deb
    sudo dpkg -i dbeaver-ce_4.0.4_amd64.deb
}
_subl(){
  echo "install sublime text"
  # sublime
    cd ~/.tmp
    sudo add-apt-repository ppa:webupd8team/sublime-text-3;
    sudo apt-get install sublime-text-installer;
}
_wps(){
  echo "install KING office"
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
install_app(){
  _chorme
  _skype
  _pycharm
  _dbeaver
  _subl
  _wps
}
_vim(){
  echo "Install vim ";
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
install_build_package(){
  echo "Install build pakage"
sudo apt-get -y install libevent-dev ncurses-dev \
                        build-essential make automake software-properties-common \
                        python-dev python3-dev gcc libssl-dev \
                        zlib1g-dev libpq-dev libtiff5-dev libjpeg8-dev libfreetype6-dev \
                        liblcms2-dev libwebp-dev graphviz-dev gettext libbz2-dev \
                        libreadline-dev libsqlite3-dev xclip
}
_docker() {
    echo "install docker\n"
    curl -sSL "https://gist.githubusercontent.com/dinhnv/fa0ffbd5aab37e8dc5956992a559da41/raw/install_latest_docker_compose.sh" | sh
}
install_env_dev(){
  _docker
  _jdk8_oracle
}
_tmux(){
  cd ~/.opt && rm -rf tmux*
  git clone https://github.com/tmux/tmux.git
  cd tmux
  sh autogen.sh
  ./configure && make
  sudo make install
  
  cd $HOME && {curl -O https://raw.githubusercontent.com/NgoHoaiDiemHuong/os/master/.tmux.conf}
  tmux source-file ~/.tmux.conf;
  
}
install_term(){
  _tmux
  _vim
}
_clean() {
    sudo apt-get -y autoclean
    sudo apt-get -y clean
    sudo apt-get -y autoremove
}
__main__(){
  echo "Start instaling" ;
  
  #_update_system
  
  #install_util
  
  #install_build_package
  
  #install_theme
  
  #install_vpn_client
  
  install_term
  
  install_env_dev
  
  install_vpn_client
  
  install_app
  
  gernarate_ssh_key_git
  
  echo "All app installed";
  _clean
}


__main__




