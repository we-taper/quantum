# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.145.1/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version: bionic, focal
ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y pkg-config zip g++ zlib1g-dev unzip python3.8 && \
    apt-get install -y python3.8 python3.8-dev python3.8-venv python3-pip
RUN python3.8 -m pip install --upgrade pip
RUN python3.8 -m pip install -U pip six wheel setuptools mock 'future>=0.17.1' && \
  python3.8 -m pip install -U keras_applications --no-deps && \
  python3.8 -m pip install -U keras_preprocessing --no-deps && \
  python3.8 -m pip install numpy==1.18.0
RUN ln -s /usr/bin/python3 /usr/bin/python
COPY ./ /root/tfq/
WORKDIR /root/tfq/
RUN ./scripts/ci_install.sh
# RUN echo "Y\n" | ./configure.sh
# RUN bazel build -c opt --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" --cxxopt="-msse2" --cxxopt="-msse3" --cxxopt="-msse4" release:build_pip_package && \
#     rm /tmp/tensorflow_quantum/* || echo ok && \
#     bazel-bin/release/build_pip_package /tmp/tensorflow_quantum/ && \
#     pip install -U /tmp/tensorflow_quantum/*.whl
# RUN ./scripts/test_all.sh
