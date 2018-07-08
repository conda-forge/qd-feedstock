#!/bin/bash

# There's a ._qd-${PKG_VERSION} file in the root folder along with qd-${PKG_VERSION}
cd "qd-${PKG_VERSION}"

./configure --prefix=${PREFIX} --enable-shared

make
make check
make install
