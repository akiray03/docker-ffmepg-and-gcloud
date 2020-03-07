FROM python:3.7.2-stretch

RUN set -ex \
    && cd /tmp \
    && wget --no-verbose https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
    && tar Jxvf ./ffmpeg-release-amd64-static.tar.xz -C /usr/local \
    && cd /usr/local \
    && ln -s ffmpeg* ffmpeg

ENV PATH /usr/local/ffmpeg:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /app

RUN set -ex \
    && export CLOUD_SDK_REPO="cloud-sdk-stretch" \
    && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && apt-get update -y \
    && apt-get install google-cloud-sdk -y

RUN pip install google-cloud-speech