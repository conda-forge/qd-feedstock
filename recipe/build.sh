#!/bin/bash

export LDFLAGS=$(echo "${LDFLAGS}" | sed "s/-Wl,-dead_strip_dylibs//g")

./configure --prefix=${PREFIX} --enable-shared

make
make check
make install
