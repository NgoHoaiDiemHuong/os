set -e
sudo -v

_jdk(){
  # ubuntu 16.04, 17.04 64 bit
  # install jdk 8 from Oracle officel
  # install Oracle client (SQL PLUS)
  # http://www.tecmint.com/install-java-jdk-jre-in-linux/
  # https://ivan-site.com/2012/05/download-oracle-java-jre-jdk-using-a-script/
  # remove all jdk openjdk
  sudo apt-get remove openjdk-*

  mkdir -p /opt/java
  cd /opt/Java
  # download .tar file in Oracle Home
  wget --no-cookies --no-check-certificate \
       --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
          "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz"
  tar -xzvf jdk-8u121-linux-x64.tar.gz

  # update  update-alternatives
  cd jdk1.8.0_121/
  update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_121/bin/java 100
  update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_121/bin/java 100 
  update-alternatives --install /usr/bin/jar jar /opt/java/jdk1.8.0_121/bin/jar 100

  # if you had many version Java you can update command 
  # update-alternatives --config java
  # update-alternatives --config javac
  # update-alternatives --config jar
  echo "
  export JAVA_HOME=/opt/java/jdk1.8.0_121/
  export JRE_HOME=/opt/java/jdk1.8.0_121/jre
  export PATH=\$PATH:/opt/java/jdk1.8.0_121/bin:/opt/java/jdk1.8.0_121/jre/bin
  " >> ~/.bashrc

  source ~/.bashrc
 }
_jdk

