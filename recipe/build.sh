#!/bin/bash

export LDFLAGS=$(echo "${LDFLAGS}" | sed "s/-Wl,-dead_strip_dylibs//g")
export LDFLAGS=$(echo "${LDFLAGS}" | sed "s/-Wl,--as-needed//g")

autoreconf -fi
chmod +x configure

./configure --prefix=${PREFIX} --enable-shared --host=$HOST || (cat config.log; false)

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check
fi
make install
