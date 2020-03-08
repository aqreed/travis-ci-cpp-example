#!/bin/bash
# calls the code coverage testing program gcov

# fist clean all object files
make clean

# compile all the cpp files, link etc
make 

# run test-library.out, with test coverage (see makefile flags)
./test/test-library

# gcc suite test coverage program
gcov test/lib.cpp

# code coverage is in the file "lib.cpp.gcov"
