FROM eclipse-temurin:25.0.3_9-jdk@sha256:e23592541431eaeef5c13c84c21db71f97cdca0e70181ea6222ec9bccac24f6c

RUN apt-get update && \
    apt-get install --yes --no-install-recommends jq && \
    apt-get purge --auto-remove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/test-runner

ADD https://github.com/dpetersanderson/MARS/releases/download/v.4.5.1/Mars4_5.jar /opt/test-runner/Mars4_5.jar

COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
