#!/bin/sh
mkdir build && cd build

P=$(echo $PY_VER | tr "." "\n")
PYVER=($P)

PY_MAJOR=${PYVER[0]}
PY_MINOR=${PYVER[1]}
if [ $PY3K -eq 1 ]; then
    BUILD_FOR_PYTHON3=ON
    BOOST_PYTHON_COMPONENT="-DBOOST_PYTHON3_COMPONENT=python${PY_MAJOR}${PY_MINOR}"
    BOOST_NUMPY_COMPONENT="-DBOOST_NUMPY_COMPONENT=numpy${PY_MAJOR}${PY_MINOR}"
else
    BUILD_FOR_PYTHON3=OFF
    BOOST_PYTHON_COMPONENT="-DBOOST_PYTHON_COMPONENT=python${PY_MAJOR}${PY_MINOR}"
    BOOST_NUMPY_COMPONENT="-DBOOST_NUMPY_COMPONENT=numpy${PY_MAJOR}${PY_MINOR}"
fi

cmake -G "Ninja"                                    \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                \
    -DCMAKE_BUILD_TYPE=Release                      \
    -DBUILD_PYTHON=ON                               \
    -DBUILD_FOR_PYTHON3=${BUILD_FOR_PYTHON3}        \
    ${BOOST_PYTHON_COMPONENT}                       \
    ${BOOST_NUMPY_COMPONENT}                        \
    -DPYTHON_INSTALL_DIR=$SP_DIR                    \
    -DBUILD_TESTS=OFF                               \
    ..

ninja install
