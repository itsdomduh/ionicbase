# Based on: No thrills Ionic 2 developer environment
# See https://blog.saddey.net/2016/07/03/jump-start-into-angular-2-and-ionic-2

FROM ubuntu:16.04

LABEL description="Ionic" \
      version="1.0" \
      maintainer="dom@dominikdev.com"

RUN apt-get update \
    && apt-get install -y -q \
        curl \
        git \
        unzip \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/*

# install and configure Git LFS support and the BitBucket LFS transport adapter

RUN apt-get update \
    && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
    && apt-get install -y -q git-lfs \
    && git lfs install \
    && curl -o ./bitbucket-lfs-adapter.zip https://downloads.atlassian.com/software/bitbucket/GitLfsBitbucketAdapter-linux-amd64-1.0.5.zip?_ga=1.128223818.734340793.1436549753 \
    && unzip bitbucket-lfs-adapter.zip git-lfs-bitbucket-media-api -d /usr/local/bin \
    && rm bitbucket-lfs-adapter.zip \
    && git config --global lfs.customtransfer.bitbucket-media-api.path /usr/local/bin/git-lfs-bitbucket-media-api \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/*

# install nodejs; nodejs includes matching npm as well
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y -q nodejs \
    && npm install npm@latest \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/*

# install ionic
RUN npm install -g -y cordova ionic


WORKDIR /projects

EXPOSE 8100 35729

# 20-aug-16: Do NOT use VOLUME statement as it may result in numerous 
# orphaned volumes when innocent users or apps just run 
# docker run --rm ... bash
# VOLUME /projects