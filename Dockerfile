FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update \
    && apt-get install --yes python3 python3-pip git \
    && cd /usr/local/share \
    && git clone --depth=1 https://github.com/coreycb/bom-jjb-config.git \
    && cd /usr/local/src \
    && git clone --depth=1 https://opendev.org/jjb/jenkins-job-builder.git \
    && cd /usr/local/src/jenkins-job-builder \
    && pip3 install -r requirements.txt \
    && python3 setup.py install

ENTRYPOINT ["/usr/local/bin/jenkins-jobs"]
