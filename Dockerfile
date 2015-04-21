FROM ubuntu:14.04.1
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    socat
COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
