#!/bin/bash

mkdir -p $PRJROOT/temp
cp $PRJROOT/*.pdf $PRJROOT/temp

rm -rf $PRJROOT/doc

mv $PRJROOT/temp $PRJROOT/doc

