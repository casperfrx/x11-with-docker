FROM debian:bullseye-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y x11-apps \
&&  rm -rf /var/lib/apt/{lists,log,cache}

CMD ["/usr/bin/xeyes"]
