# install ovpn
# http://askubuntu.com/questions/760664/ubuntu-16-04-openvpn
sudo apt-get -y install network-manager-openvpn\
                        network-manager-openvpn-gnome\
                        network-manager-pptp\
                        network-manager-vpnc

# Generating Your SSH Public Key
ssh-keygen -t rsa -C "ngohoaidiemhuong.1994@gmail.com"
ssh-keygen -t rsa -C "huongnhd@evolableasia.vn"
