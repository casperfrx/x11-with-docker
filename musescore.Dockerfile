FROM debian:bullseye-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y musescore \
&&  rm -rf /var/lib/apt/{lists,log,cache}

CMD ["/usr/bin/musescore"]

