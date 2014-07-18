#!/bin/sh

# 4 核心 8 threads
export JOBS_COUNT=8

export ARCH=
export CROSS_COMPILE=

export PROJECT=ppcc
export TARGET=ppc-p2020-linux-gnu
export PRJROOT=/opt/${PROJECT}
export PREFIX=${PRJROOT}/tools
export TARGET_PREFIX=${PREFIX}/${TARGET}
export PATH=${PREFIX}/bin:${PATH}

export LINUX_VER=3.12.18
export GCC_VER=4.9.0
export GLIBC_VER=2.19
export BINUTILS_VER=2.24
export GMP_VER=6.0.0a
export MPFR_VER=3.1.2
export MPC_VER=1.0.2

rm -rf $PRJROOT

mkdir -p $PRJROOT/tar
mkdir -p $PRJROOT/build/src/
mkdir -p $PRJROOT/build/work/glibc
mkdir -p $PRJROOT/build/work/gcc
mkdir -p $PRJROOT/build/work/binutils

cp -rf ../src/* ${PRJROOT}/tar
cp -rf ../doc ${PRJROOT}/

#echo $TARGET
#echo $PRJROOT
#echo $PREFIX
#echo $TARGET_PREFIX
#echo $PATH

