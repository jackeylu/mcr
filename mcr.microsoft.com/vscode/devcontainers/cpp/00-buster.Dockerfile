FROM mcr.microsoft.com/vscode/devcontainers/cpp:dev-buster

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
        && apt-get -y install --no-install-recommends bison flex psmisc libncurses5-dev zlib1g-dev file \
        && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
