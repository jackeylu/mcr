FROM registry.cn-hangzhou.aliyuncs.com/jackeylv/cpp:base

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install build-essential cmake cppcheck valgrind clang lldb llvm \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
