#!/bin/bash

cd $TARGET_PREFIX/lib

# 避免ppc-e500v2-linux-gnu-ld找错库
mv libc.so libc.so.orig
sed -e 's/\/lib\///g' libc.so.orig > libc.so

# 避免ppc-e500v2-linux-gnu-ld找错库
mv libpthread.so libpthread.so.orig
sed -e 's/\/lib\///g' libpthread.so.orig > libpthread.so

cd $PRJROOT/build

cd work/gcc
rm -rf *
../../src/gcc-$GCC_VER/configure --target=$TARGET --prefix=$PREFIX --enable-languages=c,c++
# e500v2 spe
#../../src/gcc-$GCC_VER/configure --target=$TARGET --prefix=$PREFIX --enable-languages=c,c++ --with-cpu=8548 --enable-e500_double --with-long-double-128

# 安装命令
make all -j$JOBS_COUNT
make install

# 安装文档
make pdf -j$JOBS_COUNT
find ./ -name "*.pdf" -exec cp {} $PRJROOT \;

