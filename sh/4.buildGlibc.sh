#!/bin/bash

tar -xf ../tar/glibc-$GLIBC_VER.tar.xz -C ./src

cd src/glibc-$GLIBC_VER

# 避免"cannot find -lgcc_eh"错误
cp -v Makeconfig{,.orig}
sed -e 's/-lgcc_eh//g' Makeconfig.orig > Makeconfig

cd ../../work/glibc

# FIXME: 解决gcc无法支持此类型 -mcpu=e500 -mspe -mabi=spe的问题
#P2020_OPT=' -O2 -mcpu=e500 -mno-powerpc64 -mspe -mcall-linux -mabi=spe -mhard-float '
P2020_OPT=' -O2 -mhard-float -mno-powerpc64 -mcall-linux '

CC=${PRJROOT}/tools/bin/${TARGET}-gcc CFLAGS+=$P2020_OPT ../../src/glibc-2.19/configure --host=$TARGET --prefix="/usr" --enable-add-ons --enable-obsolete-rpc --with-headers=$TARGET_PREFIX/include libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes libc_cv_ssp='no'

# 安装命令
make -j$JOBS_COUNT
make install_root=$TARGET_PREFIX prefix="" install

# 安装文档
make pdf -j$JOBS_COUNT
find ./ -name "*.pdf" -exec cp {} $PRJROOT \;

