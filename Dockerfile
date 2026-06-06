FROM eclipse-temurin:26.0.1_8-jdk@sha256:e1ccbf158a2818db7f770d0159f30a191e512c6a482797c55f7ae04a54247563

RUN apt-get update && \
    apt-get install --yes --no-install-recommends jq && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/test-runner

ADD https://github.com/dpetersanderson/MARS/releases/download/v.4.5.1/Mars4_5.jar /opt/test-runner/Mars4_5.jar

COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
