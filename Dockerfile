FROM python:3.7-alpine3.9

MAINTAINER samuel@kadolph.com

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="openvpn-monitor"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/samuelkadolph/docker-openvpn-monitor"

RUN wget -O - https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz | tar -zxC /

RUN mkdir /var/lib/GeoIP && \
    wget -O - https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz | tar -zxC /var/lib/GeoIP && \
    mv /var/lib/GeoIP/GeoLite2-City_*/GeoLite2-City.mmdb /var/lib/GeoIP/GeoLite2-City.mmdb

RUN mkdir /config /openvpn-monitor && \
    wget -O - https://github.com/furlongm/openvpn-monitor/archive/9af350b.tar.gz | tar --strip-components=1 -zxC /openvpn-monitor && \
    ln -s /config/openvpn-monitor.conf /openvpn-monitor/openvpn-monitor.conf && \
    touch /openvpn-monitor/openvpn-monitor.conf && \
    pip install gunicorn /openvpn-monitor

COPY root /

EXPOSE 80

WORKDIR /openvpn-monitor

VOLUME ["/config"]

ENTRYPOINT ["/init"]
