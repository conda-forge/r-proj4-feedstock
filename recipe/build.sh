#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

# export LD_LIBRARY_PATH=$PREFIX/lib/:${LD_LIBRARY_PATH}
# export INCLUDE_PATH="${PREFIX}/include":${INCLUDE_PATH}
# export C_INCLUDE_PATH="${PREFIX}/include":${C_INCLUDE_PATH}
# export CPLUS_INCLUDE_PATH="${PREFIX}/include":${CPLUS_INCLUDE_PATH}
# export DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib


if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" == "1" ]]; then
    sed -i "s?\${R_HOME}?${BUILD_PREFIX}?" configure.ac
    autoreconf --force --verbose --install
fi

$R CMD INSTALL --build . ${R_ARGS:-} || cat config.log
