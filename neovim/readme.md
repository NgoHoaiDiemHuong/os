# Installation
## Install Prerequisites
```sh
sudo apt-get install fonts-powerline
sudo apt-get install exuberant-ctags
sudo apt-get install cmake
sudo apt-get install clang
pip3 install --upgrade pip
pip3 install jupyter
```

```sh
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

## Install neovim
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

## Install plugin Manager
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# nvim with :PlugInstall and update them with :UpdateRemotePlugins
```
## Setup environment

```bash
# adding to ~/.bash, ~/.zshrc
alias vi='nvim'
```
```bash
# update editor alternatives
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```
```bash
git clone init.vim ~/.config/nvim
```
