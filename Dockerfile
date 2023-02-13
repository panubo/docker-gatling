FROM openjdk:19-jdk-alpine

ENV GATLING_VERSION=3.9.0 GATLING_SHA256=3d9256bcfc7e414b4c505e594464dad5864a403666dd1217228cad61357f2299

# Install
RUN apk add --update bash wget \
  && mkdir -p /opt/gatling && cd /tmp \
  && wget -q -O /tmp/gatling-${GATLING_VERSION}.zip https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${GATLING_VERSION}/gatling-charts-highcharts-bundle-${GATLING_VERSION}-bundle.zip \
  && sha256sum /tmp/gatling-${GATLING_VERSION}.zip \
  && echo "${GATLING_SHA256}  gatling-${GATLING_VERSION}.zip" > /tmp/SHA256SUM \
  && ( cd /tmp; sha256sum -c SHA256SUM || ( echo "Expected $(sha256sum gatling-${GATLING_VERSION}.zip)"; exit 1; )) \
  && unzip /tmp/gatling-${GATLING_VERSION}.zip \
  && mv /tmp/gatling-charts-highcharts-bundle-${GATLING_VERSION}/* /opt/gatling/ \
  && rm -rf /tmp/* /var/cache/apk/* \
  && chmod +x /opt/gatling/bin/*sh

WORKDIR  /opt/gatling

ENTRYPOINT ["/opt/gatling/bin/gatling.sh"]
