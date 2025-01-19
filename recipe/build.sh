#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

# export LD_LIBRARY_PATH=$PREFIX/lib/:${LD_LIBRARY_PATH}
# export INCLUDE_PATH="${PREFIX}/include":${INCLUDE_PATH}
# export C_INCLUDE_PATH="${PREFIX}/include":${C_INCLUDE_PATH}
# export CPLUS_INCLUDE_PATH="${PREFIX}/include":${CPLUS_INCLUDE_PATH}
# export DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib

configure_args=""
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" == "1" ]]; then
    configure_args="--configure-args='CXX=${CXX_FOR_BUILD} CC=${CC_FOR_BUILD}'"
fi

$R CMD INSTALL --build . ${configure_args} ${R_ARGS:-} || cat config.log
