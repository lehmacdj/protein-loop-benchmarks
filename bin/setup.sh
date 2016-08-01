#!/bin/bash
#
# Downloads all of the pdb for a specific .pdbinfo file

if [ $# -lt 1 ]; then
    echo "Usage: setup.sh <pdbinfo>"
    exit 1
fi

export PATH="$(echo $(cd $(dirname "$0") && pwd -P)):$PATH"

awk '{print $1, $2, $3}' $1 | xargs -n3 make_case.sh 
