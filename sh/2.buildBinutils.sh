#!/bin/bash

tar -xf ../tar/binutils-$BINUTILS_VER.tar.xz -C ./src
cd work/binutils
../../src/binutils-$BINUTILS_VER/configure --target=$TARGET --prefix=$PREFIX

# 安装命令
make -j$JOBS_COUNT
make install

# 安装文档
make pdf -j$JOBS_COUNT
find ./ -name "*.pdf" -exec cp {} $PRJROOT \;

