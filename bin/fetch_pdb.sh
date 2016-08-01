#!/bin/sh

name=`echo $1 | tr "A-Z" "a-z"`
wget http://files.rcsb.org/download/$name.pdb
