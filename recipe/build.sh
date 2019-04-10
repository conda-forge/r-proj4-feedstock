#!/bin/bash

export LD_LIBRARY_PATH=$PREFIX/lib/:${LD_LIBRARY_PATH}
export INCLUDE_PATH="${PREFIX}/include":${INCLUDE_PATH}
export C_INCLUDE_PATH="${PREFIX}/include":${C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH="${PREFIX}/include":${CPLUS_INCLUDE_PATH}
export DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib

# The `ACCEPT_USE_OF_DEPRECATED_PROJ_API_H` is a temporary solution and won't work with proj4 7.
export PKG_CPPFLAGS="-I${PREFIX}/include -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H=1"
export PKG_LIBS="-L$PREFIX/lib"

$R CMD INSTALL --build .
