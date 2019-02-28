# os ubuntu 17.04 for dev

curl -sSL https://raw.githubusercontent.com/huongnhdh/os/master/install.sh | sh

## Manual install git setting
```bash
 curl -O https://raw.githubusercontent.com/huongnhdh/os/master/git.sh
 sudo chmod +x git.sh
 ./git.sh --email=huongnhdh@gmail.com --username=huongnhd
 ```
## Manual install docker and docker compose on ubuntu
 curl -sSL "https://gist.githubusercontent.com/huongnhdh/ef9a08e8e1fb82333d70cb749adbc2ee/raw/3757a90943fa83c2fbb06fda9dadc857d9189b67/install_latest_docker_compose.sh" | sh
