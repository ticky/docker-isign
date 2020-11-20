FROM alpine:3.12
MAINTAINER  Jessica Stokes <hello@jessicastokes.net>

RUN apk add \
      --no-cache \
      build-base \
      libffi \
      libffi-dev \
      libimobiledevice \
      libimobiledevice-dev \
      openssl \
      python3 \
      python3-dev \
      py3-pip

WORKDIR /tmp/workdir

ADD requirements.txt .

RUN pip install -r requirements.txt

WORKDIR /

RUN rm -rf /tmp/workdir

CMD ["isign"]
