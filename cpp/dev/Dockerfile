FROM registry.cn-hangzhou.aliyuncs.com/jackeylv/cpp:base

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install build-essential cmake cppcheck valgrind clang lldb llvm

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get -y install bison flex psmisc libncurses5-dev zlib1g-dev file

# install boost
RUN apt-get -y install --no-install-recommends libboost1.74-all-dev

# change the default python
RUN apt-get -y install python3-pip
RUN rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python \ 
    && pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip3 install pip -U 

# install tcmalloc
RUN apt-get -y install libunwind-dev
RUN cd /tmp \
    && wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz  \
    && tar xzvf gperftools-2.9.1.tar.gz && rm -f gperftools-2.9.1.tar.gz

RUN cd /tmp/gperftools-2.9.1 && ./configure  --prefix=/usr/local/gperftools --enable-frame-pointers --with-pic --enable-emergency-malloc \
    && make -j 8 && make install \
    && echo "/usr/local/gperftools/lib" > /etc/ld.so.conf.d/gperftools.conf \
    && ldconfig

# Install blade
RUN apt-get -y install ninja-build
RUN cd /usr/ && wget https://github.com/chen3feng/blade-build/archive/refs/tags/v2.0.tar.gz \
    && tar xzvf v2.0.tar.gz && rm -f v2.0.tar.gz
RUN /bin/bash /usr/blade-build-2.0/install
ENV PATH=$PATH:/root/bin
# add tcmalloc path
RUN ln -s /usr/local/gperftools/lib/libtcmalloc.so /usr/lib/libtcmalloc.so \
    && ln -s /usr/local/gperftools/lib/libprofiler.so /usr/lib/libprofiler.so \
    && ln -s /usr/local/gperftools/lib/libtcmalloc_and_profiler.so /usr/lib/libtcmalloc_and_profiler.so \
    && ln -s /usr/local/gperftools/lib/libtcmalloc_debug.so /usr/lib/libtcmalloc_debug.so \
    && ln -s /usr/local/gperftools/lib/libtcmalloc_minimal.so /usr/lib/libtcmalloc_minimal.so \
    && ln -s /usr/local/gperftools/lib/libtcmalloc_minimal_debug.so /usr/lib/libtcmalloc_minimal_debug.so

RUN echo  "global_config(default_visibility=['PUBLIC'])" > /usr/blade-build-2.0/example/BLADE_ROOT.local

# install vim
RUN apt-get -y install vim && cp /usr/share/vim/vim81/vimrc_example.vim ~/.vimrc

# cleaning
RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash" ]    
