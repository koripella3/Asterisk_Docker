FROM docker.io/centos:7.9.2009

RUN yum update -y
RUN yum install net-tools -y
RUN yum install wget -y
RUN yum -y install make gcc gcc-c++ make subversion libxml2-devel ncurses-devel openssl-devel vim-enhanced man glibc-devel autoconf libnewt kernel-devel kernel-headers linux-headers openssl-devel zlib-devel libsrtp libsrtp-devel uuid libuuid-devel mariadb-server jansson-devel libsqlite3x libsqlite3x-devel epel-release.noarch bash-completion bash-completion-extras unixODBC unixODBC-devel libtool-ltdl libtool-ltdl-devel mysql-connector-odbc mlocate libiodbc sqlite sqlite-devel sql-devel.i686 sqlite-doc.noarch sqlite-tcl.x86_64
RUN yum install bzip2 -y
RUN mkdir -p ~/src/asterisk/
RUN cd /root/src/asterisk/
RUN wget https://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-16.17.0.tar.gz
RUN tar -xzvf asterisk-16.17.0.tar.gz
RUN /bin/sh asterisk-16.17.0/contrib/scripts/install_prereq install
#RUN /bin/sh asterisk-16.17.0/contrib/scripts/install_prereq install-unpackaged
WORKDIR asterisk-16.17.0
#RUN /bin/sh configure --with-pjproject-bundled --with-jansson-bundled
RUN /bin/sh configure --libdir=/usr/lib64 --with-jansson-bundled
RUN make
RUN make install
RUN make samples
RUN make config
RUN ldconfig
RUN systemctl enable asterisk
RUN safe_asterisk

ENV LANG=en_US.utf8 TZ=Asia/Kolkata
