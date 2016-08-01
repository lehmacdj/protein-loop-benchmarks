#!/bin/bash

if [ $# -lt 3 ]; then
  echo "usage: init.sh PDB_CODE start end"
  exit;
fi

awk 'BEGIN{start=0; end=0;}
/^ATOM  / {
    rid=substr($0,23,4);
    if(int(rid) == a && !start) {
        printf("TER\n");
        start=1;
    } if(int(rid)==b+1 && !end) {
        printf("TER\n");
        end=1;
    }
    if(start && !end) {
        printf("%sI%s\n",substr($0,1,21),substr($0,23));
    } else {
        print $0;
    }
}
END{ print "END"; }' a=$2 b=$3 $1.pdb
