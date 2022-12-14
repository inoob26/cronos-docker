FROM debian:bullseye-slim

RUN adduser --disabled-password --gecos "" --no-create-home --uid 1000 cronos

RUN mkdir -p /home/cronos
RUN apt-get update -y && apt-get install wget curl procps net-tools htop jq lz4 -y
RUN cd /tmp && wget --no-check-certificate https://github.com/crypto-org-chain/cronos/releases/download/v0.8.1/cronos_0.8.1_Linux_x86_64.tar.gz && tar -xvf cronos_0.8.1_Linux_x86_64.tar.gz \
    && mv bin/cronosd /home/cronos/cronosd && mv lib /home/cronos/lib/ && mv exe /home/cronos/exe/
RUN chown -R cronos:cronos /home/cronos

USER cronos

ENTRYPOINT ["/home/cronos/cronosd"]