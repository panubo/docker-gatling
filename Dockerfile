FROM java:8-jdk-alpine

ENV GATLING_VERSION=2.3.0 GATLING_SHA256=d6d1eb514b1367310879db1f5fcd14ea22c40619469abde5f2a5c3d471a4dacd

# Install
RUN apk add --update wget \
  && mkdir -p /opt/gatling && cd /tmp \
  && wget -q -O /tmp/gatling-${GATLING_VERSION}.zip https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${GATLING_VERSION}/gatling-charts-highcharts-bundle-${GATLING_VERSION}-bundle.zip \
  && sha256sum /tmp/gatling-${GATLING_VERSION}.zip \
  && echo "${GATLING_SHA256}  gatling-${GATLING_VERSION}.zip" | sha256sum -c - \
  && unzip /tmp/gatling-${GATLING_VERSION}.zip \
  && mv /tmp/gatling-charts-highcharts-bundle-${GATLING_VERSION}/* /opt/gatling/ \
  && rm -rf /tmp/* /var/cache/apk/*

WORKDIR  /opt/gatling

ENTRYPOINT ["/opt/gatling/bin/gatling.sh"]
