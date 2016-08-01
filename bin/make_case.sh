#!/bin/bash
#
# Sets up a folder with the requisite files for running a piece of pdb through
# the Medusa server.

if [ $# -lt 1 ]; then
    echo "Usage: make_case.sh <pdb> <start> <end>"
    exit 1
fi

echo Setting up ${1}...
mkdir $1
cd $1
fetch_pdb.sh $1 >/dev/null 2>&1
get_ref_loop.sh $1 $2 $3 | grep " I " >ref-loop.pdb
init.sh $1 $2 $3 | grep -v " I " >pre.pdb
init.sh $1 $2 $3 | grep " I " | awk '{print $3, $4}' | grep "N " | awk '{print $2}' > seq
