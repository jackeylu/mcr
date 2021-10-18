FROM registry.cn-hangzhou.aliyuncs.com/jackeylv/cpp:tars

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install ninja-build \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install blade
RUN cd /usr/ && wget https://github.com/chen3feng/blade-build/archive/refs/tags/v2.0.tar.gz \
    && tar xzvf v2.0.tar.gz

RUN /bin/bash /usr/blade-build-2.0/install

ENV PATH=$PATH:/root/bin

CMD [ "/bin/bash" ]    