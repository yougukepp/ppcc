#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re

# libc-2.19.so: ELF 32-bit MSB shared object, PowerPC or cisco 4500,
# fileRst = ""

gPowerPCStripStr = r"ppc-p2020-linux-gnu-strip "
gX86StripStr = r"strip "

gFileRstStr = r"^(.*): ((.*?), (.*?),.*), (.*?)$"
gFileRstPattern = re.compile(gFileRstStr)

gElfStr = r"^ELF.*$"
gElfPattern = re.compile(gElfStr)

gX86Str = r"^x86.*$"
gX86Pattern = re.compile(gX86Str)

gPowerPCStr = r"^PowerPC.*$"
gPowerPCPattern = re.compile(gPowerPCStr)

gStrippedStr = r"^stripped$"
gStrippedPattern = re.compile(gStrippedStr)

def Strip(fileName):
    cmd = "file " + fileName
    fileRst = ''
    fileRst = os.popen(cmd).read() 
    
    """
    不符合
    文件名: ELF XXXX, XXX, XXX, XXX, XXX, not stripped
    格式的文件不strip
    """
    mFileRst = gFileRstPattern.match(fileRst)
    if not mFileRst:
        rst = fileRst.strip('\n') + ": can't strip."
        print(rst)
        return 

    """
    stripped过的文件不再strip
    仅仅strip 没有strip的文件
    """
    stripped = mFileRst.group(5)
    mStripped = gStrippedPattern.match(stripped)
    if mStripped:
        rst = fileName + ": stripped, so not strip again."
        print(rst)
        return

    """
    仅仅strip ELF文件
    """
    fileType = mFileRst.group(3)
    mElfPattren = gElfPattern.match(fileType)
    if not mElfPattren:
        rst = fileName + ": " + fileType + " not stripped."
        print(rst)
        return

    """
    PowerPC ELF文件使用相应strip工具
    """
    archType = mFileRst.group(4)
    mArchType = gPowerPCPattern.match(archType)
    if mArchType: 
        cmd = gPowerPCStripStr + " " + fileName
        os.popen(cmd)
        rst = fileName + ": " + fileType + " stripped."
        print(rst)
        return

    """
    X86 ELF文件使用相应strip工具
    """
    archType = mFileRst.group(4)
    mArchType = gX86Pattern.match(archType)
    if mArchType: 
        cmd = gX86StripStr+ " " + fileName
        os.popen(cmd)
        rst = fileName + ": " + fileType + " stripped."
        print(rst)
        return


def WalkStrip(top): 
    for (root, dirs, files) in os.walk(top):
        for f in files:
            fullName = os.path.join(root, f)
            Strip(fullName)

if __name__ == '__main__':
    import sys

    if 2 != len(sys.argv):
        print("strip.py 目录")
        exit()

    if not os.path.exists(sys.argv[1]):
        print("目录无效")
        exit()

    WalkStrip(sys.argv[1])

