FROM registry.cn-hangzhou.aliyuncs.com/jackeylv/cpp:boost

RUN apt-get update && apt-get -y install libaio1 \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/oracle \
    && cd /opt/oracle \
    && wget https://download.oracle.com/otn_software/linux/instantclient/213000/instantclient-basic-linux.x64-21.3.0.0.0.zip \
    && unzip instantclient-basic-linux.x64-21.3.0.0.0.zip \
    && rm instantclient-basic-linux.x64-21.3.0.0.0.zip \
    && wget https://download.oracle.com/otn_software/linux/instantclient/213000/instantclient-sdk-linux.x64-21.3.0.0.0.zip \
    && unzip instantclient-sdk-linux.x64-21.3.0.0.0.zip \
    && rm instantclient-sdk-linux.x64-21.3.0.0.0.zip \
    && echo /opt/oracle/instantclient_21_3 > /etc/ld.so.conf.d/oracle-instantclient.conf \
    && ldconfig

ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_21_3:$LD_LIBRARY_PATH

CMD [ "/bin/bash" ]