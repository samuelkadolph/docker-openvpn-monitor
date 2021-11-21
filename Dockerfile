FROM python:3.9-alpine

MAINTAINER samuel@kadolph.com

ARG BUILD_DATE
ARG VCS_REF

RUN wget -O - https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz | tar -zxC /

COPY root /

RUN mkdir /config /openvpn-monitor && \
    wget -O - https://github.com/furlongm/openvpn-monitor/archive/ddb9d31.tar.gz | tar --strip-components=1 -zxC /openvpn-monitor && \
    ln -s /config/openvpn-monitor.conf /openvpn-monitor/openvpn-monitor.conf && \
    touch /openvpn-monitor/openvpn-monitor.conf && \
    pip install gunicorn /openvpn-monitor

RUN --mount=type=secret,id=MAXMIND_LICENSE_KEY /bin/download-geolite

LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="openvpn-monitor"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/samuelkadolph/docker-openvpn-monitor"

EXPOSE 80

WORKDIR /openvpn-monitor

VOLUME ["/config"]

ENTRYPOINT ["/init"]
