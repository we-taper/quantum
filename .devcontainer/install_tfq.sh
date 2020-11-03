#!/bin/bash

pip uninstall -y tensorflow_quantum
echo "Y\n" | ./configure.sh
bazel build -c opt --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" --cxxopt="-msse2" --cxxopt="-msse3" --cxxopt="-msse4" release:build_pip_package && \
    rm /tmp/tensorflow_quantum/* || echo ok && \
    bazel-bin/release/build_pip_package /tmp/tensorflow_quantum/ && \
    pip install -U /tmp/tensorflow_quantum/*.whl
