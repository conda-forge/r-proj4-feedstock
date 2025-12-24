#!/bin/bash

set -o xtrace -o nounset -o pipefail -o errexit

export LD_LIBRARY_PATH=$PREFIX/lib/:${LD_LIBRARY_PATH:-}
export INCLUDE_PATH="${PREFIX}/include":${INCLUDE_PATH:-}
export C_INCLUDE_PATH="${PREFIX}/include":${C_INCLUDE_PATH:-}
export CPLUS_INCLUDE_PATH="${PREFIX}/include":${CPLUS_INCLUDE_PATH:-}
export DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib

if [[ ${build_platform} != ${target_platform} ]]; then
    # Directly supply PKG_CFLAGS and PKG_LIBS when cross-compiling instead of using configure script
    rm configure
    sed -e 's?@LIBS@?-lproj?' \
        -e 's?@CPPFLAGS@?-DUSE_PROJ6_API=1 -D_FORTIFY_SOURCE=2?' \
        src/Makevars.in > src/Makevars
fi

$R CMD INSTALL --build . ${R_ARGS:-}
