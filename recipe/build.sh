#!/bin/sh
mkdir build && cd build

cmake -G "Ninja"                                    \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                \
    -DCMAKE_BUILD_TYPE=Release                      \
    -DBUILD_PYTHON=ON                               \
    -DBUILD_FOR_PYTHON3=ON                          \
    -DBOOST_PYTHON3_COMPONENT=python37              \
    -DBOOST_NUMPY_COMPONENT=numpy37                 \
    -DPYTHON_INSTALL_DIR=$SP_DIR                    \
    -DBUILD_TESTS=OFF                               \
    ..

ninja install
