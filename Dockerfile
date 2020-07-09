FROM ubuntu:20.04

RUN apt-get update && \
    apt-get -y --no-install-recommends install openarena-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 27950/udp
EXPOSE 27960/udp

VOLUME /config/baseoa

ENTRYPOINT ["/usr/games/openarena-server"]
CMD ["+set", "fs_homepath". "/config", "+exec", "server.cfg", "+set", "dedicated", "1", "+set", "net_port", "27960"]
