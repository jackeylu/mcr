FROM registry.cn-hangzhou.aliyuncs.com/jackeylv/cpp:tars

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
	&& apt-get -y install --no-install-recommends libboost1.74-all-dev \
	&& apt-get autoremove -y \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*


CMD [ "bash" ]

