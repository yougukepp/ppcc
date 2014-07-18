#!/bin/bash

tar -xf ../tar/linux-$LINUX_VER.tar.xz -C ./src
cd src/linux-$LINUX_VER
mkdir -p $TARGET_PREFIX/include
make distclean
make ARCH=powerpc headers_check
make ARCH=powerpc INSTALL_HDR_PATH=dest headers_install
cp -rvf dest/include/* $TARGET_PREFIX/include
rm -rf dest
cd ../../
