#!/bin/bash
#
# Generates tests from the .pdbinfo files in tests/

test_files=$(find . -name '*.pdbinfo')

for file in $test_files; do
    
    dir_name=$(basename $file .pdbinfo)
    echo Configuring test $dir_name
    mkdir -p tests/$dir_name
    cd tests/$dir_name
    ../../bin/setup.sh ../../$file
    cd - >/dev/null
done
