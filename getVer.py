#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
from os.path import join

import re

gSrcDir = 'src'

gSrcNameRe = re.compile(r'^(.*)-(.*)\.tar\.xz$')

def Name2Version(f):
    ver = ''
    match = gSrcNameRe.search(f)
    if match:
        ver = ('%-8s: %-10s') % (match.group(1), match.group(2))

    return ver

def PrintSrcRelease(srdDir):
    fileLst = []
    cwd = join(os.getcwd(), srdDir)
    print('软件包 版本:')
    for root, dirs, files in os.walk(cwd):
        for f in files:
            print(Name2Version(f))

if __name__ == '__main__':
    PrintSrcRelease(gSrcDir)

