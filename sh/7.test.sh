#!/bin/bash

$PREFIX/bin/$TARGET-gcc main.c -o main.out

if [ -e main.out ];then 
    echo "测试通过."
else
    echo "测试失败."
fi

rm main.out
