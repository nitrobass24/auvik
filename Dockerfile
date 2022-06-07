FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

RUN \
apt-get update && \
apt-get upgrade -y
bash -c "rm -rf ./auvik_installer install.sh && umask 0022 && curl --verbose --location-trusted --header \"Accept: text/plain\" --user sdavis@redboxplus.com https://rbpaustinhq.my.auvik.com/agents/installer > install.sh && grep -wq __ARCHIVE_BELOW__ install.sh && chmod 0755 install.sh && bash -x ./install.sh 2>&1 | tee /tmp/install.log"
