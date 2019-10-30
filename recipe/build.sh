#!/bin/bash

export LDFLAGS=$(echo "${LDFLAGS}" | sed "s/-Wl,-dead_strip_dylibs//g")
export LDFLAGS=$(echo "${LDFLAGS}" | sed "s/-Wl,--as-needed//g")

./configure --prefix=${PREFIX} --enable-shared || (cat config.log; false)

make -j${CPU_COUNT}
make check
make install
