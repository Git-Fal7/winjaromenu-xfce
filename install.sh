#!/bin/bash
[ ! -d "build" ] && mkdir build
cd build
sudo make uninstall
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make
sudo make install