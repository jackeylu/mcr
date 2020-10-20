FROM registry.cn-hangzhou.aliyuncs.com/jackeylv/cpp:dev

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install bison flex psmisc libncurses5-dev zlib1g-dev file \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
