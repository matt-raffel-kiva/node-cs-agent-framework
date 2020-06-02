FROM ubuntu:18.04
ENV PATH /root/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV SODIUM_LIB_DIR /usr/local/lib
ENV LD_LIBRARY_PATH /usr/local/lib
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update && apt-get install -y \
    git \
    wget \
    vim \
    gnupg \
    apt-transport-https \
    ca-certificates \
    apt-utils
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 && \
    echo "deb https://repo.sovrin.org/deb xenial master" >> /etc/apt/sources.list && \
    apt-get update
# very common packages
RUN apt-get update && apt-get install -y \
    cmake \
    sudo \
    autoconf \
    libtool \
    curl \
    python3 \
    pkg-config \
    libssl-dev \
    python3-nacl \
# rocksdb python wrapper
    libbz2-dev \
    zlib1g-dev \
    liblz4-dev \
    libsnappy-dev \
    rocksdb=5.8.8
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb  && \
    dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
WORKDIR /root
RUN cd /usr/lib/x86_64-linux-gnu \
    && ln -s libssl.so.1.0.0 libssl.so.10 \
    && ln -s libcrypto.so.1.0.0 libcrypto.so.10 \
    && curl -fsSL https://github.com/jedisct1/libsodium/archive/1.0.18.tar.gz | tar -xz \
    && cd libsodium-1.0.18 \
    && ./autogen.sh \
    && ./configure \
    && make install \
    && cd .. \
    && rm -rf libsodium-1.0.18 \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN echo "deb https://repo.sovrin.org/sdk/deb xenial stable" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    ursa=0.3.2-2 \
    python3-nacl \
    libindy-crypto=0.4.5 \
    libindy=1.8.2
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get install apt-transport-https
RUN apt-get update && \
    apt-get install -y dotnet-sdk-3.1
RUN curl -sL https://deb.nodesource.com/setup_9.x  | bash && \
    apt-get -y install nodejs
