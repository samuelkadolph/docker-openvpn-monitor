# docker-openvpn-monitor

[![Build Status](https://img.shields.io/travis/com/samuelkadolph/docker-openvpn-monitor.svg?style=for-the-badge)](https://travis-ci.com/samuelkadolph/docker-openvpn-monitor/ "Build Status")
[![Docker Pulls](https://img.shields.io/docker/pulls/samuelkadolph/openvpn-monitor.svg?style=for-the-badge)](https://hub.docker.com/r/samuelkadolph/openvpn-monitor/ "Docker Pulls")
[![Docker Stars](https://img.shields.io/docker/stars/samuelkadolph/openvpn-monitor.svg?style=for-the-badge)](https://hub.docker.com/r/samuelkadolph/openvpn-monitor/ "Docker Stars")
[![MIT License](https://img.shields.io/github/license/samuelkadolph/docker-openvpn-monitor.svg?style=for-the-badge)](LICENSE "MIT License")

## Usage

```
docker run --detach --name=openvpn-monitor \
           --publish 8080:80
           --restart unless-stopped \
           --volume /app/openvpn-monitor:/config \
           samuelkadolph/openvpn-monitor
```

Edit `/app/openvpn-monitor/openvpn-monitor.conf` and then visit
`http://localhost:8080/`.

## MaxMind

You will want to leave the `geoip_data=/var/lib/GeoIP/GeoLite2-City.mmdb` line
in the config file as this docker image downloads the [MaxMind GeoLite2-City](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data)
to that file.

The GeoLite2-City database is updated [every Tuesday](https://support.maxmind.com/geoip-faq/databases-and-database-updates/how-often-are-the-geoip2-and-geoip-legacy-databases-updated/).
This image should be automatically built and pushed every Wednesday morning by
6:00 UTC. You might wish to have your docker container recreated at such time
for the latest GeoLite2-City database.
