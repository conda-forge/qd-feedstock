#!/bin/bash

export LDFLAGS="$LDFLAGS -Wl,-rpath,${PREFIX}/lib"

./configure --prefix=${PREFIX} --enable-shared

make
make check
make install
