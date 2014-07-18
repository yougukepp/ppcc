#!/bin/bash

cd ./sh
chmod 755 *.sh

. 0.setenv4ppc.sh
cp ./* $PRJROOT/build
cd $PRJROOT/build

echo "开始生成 文档..."
make -C ../doc >> doc.log 2>&1
mv ../doc/*.pdf ../
echo "文档 已经生成."
echo "开始构建 内核头文件..."
./1.buildLinuxHeader.sh >> kernelHeader.log 2>&1
echo "内核头文件构建完毕."
echo "开始构建 binutils..."
./2.buildBinutils.sh >> binutils.log 2>&1
echo "biuntils构建完毕."
echo "开始构建 gcc step1..."
./3.buildGcc1.sh >> gcc1.log 2>&1
echo "gcc step1 构建完毕."
echo "开始构建 glibc..."
./4.buildGlibc.sh >> glibc.log 2>&1
echo "glibc 构建完毕."
echo "开始构建 gcc step2..."
./5.buildGcc2.sh >> gcc2.log 2>&1
echo "gcc step2 构建完毕."

./6.mkdoc.sh >> doc.log 2>&1
echo "制作文档 完毕."

./7.test.sh >> test.log 2>&1
echo "测试 完毕."

echo "整理文档 并存入文档目录."
cd $PRJROOT
rm -rf doc/*
mv *.pdf doc

echo "工具生成与: $PRJROOT/tools 目录."

