#!/bin/sh
# Ref: https://www.sitepoint.com/quick-tip-multiple-versions-node-nvm/
# author: huong.nhdh@gmail.com
# install node with multi version for development using NVM
# Step 1: Remove node exits
# NOTED: ubuntu 17.10

sudo -e  # print error
sudo -v # ask sudo permission

_remove_node(){
    sudo apt-get purge --auto-remove nodejs -y
    sudo apt-get update -y
} 
_install_nvm(){

}
