# Asterisk_Docker

VERSIONS

CENTOS: 7.9xx

ASTERISK: 16.17.0

Steps:
git clone https://github.com/koripella3/Asterisk_Docker.git

git checkout centos

docker build -t asterisk_centos

docker images

docker run -p 5060:5060/udp -p 4569:4569/udp --name asterisk_centos asterisk_centos /bin/bash
