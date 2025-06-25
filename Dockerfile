FROM openjdk:17-slim-buster

RUN apt-get update && \
    apt-get install -y curl jq && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/test-runner

RUN curl -LO https://github.com/dpetersanderson/MARS/releases/download/v.4.5.1/Mars4_5.jar

COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
