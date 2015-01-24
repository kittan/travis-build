#!/bin/sh

install_libtool()
{
  sudo apt-get install libtool autoconf automake uuid-dev build-essential
}


install_zeromq()
{
  cd /tmp && mkdir -p zeromq
  curl -L http://download.zeromq.org/zeromq-4.1.0-rc1.tar.gz | tar xvzf - -C zeromq --strip-components=1
  cd zeromq
  ./autogen.sh
  ./configure --disable-dependency-tracking LDFLAGS="-lstdc++" --disable-shared --enable-static
  make && sudo make install
  rm -rf /tmp/zeromq
  sudo ldconfig
}

install_libtool
install_zeromq
