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
