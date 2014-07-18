#!/bin/bash

tar -xf ../tar/gcc-$GCC_VER.tar.xz -C ./src
tar -xf ../tar/gmp-$GMP_VER.tar.xz -C ./src
tar -xf ../tar/mpc-$MPC_VER.tar.xz -C ./src
tar -xf ../tar/mpfr-$MPFR_VER.tar.xz -C ./src
mv ./src/gmp-$GMP_VER ./src/gcc-$GCC_VER/gmp
mv ./src/mpc-$MPC_VER ./src/gcc-$GCC_VER/mpc
mv ./src/mpfr-$MPFR_VER ./src/gcc-$GCC_VER/mpfr

cd work/gcc
../../src/gcc-$GCC_VER/configure --target=$TARGET --prefix=$PREFIX --disable-shared --without-headers --with-newlib --enable-languages=c --disable-decimal-float --disable-libgomp --disable-libmudflap --disable-libssp --disable-threads --disable-multilib

make all-gcc -j$JOBS_COUNT
make all-target-libgcc -j$JOBS_COUNT
make install-gcc
make install-target-libgcc

